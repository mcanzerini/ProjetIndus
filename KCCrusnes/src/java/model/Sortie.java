/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author mathieu_canzerini
 */
public class Sortie extends Evenement {

    private int prixLicencie;
    private int prixParent;
    private int prixExterieur;

    public Sortie() {

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
