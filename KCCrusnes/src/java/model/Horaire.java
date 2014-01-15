/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author mathieu_canzerini
 */
public class Horaire {

    private long id;
    private Jour jour;
    private Heure heureDebut;
    private Heure heureFin;
    private String groupe;

    public Heure getHeureDebut() {
        return heureDebut;
    }

    public void setHeureDebut(Heure heureDebut) {
        this.heureDebut = heureDebut;
    }

    public Heure getHeureFin() {
        return heureFin;
    }

    public void setHeureFin(Heure heureFin) {
        this.heureFin = heureFin;
    }

    public String getGroupe() {
        return groupe;
    }

    public void setGroupe(String groupe) {
        this.groupe = groupe;
    }

    public Horaire() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Horaire other = (Horaire) obj;
        if (this.jour != other.jour) {
            return false;
        }
        if (this.heureDebut != other.heureDebut && (this.heureDebut == null || !this.heureDebut.equals(other.heureDebut))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.jour.hashCode();
        hash = 29 * hash + (this.heureDebut != null ? this.heureDebut.hashCode() : 0);
        return hash;
    }

    public Jour getJour() {
        return jour;
    }

    public void setJour(Jour jour) {
        this.jour = jour;
    }

}
