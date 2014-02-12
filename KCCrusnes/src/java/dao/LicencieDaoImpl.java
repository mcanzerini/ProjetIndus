/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.CategorieAge;
import model.CategoriePoids;
import model.Grade;
import model.Licencie;
import model.Resultat;
import model.Sexe;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class LicencieDaoImpl extends LicencieDao {

    public static LicencieDao uniqueInstance;

    public static LicencieDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new LicencieDaoImpl();
        }
        return uniqueInstance;
    }

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
        Query q = super.getSession().createQuery("from " + Licencie.class.getName() + " as l where l.grade = :g "
                + " order by l.nom asc, l.prenom asc");
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

    @Override
    public List<String> selectAllDistinctNames() {
        Query query = super.getSession().createQuery("select distinct l.nom from " + Licencie.class.getName() + " l "
                + "order by l.nom asc");
        List noms = query.list();
        return noms;
    }

    @Override
    public List<String> selectAllDistinctNamesFromResultats() {
        Query query = super.getSession().createQuery("select distinct r.licencie.nom from " + Resultat.class.getName() + " r "
                + "order by r.licencie.nom asc");
        List noms = query.list();
        return noms;
    }

    @Override
    public List<String> selectAllDistinctFirstNames() {
        Query query = super.getSession().createQuery("select distinct l.prenom from " + Licencie.class.getName() + " l "
                + "order by l.prenom asc");
        List prenoms = query.list();
        return prenoms;
    }

    @Override
    public List<String> selectAllDistinctFirstNamesFromResultats() {
        Query query = super.getSession().createQuery("select distinct r.licencie.prenom from " + Resultat.class.getName() + " r "
                + "order by r.licencie.prenom asc");
        List prenoms = query.list();
        return prenoms;
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

    @Override
    public String getAllNameTypeHead() {
        StringBuilder res = new StringBuilder("");
        List<String> noms = selectAllDistinctNamesFromResultats();
        boolean first = true;
        for (String nom : noms) {
            if (first) {
                first = false;
                res.append(nom);
            } else {
                res.append(",");
                res.append(nom);
            }
        }
        return res.toString();
    }

    @Override
    public String getAllFirstNameTypeHead() {
        StringBuilder res = new StringBuilder("");
        List<String> prenoms = selectAllDistinctFirstNamesFromResultats();
        boolean first = true;
        for (String prenom : prenoms) {
            if (first) {
                first = false;
                res.append(prenom);
            } else {
                res.append(",");
                res.append(prenom);
            }
        }
        return res.toString();
    }

    @Override
    public String getNameTypeHeadFromFirstName(String firstName) {
        StringBuilder res = new StringBuilder("");
        List<String> noms = selectDistinctNamesFromFirstNameAndResultats(firstName);
        boolean first = true;
        for (String nom : noms) {
            if (first) {
                first = false;
                res.append(nom);
            } else {
                res.append(",");
                res.append(nom);
            }
        }
        return res.toString();
    }

    @Override
    public String getFirstNameTypeHeadFromName(String name) {
        StringBuilder res = new StringBuilder("");
        List<String> prenoms = selectDistinctFirstNamesFromNameAndResultats(name);
        boolean first = true;
        for (String prenom : prenoms) {
            if (first) {
                first = false;
                res.append(prenom);
            } else {
                res.append(",");
                res.append(prenom);
            }
        }
        return res.toString();
    }

    @Override
    public List<String> selectDistinctFirstNamesFromName(String nom) {
        Query query = super.getSession().createQuery("select distinct l.prenom from " + Licencie.class.getName() + " l "
                + " where l.nom = '" + nom + "' order by l.prenom asc");
        List prenoms = query.list();
        return prenoms;
    }

    @Override
    public List<String> selectDistinctNamesFromFirstName(String prenom) {
        Query query = super.getSession().createQuery("select distinct l.nom from " + Licencie.class.getName() + " l "
                + " where l.prenom = '" + prenom + "' order by l.nom asc");
        List noms = query.list();
        return noms;
    }

    @Override
    public List<String> selectDistinctFirstNamesFromNameAndResultats(String nom) {
        Query query = super.getSession().createQuery("select distinct r.licencie.prenom from " + Resultat.class.getName() + " r "
                + " where r.licencie.nom = '" + nom + "' order by r.licencie.prenom asc");
        List prenoms = query.list();
        return prenoms;
    }

    @Override
    public List<String> selectDistinctNamesFromFirstNameAndResultats(String prenom) {
        Query query = super.getSession().createQuery("select distinct r.licencie.nom from " + Resultat.class.getName() + " r "
                + " where r.licencie.prenom = '" + prenom + "' order by r.licencie.nom asc");
        List noms = query.list();
        return noms;
    }

    @Override
    public List<Grade> selectAllExistingGrades() {
        //tres crade si ca pete on change
        Query query = super.getSession().createQuery("select distinct l.grade from " + Licencie.class.getName() + " l "
                + " where l.grade is not null");
        List<Grade> gradesExistants = query.list();
        List<Grade> toutGrades = new ArrayList<Grade>(Arrays.asList(Grade.values()));
        List<Grade> resultats = new ArrayList<Grade>(Arrays.asList(Grade.values()));
        for (Grade grade : toutGrades) {
            if (!gradesExistants.contains(grade)) {
                resultats.remove(grade);
            }
        }
        return resultats;
    }

    @Override
    public String getNameFirstName() {
        StringBuilder result = new StringBuilder();
        List<Licencie> licencies = findAll();
        result.append("[");
        boolean first = true;
        for (Licencie licencie : licencies) {
            if (first) {
                first = false;
            } else {
                result.append(",");
            }
            result.append("{");
            result.append("\"prenom\":");
            result.append("\"");
            result.append(licencie.getPrenom());
            result.append("\",");
            result.append("\"nom\":");
            result.append("\"");
            result.append(licencie.getNom());
            result.append("\",");
            result.append("\"id\":");
            result.append("\"");
            result.append(licencie.getId());
            result.append("\"");
            result.append("}");
        }
        result.append("]");
        return result.toString();
    }

    @Override
    public List<Licencie> findForAdmin(Integer page, Grade grade, Sexe sexe, Boolean isActif, Boolean isEtudiant, CategorieAge categorieAge) {
        List<Licencie> licencies;
        StringBuilder queryString = new StringBuilder();
        queryString.append("from ");
        queryString.append(Licencie.class.getName());
        queryString.append(" l ");
        Boolean first = true;
        if (grade != null) {
            first = false;
            queryString.append(" where ");
            queryString.append(" grade = '");
            queryString.append(grade.name());
            queryString.append("' ");

        }
        if (sexe != null) {
            if (first) {
                first = false;
                queryString.append(" where ");
            } else {
                queryString.append(" and ");
            }
            queryString.append(" sexe = '");
            queryString.append(sexe.name());
            queryString.append("' ");
        }
        if (isActif != null) {
            if (first) {
                first = false;
                queryString.append(" where ");
            } else {
                queryString.append(" and ");
            }
            queryString.append(" actif = ");
            queryString.append(isActif);
        }
        if (isEtudiant != null) {
            if (first) {
                first = false;
                queryString.append(" where ");
            } else {
                queryString.append(" and ");
            }
            queryString.append(" etudiant = ");
            queryString.append(isEtudiant);
        }
        if (categorieAge != null) {
            if (first) {
                queryString.append(" where ");
            } else {
                queryString.append(" and ");
            }
            queryString.append(" categorieAge = '");
            queryString.append(categorieAge.name());
            queryString.append("'");
        }
        queryString.append(" order by l.nom, l.prenom");
        Query query = super.getSession().createQuery(queryString.toString());
        if (page == null || page == 0) {
            query.setFirstResult(0);
        } else {
            query.setFirstResult((page - 1) * 10);
        }
        query.setMaxResults(11);
        licencies = query.list();
        return licencies;
    }
}
