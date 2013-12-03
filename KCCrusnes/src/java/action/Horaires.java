/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.HoraireDao;
import dao.HoraireDaoImpl;
import java.util.List;
import model.Horaire;

/**
 *
 * @author mathieu_canzerini
 */
public class Horaires extends ActionSupport {

    private List<Horaire> horaires;
    private static final HoraireDao horaireDao = new HoraireDaoImpl();

    public String execute() throws Exception {
        horaires = horaireDao.findAll();
        return SUCCESS;
    }

    public List<Horaire> getHoraires() {
        return horaires;
    }

    public void setHoraires(List<Horaire> horaires) {
        this.horaires = horaires;
    }

}
