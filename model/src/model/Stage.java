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
public class Stage extends Evenement{
    private int prixLicencie;
    private int prixParent;
    private int prixExterieur;

    public Stage(String nom, GregorianCalendar date, Adresse lieu, int prixLicencie, int prixParent, int prixExterieur) {
        super(nom, date, lieu);
        this.prixLicencie = prixLicencie;
        this.prixParent = prixParent;
        this.prixExterieur = prixExterieur;
    }

    public int getPrixExterieur() {
        return prixExterieur;
    }

    public void setPrixExterieur(int prixExterieur) {
        this.prixExterieur = prixExterieur;
    }

    public int getPrixLicencie() {
        return prixLicencie;
    }

    public void setPrixLicencie(int prixLicencie) {
        this.prixLicencie = prixLicencie;
    }

    public int getPrixParent() {
        return prixParent;
    }

    public void setPrixParent(int prixParent) {
        this.prixParent = prixParent;
    }



}
