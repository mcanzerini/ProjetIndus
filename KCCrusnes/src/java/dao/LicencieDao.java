/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.CategorieAge;
import model.CategoriePoids;
import model.Grade;
import model.Licencie;
import model.Sexe;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class LicencieDao extends Dao<Licencie> {

    public LicencieDao() {
        super();
    }

    public abstract void create(Licencie obj);

    public abstract void update(Licencie obj);

    public abstract List<Licencie> findByCategoryAge(CategorieAge categorieAge);

    public abstract List<Licencie> findByCategoryPoids(CategoriePoids categoriePoids);

    public abstract List<Licencie> findByGrade(Grade grade);

    public abstract List<Licencie> findByNomPrenom(String nomLicencie, String prenomLicencie);

    public abstract String getAllNameTypeHead();

    public abstract String getAllFirstNameTypeHead();

    public abstract String getNameTypeHeadFromFirstName(String firstName);

    public abstract String getFirstNameTypeHeadFromName(String name);

    public abstract List<String> selectAllDistinctNames();

    public abstract List<String> selectAllDistinctFirstNames();

    public abstract List<String> selectDistinctFirstNamesFromName(String nom);

    public abstract List<String> selectDistinctNamesFromFirstName(String prenom);

    public abstract List<String> selectAllDistinctFirstNamesFromResultats();

    public abstract List<String> selectAllDistinctNamesFromResultats();

    public abstract List<String> selectDistinctNamesFromFirstNameAndResultats(String prenom);

    public abstract List<String> selectDistinctFirstNamesFromNameAndResultats(String nom);

    public abstract List<Grade> selectAllExistingGrades();

    public abstract String getNameFirstName();

    public abstract List<Licencie> findForAdmin(Integer page, Grade grade, Sexe sexe, Boolean isActif, Boolean isEtudiant,
            CategorieAge categorieAge);
}
