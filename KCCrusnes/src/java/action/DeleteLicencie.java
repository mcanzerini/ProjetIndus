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
import dao.HibernateFactory;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import dao.MembreDao;
import dao.MembreDaoImpl;
import dao.ResultatDao;
import dao.ResultatDaoImpl;
import java.io.File;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Entraineur;
import model.Licencie;
import model.Membre;
import model.Resultat;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Transaction;

/**
 *
 * @author mathieu_canzerini
 */
public class DeleteLicencie extends ActionSupport {

    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();
    public static final ResultatDao resultatDao = ResultatDaoImpl.getInstance();
    public static final MembreDao membreDao = MembreDaoImpl.getInstance();
    public static final EntraineurDao entraineurDao = EntraineurDaoImpl.getInstance();

    private ServletContext context;

    @Override
    public String execute() {
        Map session = ActionContext.getContext().getSession();
        try {
            if (session.get("logined") != null && session.get("logined").equals("true")) {
                HttpServletRequest request = ServletActionContext.getRequest();
                String idLicencie = request.getParameter("idLicencie");
                int idLicencieInt = Integer.parseInt(idLicencie);
                Licencie licencie = licencieDao.find(idLicencieInt);
                List<Resultat> resultats = resultatDao.findByCompet(idLicencieInt);
                Transaction t = HibernateFactory.currentSession().beginTransaction();
                //t.begin();
                Membre membre = membreDao.findByLicencie(licencie);
                Entraineur entraineur = entraineurDao.findByLicencie(licencie);

                context = ServletActionContext.getServletContext();
                String path = context.getRealPath("") + ActionUtils.PATH_TO_LICENCIE + licencie.getPhoto();
                File photoFile = new File(path);

                for (Resultat resultat : resultats) {
                    resultatDao.delete(resultat);
                }
                if (entraineur != null) {
                    entraineurDao.delete(entraineur);
                }
                if (membre != null) {
                    membreDao.delete(membre);
                }
                licencieDao.delete(licencie);

                photoFile.delete();

                if (!t.wasCommitted()) {
                    t.commit();
                }
                return SUCCESS;
            } else {
                // L'utilisateur n'est pas connecte
                // Gerer les erreurs
                return ERROR;
            }
        } catch (NumberFormatException e) {
            // Id fourni pas de type int
            return ERROR;
        }
    }

    public ServletContext getContext() {
        return context;
    }

    public void setContext(ServletContext context) {
        this.context = context;
    }

}
