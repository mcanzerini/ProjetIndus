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
import dao.HoraireDao;
import dao.HoraireDaoImpl;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Horaire;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class DeleteHoraire extends ActionSupport {

    public static final HoraireDao horaireDao = HoraireDaoImpl.getInstance();

    public String execute() {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idHoraire = request.getParameter("id");
            int idHoraireInt = Integer.parseInt(idHoraire);
            Horaire horaire = horaireDao.find(idHoraireInt);
            horaireDao.delete(horaire);
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }
}
