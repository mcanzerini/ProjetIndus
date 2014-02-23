/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.MembreDao;
import dao.MembreDaoImpl;
import exception.NotLoggedException;
import java.util.Calendar;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class Connecter extends ActionSupport {

    private String mdpBase;
    public static final MembreDao membreDao = MembreDaoImpl.getInstance();

    @Override
    public String execute() throws NotLoggedException {
        HttpServletRequest request = ServletActionContext.getRequest();
        String mdpEntre = request.getParameter("password");
        String loginEntre = request.getParameter("login");
        mdpBase = membreDao.getMdpByLogin(loginEntre);
        if (mdpBase != null && motDePasseOk(mdpBase, mdpEntre)) {
            Map session = ActionContext.getContext().getSession();
            session.put("logined", "true");
            session.put("login", loginEntre);
            session.put("context", Calendar.getInstance());
            return SUCCESS;
        } else {
            throw new NotLoggedException();
        }
    }

    public boolean motDePasseOk(String mdpBase, String mdpEntre) {
        return mdpBase.equals(ActionUtils.md5Java(mdpEntre));
    }

    public String getMdpBase() {
        return mdpBase;
    }

    public void setMdpBase(String mdpBase) {
        this.mdpBase = mdpBase;
    }

}
