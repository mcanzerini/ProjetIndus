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
import dao.EvenementDao;
import dao.EvenementDaoImpl;
import dao.ResultatDao;
import dao.ResultatDaoImpl;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Evenement;
import model.Resultat;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class DeleteEvenement extends ActionSupport {

    public static final EvenementDao evenementDao = EvenementDaoImpl.getInstance();
    public static final ResultatDao resultatDao = ResultatDaoImpl.getInstance();

    @Override
    public String execute() {
        Map session = ActionContext.getContext().getSession();
        try {
            if (session.get("logined") != null && session.get("logined").equals("true")) {
                HttpServletRequest request = ServletActionContext.getRequest();
                String idEvenement = request.getParameter("id");
                int idEvenementInt = Integer.parseInt(idEvenement);
                Evenement evenement = evenementDao.find(idEvenementInt);
                List<Resultat> resultats = resultatDao.findByCompet(idEvenementInt);
                for (Resultat resultat : resultats) {
                    resultatDao.delete(resultat);
                }
                evenementDao.delete(evenement);
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
}
