/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.HistoireDao;
import dao.HistoireDaoImpl;
import model.Histoire;

/**
 *
 * @author mathieu_canzerini
 */
public class GetHistoire extends ActionSupport {

    private Histoire histoire;
    public static final HistoireDao histoireDao = new HistoireDaoImpl();

    @Override
    public String execute() throws Exception {
        setHistoire(histoireDao.find(1));
        return SUCCESS;
    }

    public Histoire getHistoire() {
        return histoire;
    }

    public void setHistoire(Histoire histoire) {
        this.histoire = histoire;
    }

}
