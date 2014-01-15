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
import dao.HibernateFactory;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import dao.MembreDao;
import dao.MembreDaoImpl;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
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
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String profession = request.getParameter("profession");
            //String noms = request.getParameter("nom");
            String poste = request.getParameter("poste");
            String idLicencie = request.getParameter("idLicencie");
            //Licencie licencie = licencieDao.find(Integer.parseInt(idLicencie));
            Membre ancienMembre = membreDao.findActifByPoste(PosteComite.valueOf(poste));
            ancienMembre.setDateFinActivite((GregorianCalendar) Calendar.getInstance());
            membreDao.update(ancienMembre);
            Membre nouveauMembre;
            try {
                int idLicencieInt = Integer.parseInt(idLicencie);
                nouveauMembre = membreDao.find(idLicencieInt);
                if (nouveauMembre == null) {
                    HibernateFactory.currentSession().createSQLQuery("INSERT INTO Membre(id_personne,date_debut_activite	,poste,profession) "
                            + "VALUES(:idLicencie,:date,:poste,:profession)").setParameter("idLicencie", idLicencieInt).setParameter("date", Calendar.getInstance()).setParameter("poste", poste).setParameter("profession", profession).executeUpdate();
                    /*nouveauMembre.setId(idLicencieInt);
                     nouveauMembre.setPoste(PosteComite.valueOf(poste));
                     nouveauMembre.setDateDebutActivite((GregorianCalendar) Calendar.getInstance());
                     nouveauMembre.setDateFinActivite(null);
                     if (profession != null && !profession.equals("")) {
                     nouveauMembre.setProfession(profession);
                     }
                     membreDao.updateReally(nouveauMembre);*/
                } else {
                    if (profession != null && !profession.equals("")) {
                        nouveauMembre.setProfession(profession);
                    }
                    nouveauMembre.setPoste(PosteComite.valueOf(poste));
                    nouveauMembre.setDateDebutActivite((GregorianCalendar) Calendar.getInstance());
                    nouveauMembre.setDateFinActivite(null);
                    membreDao.update(nouveauMembre);
                }

            } catch (NumberFormatException e) {
                // Rajouter un message d'erreur propre
                return ERROR;
            }

            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }
}
