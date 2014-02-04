/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.CompetitionDao;
import dao.CompetitionDaoImpl;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import model.Competition;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class FindCompetition extends ActionSupport {

    public static final CompetitionDao competitionDao = CompetitionDaoImpl.getInstance();
    private InputStream stream;

    public InputStream getStream() {
        return stream;
    }

    public void setStream(InputStream stream) {
        this.stream = stream;
    }

    @Override
    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String idString = request.getParameter("data");
        Integer id = null;
        try {
            id = Integer.parseInt(idString);
        } catch (NumberFormatException e) {
            // Error a traiter : mauvais parametre (pas un nombre)
        }
        Competition competition = competitionDao.find(id);
        String niveau = competition.getNiveau().toString();
        StringBuilder resultat = new StringBuilder();
        resultat.append("{\"codePostal\":\"");
        resultat.append(competition.getLieu().getCodePostal());
        resultat.append("\",\"niveau\":\"");
        resultat.append(competition.getNiveau().toString());
        resultat.append("\",\"nom\":\"");
        resultat.append(competition.getNom());
        resultat.append("\",\"numVoie\":\"");
        resultat.append(competition.getLieu().getNumVoie());
        resultat.append("\",\"nomVoie\":\"");
        resultat.append(competition.getLieu().getNomVoie());
        resultat.append("\",\"pays\":\"");
        resultat.append(competition.getLieu().getPays());
        resultat.append("\",\"ville\":\"");
        resultat.append(competition.getLieu().getVille());
        resultat.append("\",\"photo\":\"");
        resultat.append(competition.getPhotoPrincipale());
        resultat.append("\",\"programme\":\"");
        resultat.append(competition.getLienProgramme());
        resultat.append("\",\"date\":\"");
        resultat.append(competition.getDate().get(Calendar.DAY_OF_MONTH));
        resultat.append("/");
        resultat.append((competition.getDate().get(Calendar.MONTH) + 1));
        resultat.append("/");
        resultat.append(competition.getDate().get(Calendar.YEAR));
        resultat.append("\"}");
        stream = new ByteArrayInputStream(resultat.toString().getBytes());
        return SUCCESS;
    }

}
