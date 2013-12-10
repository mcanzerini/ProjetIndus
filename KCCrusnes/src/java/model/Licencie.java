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
public class Licencie extends Personne {

    private String numLicence;
    private Boolean actif;
    private Integer poids;
    private Grade grade;
    private CategorieAge categorieAge;
    private CategoriePoids categoriePoids;
    private Boolean etudiant;
    private String photo;
    private List<Competition> participations;

    public Licencie() {
    }

    public List<Competition> getParticipations() {
        return participations;
    }

    public void setParticipations(List<Competition> participations) {
        this.participations = participations;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Boolean getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Boolean etudiant) {
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

    public Boolean getActif() {
        return actif;
    }

    public void setActif(Boolean actif) {
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

    public Integer getPoids() {
        return poids;
    }

    public void setPoids(Integer poids) {
        this.poids = poids;
    }

}
