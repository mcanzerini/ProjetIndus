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
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import dao.MembreDao;
import dao.MembreDaoImpl;
import exception.NotLoggedException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Licencie;
import model.Membre;
import model.PosteComite;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ModifMembre extends ActionSupport {

    public static final MembreDao membreDao = MembreDaoImpl.getInstance();
    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String profession = request.getParameter("profession");
            //String noms = request.getParameter("nom");
            String poste = request.getParameter("poste");
            String idLicencie = request.getParameter("idLicencie");
            try {
                int idLicencieInt = Integer.parseInt(idLicencie);
                Licencie licencie = licencieDao.find(idLicencieInt);
                if (licencie == null) {
                    // Le licencie n'existe pas
                    session.put("errorMessage", "Le licencié mentionné n'éxiste pas");
                    return ERROR;
                }
                Membre ancienMembre = membreDao.findActifByPoste(PosteComite.valueOf(poste));
                ancienMembre.setDateFinActivite((GregorianCalendar) Calendar.getInstance());
                membreDao.update(ancienMembre);
                Membre nouveauMembre;
                nouveauMembre = membreDao.findByLicencie(licencie);
                if (nouveauMembre == null) {
                    nouveauMembre = new Membre();
                    nouveauMembre.setLicencie(licencie);
                    nouveauMembre.setPoste(PosteComite.valueOf(poste));
                    nouveauMembre.setDateDebutActivite((GregorianCalendar) Calendar.getInstance());
                    nouveauMembre.setDateFinActivite(null);
                    if (profession != null && !profession.equals("")) {
                        nouveauMembre.setProfession(profession);
                    }
                    membreDao.create(nouveauMembre);
                } else if (nouveauMembre.getDateFinActivite() != null) {
                    nouveauMembre.setPoste(PosteComite.valueOf(poste));
                    nouveauMembre.setDateDebutActivite((GregorianCalendar) Calendar.getInstance());
                    nouveauMembre.setDateFinActivite(null);
                    if (profession != null && !profession.equals("")) {
                        nouveauMembre.setProfession(profession);
                    }
                    membreDao.update(nouveauMembre);
                } else {
                    // erreur le licencie a deja un autre poste
                    session.put("errorMessage", "Le licencié mentionné possède déjà un poste au sein du comité directeur");
                    return ERROR;
                }

            } catch (NumberFormatException e) {
                // Rajouter un message d'erreur propre
                session.put("errorMessage", "Le licencié mentionné n'éxiste pas");
                return ERROR;
            }
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            throw new NotLoggedException();
        }
    }
}
