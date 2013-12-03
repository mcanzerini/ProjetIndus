/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author mathieu_canzerini
 */
public class Resultat {

    private long id;
    private Competition competition;
    private Integer place;
    private CategoriePoids categoriePoids;
    private CategorieAge categorieAge;
    private Licencie licencie;
    private Boolean individuel;

    public Resultat() {

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Boolean isIndividuel() {
        return individuel;
    }

    public void setIndividuel(Boolean individuel) {
        this.individuel = individuel;
    }

    public Licencie getLicencie() {
        return licencie;
    }

    public void setLicencie(Licencie licencie) {
        this.licencie = licencie;
    }

    public CategoriePoids getCategoriePoids() {
        return categoriePoids;
    }

    public void setCategoriePoids(CategoriePoids categoriePoids) {
        this.categoriePoids = categoriePoids;
    }

    public CategorieAge getCategorieAge() {
        return categorieAge;
    }

    public void setCategorieAge(CategorieAge categorieAge) {
        this.categorieAge = categorieAge;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public Integer getPlace() {
        return place;
    }

    public void setPlace(Integer place) {
        this.place = place;
    }

}
