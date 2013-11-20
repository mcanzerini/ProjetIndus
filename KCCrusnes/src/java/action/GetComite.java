/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.MembreDao;
import dao.MembreDaoImpl;
import java.util.ArrayList;
import java.util.List;
import model.Membre;
import model.PosteComite;

/**
 *
 * @author mathieu_canzerini
 */
public class GetComite extends ActionSupport {

    private List<Membre> comite;
    public static final MembreDao membreDao = new MembreDaoImpl();

    @Override
    public String execute() throws Exception {
        comite = new ArrayList<Membre>();
        comite.add(membreDao.findActifByPoste(PosteComite.PRESIDENT));
        comite.add(membreDao.findActifByPoste(PosteComite.VICE_PRESIDENT));
        comite.add(membreDao.findActifByPoste(PosteComite.SECRETAIRE));
        comite.add(membreDao.findActifByPoste(PosteComite.SECRETAIRE_ADJOINT));
        comite.add(membreDao.findActifByPoste(PosteComite.TRESORIER));
        comite.add(membreDao.findActifByPoste(PosteComite.TRESORIER_ADJOINT));
        return SUCCESS;
    }

    public void setComite(List<Membre> comite) {
        this.comite = comite;
    }

    public List<Membre> getComite() {
        return comite;
    }
}
