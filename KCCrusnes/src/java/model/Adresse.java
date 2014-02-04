/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author mathieu_canzerini
 */
public class Adresse {

    private long id;
    private String numVoie;
    private String nomVoie;
    private String codePostal;
    private String ville;
    private String pays;

    public Adresse() {

    }

    public Adresse(String numVoie, String nomVoie, String codePostal, String ville, String pays) {
        this.numVoie = numVoie;
        this.nomVoie = nomVoie;
        this.codePostal = codePostal;
        this.ville = ville;
        this.pays = pays;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCodePostal() {
        return codePostal;
    }

    public String getNomVoie() {
        return nomVoie;
    }

    public String getNumVoie() {
        return numVoie;
    }

    public String getPays() {
        return pays;
    }

    public String getVille() {
        return ville;
    }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    public void setNomVoie(String nomVoie) {
        this.nomVoie = nomVoie;
    }

    public void setNumVoie(String numVoie) {
        this.numVoie = numVoie;
    }

    public void setPays(String pays) {
        this.pays = pays;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Adresse other = (Adresse) obj;
        if (this.numVoie != other.numVoie) {
            return false;
        }
        if ((this.nomVoie == null) ? (other.nomVoie != null) : !this.nomVoie.equals(other.nomVoie)) {
            return false;
        }
        if ((this.codePostal == null) ? (other.codePostal != null) : !this.codePostal.equals(other.codePostal)) {
            return false;
        }
        if ((this.ville == null) ? (other.ville != null) : !this.ville.equals(other.ville)) {
            return false;
        }
        if ((this.pays == null) ? (other.pays != null) : !this.pays.equals(other.pays)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 89 * hash + (this.nomVoie != null ? this.nomVoie.hashCode() : 0);
        hash = 89 * hash + (this.codePostal != null ? this.codePostal.hashCode() : 0);
        hash = 89 * hash + (this.ville != null ? this.ville.hashCode() : 0);
        hash = 89 * hash + (this.pays != null ? this.pays.hashCode() : 0);
        return hash;
    }

}
