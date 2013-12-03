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
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class LicencieDaoImpl extends LicencieDao {

    public LicencieDaoImpl() {
        super();
    }

    @Override
    public List<Licencie> findByCategoryAge(CategorieAge categorieAge) {
        Query q = super.getSession().createQuery("from " + Licencie.class.getName() + " as l where l.categorieAge = :cate");
        q.setString("cate", categorieAge.toString());
        List licencies = q.list();
        return licencies;
    }

    @Override
    public List<Licencie> findByGrade(Grade grade) {
        Query q = super.getSession().createQuery("from " + Licencie.class.getName() + " as l where l.grade = :g");
        q.setString("g", grade.toString());
        List licencies = q.list();
        return licencies;
    }

    @Override
    public Licencie find(long id) {
        Licencie licencie = (Licencie) super.getSession().get(Licencie.class, id);
        return licencie;
    }

    @Override
    public List<Licencie> findAll() {
        Query query = super.getSession().createQuery("from " + Licencie.class.getName());
        List licencies = query.list();
        return licencies;
    }

    public void create(Licencie obj) {
        super.saveOrUpdate(obj);
    }

    public void update(Licencie obj) {
        super.saveOrUpdate(obj);
    }

    @Override
    public List<Licencie> findByCategoryPoids(CategoriePoids categoriePoids) {
        Query q = super.getSession().createQuery("from " + Licencie.class.getName() + " as l where l.categoriePoids = :cate");
        q.setString("cate", categoriePoids.toString());
        List<Licencie> licencies = q.list();
        return licencies;
    }

    @Override
    public List<Licencie> findByNomPrenom(String nomLicencie, String prenomLicencie) {
        StringBuilder q = new StringBuilder("from " + Licencie.class.getName() + " l ");
        boolean first = true;
        if (nomLicencie != null && !nomLicencie.equals("")) {
            q.append(" where ");
            first = false;
            q.append(" l.nom = '");
            q.append(nomLicencie);
            q.append("'");
        }
        if (prenomLicencie != null && !prenomLicencie.equals("")) {
            if (first) {
                q.append(" where ");
                first = false;
            } else {
                q.append(" and ");
            }
            q.append(" l.prenom = '");
            q.append(prenomLicencie);
            q.append("'");
        }

        Query query = super.getSession().createQuery(q.toString());
        List<Licencie> licencies = query.list();
        return licencies;
    }
}
