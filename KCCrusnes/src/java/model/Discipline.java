/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author mathieu_canzerini
 */
public class Discipline {

    private long id;
    private String nom;
    private List<Entraineur> entraineurs;

    public Discipline() {

    }

    public List<Entraineur> getEntraineurs() {
        return entraineurs;
    }

    public void setEntraineurs(List<Entraineur> entraineurs) {
        this.entraineurs = entraineurs;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

}
