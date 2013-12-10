/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Grade;
import model.Licencie;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ResultatsGrade extends ActionSupport {

    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();
    private List<Licencie> licencies;
    private String grade;

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        grade = request.getParameter("grade");
        licencies = licencieDao.findByGrade(Grade.valueOf(grade));
        return SUCCESS;
    }

    public List<Licencie> getLicencies() {
        return licencies;
    }

    public void setLicencies(List<Licencie> licencies) {
        this.licencies = licencies;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

}
