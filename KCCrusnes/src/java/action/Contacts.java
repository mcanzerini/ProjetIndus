/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.DojoDao;
import dao.DojoDaoImpl;
import dao.MembreDao;
import dao.MembreDaoImpl;
import model.Dojo;
import model.PosteComite;

/**
 *
 * @author mathieu_canzerini
 */
public class Contacts extends ActionSupport {

    private Dojo dojo;
    private String telephoneSecretaire;
    private String telephonePresidente;
    public static final DojoDao dojoDao = DojoDaoImpl.getInstance();
    public static final MembreDao membreDao = MembreDaoImpl.getInstance();

    @Override
    public String execute() {
        dojo = dojoDao.find(1);
        telephonePresidente = membreDao.findActifByPoste(PosteComite.PRESIDENT).getLicencie().getTelephone();
        telephoneSecretaire = membreDao.findActifByPoste(PosteComite.SECRETAIRE).getLicencie().getTelephone();
        return SUCCESS;
    }

    public Dojo getDojo() {
        return dojo;
    }

    public void setDojo(Dojo dojo) {
        this.dojo = dojo;
    }

    public String getTelephoneSecretaire() {
        return telephoneSecretaire;
    }

    public void setTelephoneSecretaire(String telephoneSecretaire) {
        this.telephoneSecretaire = telephoneSecretaire;
    }

    public String getTelephonePresidente() {
        return telephonePresidente;
    }

    public void setTelephonePresidente(String telephonePresidente) {
        this.telephonePresidente = telephonePresidente;
    }
}
