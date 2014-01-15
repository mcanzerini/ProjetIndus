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
public class Membre extends Licencie {

    private GregorianCalendar dateDebutActivite;
    private GregorianCalendar dateFinActivite;
    private PosteComite poste;
    private String profession;
    private String login;
    private String mdp;

    public Membre() {
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public PosteComite getPoste() {
        return poste;
    }

    public void setPoste(PosteComite poste) {
        this.poste = poste;
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

}
