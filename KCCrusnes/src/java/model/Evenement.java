/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Calendar;

/**
 *
 * @author mathieu_canzerini
 */
public class Evenement {

    private long id;
    private String nom;
    private Calendar date;
    private Adresse lieu;
    private Album album;
    private String photoPrincipale;

    public String getPhotoPrincipale() {
        return photoPrincipale;
    }

    public void setPhotoPrincipale(String photoPrincipale) {
        this.photoPrincipale = photoPrincipale;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public Evenement() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Calendar getDate() {
        return date;
    }

    public void setDate(Calendar date) {
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
