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
public class Personne {
    private String nom;
    private String prenom;
    private GregorianCalendar dateNaissance;
    private Adresse adresse;
    private Sexe sexe;

    public Personne(String nom, String prenom, GregorianCalendar dateNaissance, Adresse adresse, Sexe sexe) {
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaissance = dateNaissance;
        this.adresse = adresse;
        this.sexe = sexe;
    }

    public Sexe getSexe() {
        return sexe;
    }

    public void setSexe(Sexe sexe) {
        this.sexe = sexe;
    }



    public Adresse getAdresse() {
        return adresse;
    }

    public void setAdresse(Adresse adresse) {
        this.adresse = adresse;
    }

    public GregorianCalendar getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(GregorianCalendar dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Personne other = (Personne) obj;
        if ((this.nom == null) ? (other.nom != null) : !this.nom.equals(other.nom)) {
            return false;
        }
        if ((this.prenom == null) ? (other.prenom != null) : !this.prenom.equals(other.prenom)) {
            return false;
        }
        if (this.dateNaissance != other.dateNaissance && (this.dateNaissance == null || !this.dateNaissance.equals(other.dateNaissance))) {
            return false;
        }
        if (this.adresse != other.adresse && (this.adresse == null || !this.adresse.equals(other.adresse))) {
            return false;
        }
        if (this.sexe != other.sexe) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + (this.nom != null ? this.nom.hashCode() : 0);
        hash = 59 * hash + (this.prenom != null ? this.prenom.hashCode() : 0);
        hash = 59 * hash + (this.dateNaissance != null ? this.dateNaissance.hashCode() : 0);
        hash = 59 * hash + (this.adresse != null ? this.adresse.hashCode() : 0);
        hash = 59 * hash + this.sexe.hashCode();
        return hash;
    }

    
}
