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
import dao.HistoireDao;
import dao.HistoireDaoImpl;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Histoire;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ModifHistoire extends ActionSupport {

    public static final HistoireDao histoireDao = HistoireDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String contenu = request.getParameter("contenu");
            Histoire histoire = histoireDao.find(1);
            histoire.setContent(contenu);
            histoireDao.update(histoire);
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }
}
