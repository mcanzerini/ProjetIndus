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
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Evenement;
import org.apache.struts2.ServletActionContext;

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
    private Calendar aujourdhui;
    private List<String> annees;

    @Override
    public String execute() throws Exception {
        annees = evenementDao.findAnnees();
        aujourdhui = Calendar.getInstance();
        HttpServletRequest request = ServletActionContext.getRequest();
        String annee = request.getParameter("annee");
        Integer anneeInt;
        if (annee == null || annee.equals("")) {
            anneeInt = aujourdhui.get(Calendar.YEAR);
        } else {
            try {
                anneeInt = Integer.parseInt(annee);
            } catch (NumberFormatException e) {
                anneeInt = aujourdhui.get(Calendar.YEAR);
            }
        }
        evenementsSeptembre = evenementDao.findByMonthYear(9, anneeInt);
        evenementsOctobre = evenementDao.findByMonthYear(10, anneeInt);
        evenementsNovembre = evenementDao.findByMonthYear(11, anneeInt);
        evenementsDecembre = evenementDao.findByMonthYear(12, anneeInt);
        evenementsJanvier = evenementDao.findByMonthYear(1, anneeInt);
        evenementsFevrier = evenementDao.findByMonthYear(2, anneeInt);
        evenementsMars = evenementDao.findByMonthYear(3, anneeInt);
        evenementsAvril = evenementDao.findByMonthYear(4, anneeInt);
        evenementsMai = evenementDao.findByMonthYear(5, anneeInt);
        evenementsJuin = evenementDao.findByMonthYear(6, anneeInt);
        evenementsJuillet = evenementDao.findByMonthYear(7, anneeInt);
        evenementsAout = evenementDao.findByMonthYear(8, anneeInt);
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

    public Calendar getAujourdhui() {
        return aujourdhui;
    }

    public void setAujourdhui(Calendar aujourdhui) {
        this.aujourdhui = aujourdhui;
    }

    public List<String> getAnnees() {
        return annees;
    }

    public void setAnnees(List<String> annees) {
        this.annees = annees;
    }

}
