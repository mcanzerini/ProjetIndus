/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.EvenementDao;
import dao.EvenementDaoImpl;
import java.util.List;
import model.Evenement;

/**
 *
 * @author mathieu_canzerini
 */
public class VoirCalendrier extends ActionSupport {

    private List<Evenement> evenementsSeptembre;
    private List<Evenement> evenementsOctobre;
    private List<Evenement> evenementsNovembre;
    private List<Evenement> evenementsDecembre;
    private List<Evenement> evenementsJanvier;
    private List<Evenement> evenementsFevrier;
    private List<Evenement> evenementsMars;
    private List<Evenement> evenementsAvril;
    private List<Evenement> evenementsMai;
    private List<Evenement> evenementsJuin;
    private List<Evenement> evenementsJuillet;
    private List<Evenement> evenementsAout;
    public static EvenementDao evenementDao = EvenementDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        evenementsSeptembre = evenementDao.findByMonth(9);
        evenementsOctobre = evenementDao.findByMonth(10);
        evenementsNovembre = evenementDao.findByMonth(11);
        evenementsDecembre = evenementDao.findByMonth(12);
        evenementsJanvier = evenementDao.findByMonth(1);
        evenementsFevrier = evenementDao.findByMonth(2);
        evenementsMars = evenementDao.findByMonth(3);
        evenementsAvril = evenementDao.findByMonth(4);
        evenementsMai = evenementDao.findByMonth(5);
        evenementsJuin = evenementDao.findByMonth(6);
        evenementsJuillet = evenementDao.findByMonth(7);
        evenementsAout = evenementDao.findByMonth(8);
        return SUCCESS;
    }

    public List<Evenement> getEvenementsSeptembre() {
        return evenementsSeptembre;
    }

    public void setEvenementsSeptembre(List<Evenement> evenementsSeptembre) {
        this.evenementsSeptembre = evenementsSeptembre;
    }

    public List<Evenement> getEvenementsOctobre() {
        return evenementsOctobre;
    }

    public void setEvenementsOctobre(List<Evenement> evenementsOctobre) {
        this.evenementsOctobre = evenementsOctobre;
    }

    public List<Evenement> getEvenementsNovembre() {
        return evenementsNovembre;
    }

    public void setEvenementsNovembre(List<Evenement> evenementsNovembre) {
        this.evenementsNovembre = evenementsNovembre;
    }

    public List<Evenement> getEvenementsDecembre() {
        return evenementsDecembre;
    }

    public void setEvenementsDecembre(List<Evenement> evenementsDecembre) {
        this.evenementsDecembre = evenementsDecembre;
    }

    public List<Evenement> getEvenementsJanvier() {
        return evenementsJanvier;
    }

    public void setEvenementsJanvier(List<Evenement> evenementsJanvier) {
        this.evenementsJanvier = evenementsJanvier;
    }

    public List<Evenement> getEvenementsFevrier() {
        return evenementsFevrier;
    }

    public void setEvenementsFevrier(List<Evenement> evenementsFevrier) {
        this.evenementsFevrier = evenementsFevrier;
    }

    public List<Evenement> getEvenementsMars() {
        return evenementsMars;
    }

    public void setEvenementsMars(List<Evenement> evenementsMars) {
        this.evenementsMars = evenementsMars;
    }

    public List<Evenement> getEvenementsAvril() {
        return evenementsAvril;
    }

    public void setEvenementsAvril(List<Evenement> evenementsAvril) {
        this.evenementsAvril = evenementsAvril;
    }

    public List<Evenement> getEvenementsMai() {
        return evenementsMai;
    }

    public void setEvenementsMai(List<Evenement> evenementsMai) {
        this.evenementsMai = evenementsMai;
    }

    public List<Evenement> getEvenementsJuin() {
        return evenementsJuin;
    }

    public void setEvenementsJuin(List<Evenement> evenementsJuin) {
        this.evenementsJuin = evenementsJuin;
    }

    public List<Evenement> getEvenementsJuillet() {
        return evenementsJuillet;
    }

    public void setEvenementsJuillet(List<Evenement> evenementsJuillet) {
        this.evenementsJuillet = evenementsJuillet;
    }

    public List<Evenement> getEvenementsAout() {
        return evenementsAout;
    }

    public void setEvenementsAout(List<Evenement> evenementsAout) {
        this.evenementsAout = evenementsAout;
    }

}
