/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.CompetitionDao;
import dao.CompetitionDaoImpl;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import dao.ResultatDao;
import dao.ResultatDaoImpl;
import exception.NotLoggedException;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Competition;
import model.Licencie;
import model.Resultat;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class NewResultat extends ActionSupport {

    public static final ResultatDao resultatDao = ResultatDaoImpl.getInstance();
    public static final CompetitionDao competitionDao = CompetitionDaoImpl.getInstance();
    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();
    private InputStream stream;
    private List<Resultat> resultats;

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String nomLicencie, prenomLicencie;
            Long idCompetition;
            Boolean individuel;
            Integer place;
            Resultat newResultat = new Resultat();
            try {
                idCompetition = Long.valueOf(request.getParameter("idCompetition"));
                individuel = Boolean.valueOf(request.getParameter("individuel"));
                place = Integer.parseInt(request.getParameter("place"));
            } catch (NumberFormatException e) {
                // probleme de parametre
                System.out.println("1");
                return ERROR;
            }
            if (!individuel) {
                String equipe = request.getParameter("equipe");
                if (equipe != null && !equipe.equals("")) {
                    // equipe vide
                    return ERROR;
                }
                newResultat.setEquipe(equipe);
            } else {
                nomLicencie = request.getParameter("nomLicencie");
                prenomLicencie = request.getParameter("prenomLicencie");
                List<Licencie> licencies = licencieDao.findByNomPrenom(nomLicencie, prenomLicencie);
                if (licencies == null || licencies.isEmpty()) {
                    // pas de licencie
                    System.out.println("2");
                    return ERROR;
                }
                if (licencies.size() > 1) {
                    // des licencies ont le même nom et le meme prenom
                    System.out.println("3");
                    return ERROR;
                }
                Licencie licencie = licencies.get(0);

                Competition competition = competitionDao.find(idCompetition);

                if (competition == null || licencie == null) {
                    // Pas de competition trouvée ou pas de licencie trouveé
                    return ERROR;
                }
                if (individuel && !resultatDao.findByLicencieCompet(licencie.getNom(), licencie.getPrenom(), competition.getId()).isEmpty()) {
                    // Un couple (compet, licencie) existe deja
                    return ERROR;
                }
                newResultat.setCompetition(competition);
                newResultat.setLicencie(licencie);
                newResultat.setCategorieAge(licencie.getCategorieAge());
                newResultat.setCategoriePoids(licencie.getCategoriePoids());
            }

            newResultat.setIndividuel(individuel);
            newResultat.setPlace(place);
            resultatDao.create(newResultat);
            resultats = resultatDao.findByCompet(newResultat.getCompetition().getId());
            StringBuilder html = new StringBuilder();
            int i = 0;
            for (Resultat resultat : resultats) {
                html.append("<tr><td>");
                html.append(resultat.getLicencie().getNom());
                html.append("</td><td>");
                html.append(resultat.getLicencie().getPrenom());
                html.append("</td><td>");
                html.append(resultat.getPlace());
                html.append("<s:if test=\"#session.logined == 'true'\"><button onclick=\"deleteResultat(");
                html.append(resultat.getId());
                html.append(")\" class=\"pull-right btn btn-danger\">Supprimer</button><button onclick=\"modifierResultat(");
                html.append(resultat.getId());
                html.append(",");
                html.append(i);
                html.append(",");
                html.append(resultat.getPlace());
                html.append(")\" class=\"pull-right btn btn-primary\">Modifier</button></s:if></td></td></tr>");
                i++;
            }
            stream = new ByteArrayInputStream(html.toString().getBytes());
            return SUCCESS;

        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            throw new NotLoggedException();
        }
    }

    public InputStream getStream() {
        return stream;
    }

    public void setStream(InputStream stream) {
        this.stream = stream;
    }

    public List<Resultat> getResultats() {
        return resultats;
    }

    public void setResultats(List<Resultat> resultats) {
        this.resultats = resultats;
    }

}
