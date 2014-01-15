/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author mathieu_canzerini
 */
public class Deconnexion extends ActionSupport {

    @Override
    public String execute() throws Exception {
        ActionContext.getContext().getSession().clear();
        return SUCCESS;
    }

}
