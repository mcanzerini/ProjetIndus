/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;

/**
 *
 * @author mathieu_canzerini
 */
public class AjoutLicencie extends ActionSupport {

    private List<String> myErrors;

    @Override
    public String execute() {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            myErrors = (List<String>) session.get("myErrors");
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
}
