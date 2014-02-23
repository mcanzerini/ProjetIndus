/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.InformationDao;
import dao.InformationDaoImpl;
import exception.NotLoggedException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Information;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ModifInfo extends ActionSupport {

    public static final InformationDao informationDao = InformationDaoImpl.getInstance();

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String contenu = request.getParameter("contenu");
            String idInfo = request.getParameter("id");
            int idInfoInt = Integer.parseInt(idInfo);
            Information information = informationDao.find(idInfoInt);
            information.setContent(contenu);
            informationDao.update(information);
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            throw new NotLoggedException();
        }
    }
}
