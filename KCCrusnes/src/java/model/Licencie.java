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
public class Licencie extends Personne {

    private String numLicence;
    private boolean actif;
    private int poids;
    private Grade grade;
    private CategorieAge categorieAge;
    private CategoriePoids categoriePoids;
    private boolean etudiant;
    private Photo photo;

    public Licencie() {
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public boolean isEtudiant() {
        return etudiant;
    }

    public void setEtudiant(boolean etudiant) {
        this.etudiant = etudiant;
    }

    public CategorieAge getCategorieAge() {
        return categorieAge;
    }

    public void setCategorieAge(CategorieAge categorieAge) {
        this.categorieAge = categorieAge;
    }

    public CategoriePoids getCategoriePoids() {
        return categoriePoids;
    }

    public void setCategoriePoids(CategoriePoids categoriePoids) {
        this.categoriePoids = categoriePoids;
    }

    public boolean isActif() {
        return actif;
    }

    public void setActif(boolean actif) {
        this.actif = actif;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public String getNumLicence() {
        return numLicence;
    }

    public void setNumLicence(String numLicence) {
        this.numLicence = numLicence;
    }

    public int getPoids() {
        return poids;
    }

    public void setPoids(int poids) {
        this.poids = poids;
    }

}
