/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author mathieu_canzerini
 */
public class Entraineur extends Membre{
    private Discipline discipline;
    private List<Entrainement> entrainements;

    public Entraineur(String nom, String prenom, GregorianCalendar dateNaissance, Adresse adresse, Sexe sexe, Licencie licence, GregorianCalendar dateDebutActivite, GregorianCalendar dateFinActivite, Discipline discipline, List<Entrainement> entrainements) {
        super(nom, prenom, dateNaissance, adresse, sexe, licence, dateDebutActivite, dateFinActivite);
        this.discipline = discipline;
        this.entrainements = entrainements;
    }

    public Entraineur(String nom, String prenom, GregorianCalendar dateNaissance, Adresse adresse, Sexe sexe, Licencie licence, GregorianCalendar dateDebutActivite, Discipline discipline, List<Entrainement> entrainements) {
        super(nom, prenom, dateNaissance, adresse, sexe, licence, dateDebutActivite);
        this.discipline = discipline;
        this.entrainements = entrainements;
    }

    

    public List<Entrainement> getEntrainements() {
        return entrainements;
    }

    public void setEntrainements(List<Entrainement> entrainements) {
        this.entrainements = entrainements;
    }

    public Entraineur(String nom, String prenom, GregorianCalendar dateNaissance, Adresse adresse, Sexe sexe, Licencie licence, GregorianCalendar dateDebutActivite, GregorianCalendar dateFinActivite, Discipline discipline) {
        super(nom, prenom, dateNaissance, adresse, sexe, licence, dateDebutActivite, dateFinActivite);
        this.discipline = discipline;
    }

    public Entraineur(String nom, String prenom, GregorianCalendar dateNaissance, Adresse adresse, Sexe sexe, Licencie licence, GregorianCalendar dateDebutActivite, Discipline discipline) {
        super(nom, prenom, dateNaissance, adresse, sexe, licence, dateDebutActivite);
        this.discipline = discipline;
    }

    public Discipline getDiscipline() {
        return discipline;
    }

    public void setDiscipline(Discipline discipline) {
        this.discipline = discipline;
    }


}
