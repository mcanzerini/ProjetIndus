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
}
