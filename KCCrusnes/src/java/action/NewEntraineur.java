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
import dao.EntraineurDao;
import dao.EntraineurDaoImpl;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import exception.NotLoggedException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Entraineur;
import model.Licencie;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class NewEntraineur extends ActionSupport {

    public static final EntraineurDao entraineurDao = EntraineurDaoImpl.getInstance();
    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idLicencie = request.getParameter("idLicencie");
            String diplome = request.getParameter("diplome");
            String kataString = request.getParameter("kata");
            String kumiteString = request.getParameter("kumite");
            Entraineur nouvelEntraineur;
            try {
                int idLicencieInt = Integer.parseInt(idLicencie);
                Licencie licencie = licencieDao.find(idLicencieInt);
                nouvelEntraineur = entraineurDao.findByLicencie(licencie);
                if (nouvelEntraineur == null) {
                    nouvelEntraineur = new Entraineur();
                    if (kataString != null && !kataString.equals("")) {
                        nouvelEntraineur.setKata(true);
                    }
                    if (kumiteString != null && !kumiteString.equals("")) {
                        nouvelEntraineur.setKumite(true);
                    }
                    nouvelEntraineur.setLicencie(licencie);
                    if (diplome != null && !diplome.equals("")) {
                        nouvelEntraineur.setDiplome(diplome);
                    }
                    entraineurDao.create(nouvelEntraineur);
                } else {
                    // erreur le licencie a deja un poste d'entraineur
                    session.put("errorMessage", "Le licencié a déjà un poste d'entraineur");
                    session.put("action", "new");
                    return ERROR;
                }

            } catch (NumberFormatException e) {
                // Rajouter un message d'erreur propre
                session.put("action", "new");
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
