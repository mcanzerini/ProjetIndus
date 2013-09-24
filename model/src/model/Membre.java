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
public class Membre extends Personne{
    private Licencie licence;
    private GregorianCalendar dateDebutActivite;
    private GregorianCalendar dateFinActivite;

    public Membre(String nom, String prenom, GregorianCalendar dateNaissance, Adresse adresse, Sexe sexe, Licencie licence, GregorianCalendar dateDebutActivite) {
        super(nom, prenom, dateNaissance, adresse, sexe);
        this.licence = licence;
        this.dateDebutActivite = dateDebutActivite;
        this.dateFinActivite = null;
    }

    public Membre(String nom, String prenom, GregorianCalendar dateNaissance, Adresse adresse, Sexe sexe, Licencie licence, GregorianCalendar dateDebutActivite, GregorianCalendar dateFinActivite) {
        super(nom, prenom, dateNaissance, adresse, sexe);
        this.licence = licence;
        this.dateDebutActivite = dateDebutActivite;
        this.dateFinActivite = dateFinActivite;
    }

    public GregorianCalendar getDateDebutActivite() {
        return dateDebutActivite;
    }

    public void setDateDebutActivite(GregorianCalendar dateDebutActivite) {
        this.dateDebutActivite = dateDebutActivite;
    }

    public GregorianCalendar getDateFinActivite() {
        return dateFinActivite;
    }

    public void setDateFinActivite(GregorianCalendar dateFinActivite) {
        this.dateFinActivite = dateFinActivite;
    }

    public Licencie getLicence() {
        return licence;
    }

    public void setLicence(Licencie licence) {
        this.licence = licence;
    }

}
