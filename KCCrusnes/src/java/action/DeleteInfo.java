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
public class DeleteInfo extends ActionSupport {

    public static final InformationDao informationDao = InformationDaoImpl.getInstance();

    public String execute() {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idInfo = request.getParameter("id");
            int idInfoInt = Integer.parseInt(idInfo);
            Information information = informationDao.find(idInfoInt);
            informationDao.delete(information);
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }
}
