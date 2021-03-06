/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author mathieu_canzerini
 */
public class Competition extends Evenement{
    private List<Licencie> inscrits;
    private String lienProgramme;

    public Competition(String nom, GregorianCalendar date, Adresse lieu){
        super(nom,date, lieu);
        inscrits = new ArrayList<Licencie>();
    }

    public Competition(String nom, GregorianCalendar date, String lienProgramme, Adresse lieu){
        super(nom,date,lieu);
        this.lienProgramme = lienProgramme;
        inscrits = new ArrayList<Licencie>();
    }

    public Competition(String nom, GregorianCalendar date, List<Licencie> inscrits, String lienProgramme, Adresse lieu) {
        super(nom, date, lieu);
        this.inscrits = inscrits;
        this.lienProgramme = lienProgramme;
    }

    public List<Licencie> getInscrits() {
        return inscrits;
    }

    public void setInscrits(List<Licencie> inscrits) {
        this.inscrits = inscrits;
    }

    public String getLienProgramme() {
        return lienProgramme;
    }

    public void setLienProgramme(String lienProgramme) {
        this.lienProgramme = lienProgramme;
    }



}
