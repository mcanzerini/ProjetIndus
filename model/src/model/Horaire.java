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
    private Jour jour;
    private Heure heure;

    public Horaire(Jour jour, Heure heure) {
        this.jour = jour;
        this.heure = heure;
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
        if (this.heure != other.heure && (this.heure == null || !this.heure.equals(other.heure))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.jour.hashCode();
        hash = 29 * hash + (this.heure != null ? this.heure.hashCode() : 0);
        return hash;
    }

    public Heure getHeure() {
        return heure;
    }

    public void setHeure(Heure heure) {
        this.heure = heure;
    }

    public Jour getJour() {
        return jour;
    }

    public void setJour(Jour jour) {
        this.jour = jour;
    }

    
}
