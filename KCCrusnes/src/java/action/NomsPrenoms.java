/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import java.io.ByteArrayInputStream;
import java.io.InputStream;

/**
 *
 * @author mathieu_canzerini
 */
public class NomsPrenoms extends ActionSupport {

    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();
    private InputStream stream;
    private String noms;

    public InputStream getStream() {
        return stream;
    }

    public void setStream(InputStream stream) {
        this.stream = stream;
    }

    @Override
    public String execute() {
        noms = licencieDao.getNameFirstName();
        stream = new ByteArrayInputStream(noms.getBytes());
        return SUCCESS;
    }

    public String getNoms() {
        return noms;
    }

    public void setNoms(String noms) {
        this.noms = noms;
    }
}
