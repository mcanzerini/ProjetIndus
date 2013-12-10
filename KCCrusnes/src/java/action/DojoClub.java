/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.DojoDao;
import dao.DojoDaoImpl;
import model.Dojo;

/**
 *
 * @author mathieu_canzerini
 */
public class DojoClub extends ActionSupport {

    private Dojo dojo;
    public static final DojoDao dojoDao = DojoDaoImpl.getInstance();

    public String execute() throws Exception {
        dojo = dojoDao.find(1);
        return SUCCESS;
    }

    public Dojo getDojo() {
        return dojo;
    }

    public void setDojo(Dojo dojo) {
        this.dojo = dojo;
    }
}
