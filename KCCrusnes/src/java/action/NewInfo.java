/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.InformationDao;
import dao.InformationDaoImpl;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Information;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class NewInfo extends ActionSupport {

    public static final InformationDao informationDao = InformationDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String priorite = request.getParameter("priorite");
            String contenu = request.getParameter("contenu");
            Information information = new Information();
            information.setContent(contenu);
            int prioriteInt = Integer.parseInt(priorite);
            String type;
            if (prioriteInt == 1) {
                type = "<span class=\"label label-info\">Information</span>";
            } else if (prioriteInt == 2) {
                type = "<span class=\"label label-important\">Important</span>";
            } else {
                type = "<span class=\"label\">Divers</span>";
            }
            information.setType(type);
            informationDao.create(information);
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }
}
