/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Adresse;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class AdresseDaoImpl extends AdresseDao {

    public static AdresseDao uniqueInstance;

    public static AdresseDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new AdresseDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Adresse obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Adresse obj) {
        saveOrUpdate(obj);
    }

    @Override
    public Adresse find(long id) {
        Adresse adresse = (Adresse) super.getSession().get(Adresse.class, id);
        return adresse;
    }

    @Override
    public List<Adresse> findAll() {
        Query query = super.getSession().createQuery("from " + Adresse.class.getName());
        List adresses = query.list();
        return adresses;
    }

    @Override
    public Adresse findByLieu(String numVoie, String nomVoie, String codePostal, String ville, String pays) {
        StringBuilder queryString = new StringBuilder();
        queryString.append("from ");
        queryString.append(Adresse.class.getName());
        queryString.append(" where num_voie = :numVoie and nom_voie = :nomVoie and code_postal= :codePostal "
                + "and ville= :ville and pays= :pays ");

        Query query = super.getSession().createQuery(queryString.toString());
        query.setParameter("numVoie", numVoie);
        query.setParameter("nomVoie", nomVoie);
        query.setParameter("codePostal", codePostal);
        query.setParameter("ville", ville);
        query.setParameter("pays", pays);

        /*boolean first = true, isNumVoie = false, isNomVoie = false, isCP = false, isVille = false, isPays = false;
         if (numVoie != null) {
         if (first) {
         first = false;
         queryString.append(" where num_voie = :numVoie ");
         } else {
         queryString.append(" and num_voie = :numVoie ");
         }
         isNumVoie = true;
         }

         if (nomVoie != null && !nomVoie.equals("")) {
         if (first) {
         first = false;
         queryString.append(" where nom_voie = :nomVoie ");
         } else {
         queryString.append(" and nom_voie = :nomVoie ");
         }
         isNomVoie = true;
         }

         if (codePostal != null && !codePostal.equals("")) {
         if (first) {
         first = false;
         queryString.append(" where code_postal = :codePostal ");
         } else {
         queryString.append(" and code_postal= :codePostal ");
         }
         isCP = true;
         }
         if (ville != null && !ville.equals("")) {
         if (first) {
         first = false;
         queryString.append(" where ville = :ville ");
         } else {
         queryString.append(" and ville= :ville ");
         }
         isVille = true;
         }
         if (pays != null && !pays.equals("")) {
         if (first) {
         first = false;
         queryString.append(" where pays = :pays ");
         } else {
         queryString.append(" and pays= :pays ");
         }
         isPays = true;
         }
         Query query = super.getSession().createQuery(queryString.toString());
         if (isNumVoie) {
         query.setParameter("numVoie", numVoie);
         }
         if (isNumVoie) {
         query.setParameter("nomVoie", nomVoie);
         }
         if (isCP) {
         query.setParameter("codePostal", codePostal);
         }
         if (isVille) {
         query.setParameter("ville", ville);
         }
         if (isPays) {
         query.setParameter("pays", pays);
         }
         */
        Adresse adresse = (Adresse) query.uniqueResult();
        return adresse;
    }

}
