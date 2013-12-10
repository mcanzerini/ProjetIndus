/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class Prenoms extends ActionSupport {

    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();
    private InputStream stream;
    private String prenoms;

    public InputStream getStream() {
        return stream;
    }

    public void setStream(InputStream stream) {
        this.stream = stream;
    }

    @Override
    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String nom = request.getParameter("data");
        prenoms = licencieDao.getFirstNameTypeHeadFromName(nom);
        stream = new ByteArrayInputStream(prenoms.getBytes());
        return SUCCESS;
    }

    public String getPrenoms() {
        return prenoms;
    }

    public void setPrenoms(String prenoms) {
        this.prenoms = prenoms;
    }
}
