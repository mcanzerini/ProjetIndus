/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Licencie;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class PreModifLicencie extends ActionSupport {

    private List<String> myErrors;
    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();
    private Licencie licencie;

    @Override
    public String execute() {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            myErrors = (List<String>) session.get("myErrors");
            HttpServletRequest request = ServletActionContext.getRequest();
            String idLicencieString = request.getParameter("idLicencie");
            try {
                licencie = licencieDao.find(Long.valueOf(idLicencieString));
            } catch (NumberFormatException e) {
                // id n'est pas un entier
                return ERROR;
            }
            if (myErrors != null) {
                session.remove("myErrors");
            }
            return SUCCESS;
        } else {
            // non connecté
            return ERROR;
        }

    }

    public List<String> getMyErrors() {
        return myErrors;
    }

    public void setMyErrors(List<String> myErrors) {
        this.myErrors = myErrors;
    }

    public Licencie getLicencie() {
        return licencie;
    }

    public void setLicencie(Licencie licencie) {
        this.licencie = licencie;
    }

}
