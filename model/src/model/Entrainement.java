/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mathieu_canzerini
 */
public class Entrainement {
    private List<Entraineur> entraineurs;
    private Horaire horaire;
    private Discipline discipline;
    private int duree;

    public Entrainement(Horaire horaire, Discipline discipline, int duree) {
        this.horaire = horaire;
        this.discipline = discipline;
        this.duree = duree;
        this.entraineurs = new ArrayList<Entraineur>();
    }

    public Entrainement(List<Entraineur> entraineurs, Horaire horaire, Discipline discipline, int duree) {
        this.entraineurs = entraineurs;
        this.horaire = horaire;
        this.discipline = discipline;
        this.duree = duree;
    }

    public int getDuree() {
        return duree;
    }

    public void setDuree(int duree) {
        this.duree = duree;
    }

    public Entrainement(List<Entraineur> entraineurs, Horaire horaire) {
        this.entraineurs = entraineurs;
        this.horaire = horaire;
    }

    public Entrainement(Horaire horaire){
        this.entraineurs = new ArrayList<Entraineur>();
        this.horaire = horaire;
    }

    public Entrainement(Horaire horaire, Discipline discipline) {
        this.horaire = horaire;
        this.discipline = discipline;
        this.entraineurs = new ArrayList<Entraineur>();
    }

    public Entrainement(List<Entraineur> entraineurs, Horaire horaire, Discipline discipline) {
        this.entraineurs = entraineurs;
        this.horaire = horaire;
        this.discipline = discipline;
    }

    public Discipline getDiscipline() {
        return discipline;
    }

    public void setDiscipline(Discipline discipline) {
        this.discipline = discipline;
    }

    public List<Entraineur> getEntraineurs() {
        return entraineurs;
    }

    public void setEntraineurs(List<Entraineur> entraineurs) {
        this.entraineurs = entraineurs;
    }

    public Horaire getHoraire() {
        return horaire;
    }

    public void setHoraire(Horaire horaire) {
        this.horaire = horaire;
    }
}
