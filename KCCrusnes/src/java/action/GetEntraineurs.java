/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.EntraineurDao;
import dao.EntraineurDaoImpl;
import java.util.ArrayList;
import java.util.List;
import model.Entraineur;

/**
 *
 * @author mathieu_canzerini
 */
public class GetEntraineurs extends ActionSupport {

    private List<Entraineur> entraineurs;
    public static final EntraineurDao entraineurDao = new EntraineurDaoImpl();

    @Override
    public String execute() throws Exception {
        entraineurs = entraineurDao.findAll();
        return SUCCESS;
    }

    public void setEntraineurs(List<Entraineur> entraineurs) {
        this.entraineurs = entraineurs;
    }

    public List<Entraineur> getEntraineurs() {
        return entraineurs;
    }
}
