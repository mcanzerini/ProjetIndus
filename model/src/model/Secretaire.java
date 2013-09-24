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
public class Secretaire extends Membre{

    public Secretaire(String nom, String prenom, GregorianCalendar dateNaissance, Adresse adresse, Sexe sexe, Licencie licence, GregorianCalendar dateDebutActivite, GregorianCalendar dateFinActivite) {
        super(nom, prenom, dateNaissance, adresse, sexe, licence, dateDebutActivite, dateFinActivite);
    }

    public Secretaire(String nom, String prenom, GregorianCalendar dateNaissance, Adresse adresse, Sexe sexe, Licencie licence, GregorianCalendar dateDebutActivite) {
        super(nom, prenom, dateNaissance, adresse, sexe, licence, dateDebutActivite);
    }
    
}
