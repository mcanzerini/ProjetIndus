/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.InformationDao;
import dao.InformationDaoImpl;
import java.util.List;
import model.Information;

/**
 *
 * @author mathieu_canzerini
 */
public class Index extends ActionSupport {

    private List<Information> informations;
    public static final InformationDao informationDao = InformationDaoImpl.getInstance();

    /**
     *
     * @return @throws Exception
     */
    @Override
    public String execute() throws Exception {
        setInformations(informationDao.findAll());
        return SUCCESS;
    }

    public List<Information> getInformations() {
        return informations;
    }

    public void setInformations(List<Information> informations) {
        this.informations = informations;
    }

}
