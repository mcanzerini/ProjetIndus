/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.GregorianCalendar;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class Evenement {
    private String nom;
    private GregorianCalendar date;
    private Adresse lieu;

    public Evenement(String nom, GregorianCalendar date, Adresse lieu) {
        this.nom = nom;
        this.date = date;
        this.lieu = lieu;
    }

    public GregorianCalendar getDate() {
        return date;
    }

    public void setDate(GregorianCalendar date) {
        this.date = date;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setLieu(Adresse lieu) {
        this.lieu = lieu;
    }

    public Adresse getLieu() {
        return lieu;
    }

}
