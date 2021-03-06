/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author mathieu_canzerini
 */
public class Video {
    private String lien;
    private Evenement evenement;

    public Video(String lien){
        this.lien = lien ;
    }

    public Video(String lien, Evenement evenement){
        this.lien = lien ;
        this.evenement = evenement;
    }


    public Evenement getEvenement() {
        return evenement;
    }

    public void setEvenement(Evenement evenement) {
        this.evenement = evenement;
    }

    public String getLien() {
        return lien;
    }

    public void setLien(String lien) {
        this.lien = lien;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Video other = (Video) obj;
        if ((this.lien == null) ? (other.lien != null) : !this.lien.equals(other.lien)) {
            return false;
        }
        if (this.evenement != other.evenement && (this.evenement == null || !this.evenement.equals(other.evenement))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + (this.lien != null ? this.lien.hashCode() : 0);
        hash = 79 * hash + (this.evenement != null ? this.evenement.hashCode() : 0);
        return hash;
    }


}
