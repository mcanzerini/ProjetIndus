/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.EntraineurDao;
import dao.EntraineurDaoImpl;
import exception.NotLoggedException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Entraineur;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class DeleteEntraineur extends ActionSupport {

    public static final EntraineurDao entraineurDao = EntraineurDaoImpl.getInstance();

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idEntraineur = request.getParameter("id");
            int idEntraineurInt = Integer.parseInt(idEntraineur);
            Entraineur entraineur = entraineurDao.find(idEntraineurInt);
            entraineurDao.delete(entraineur);
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            throw new NotLoggedException();
        }
    }
}
