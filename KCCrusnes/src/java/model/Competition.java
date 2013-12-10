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
public class Competition extends Evenement {

    private List<Licencie> inscrits;
    private String commentaires;
    private String lienProgramme;
    private NiveauCompetition niveau;

    public NiveauCompetition getNiveau() {
        return niveau;
    }

    public void setNiveau(NiveauCompetition niveau) {
        this.niveau = niveau;
    }

    public String getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(String commentaires) {
        this.commentaires = commentaires;
    }

    public Competition() {

    }

    public List<Licencie> getInscrits() {
        return inscrits;
    }

    public void setInscrits(List<Licencie> inscrits) {
        this.inscrits = inscrits;
    }

    public String getLienProgramme() {
        return lienProgramme;
    }

    public void setLienProgramme(String lienProgramme) {
        this.lienProgramme = lienProgramme;
    }

}
