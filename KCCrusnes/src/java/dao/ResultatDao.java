/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Resultat;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class ResultatDao extends Dao<Resultat> {

    public abstract void create(Resultat obj);

    public abstract void update(Resultat obj);

    public abstract List<Resultat> findLastResults(Integer nbResults);

    public abstract List<Resultat> findByCompet(long idCompetition);

    public abstract List<Resultat> findByCompetResultat(long idCompetition, Long resultat);

    public abstract List<Resultat> findByLicencie(String nomLicencie, String prenomLicencie, Long resultat);

    public abstract List<Resultat> findByAnnee(Integer annee);

    public abstract List<Resultat> findByLicencieCompet(String nomLicencie, String prenomLicencie, long idCompetition);

    public abstract List<Resultat> findByIdLicencie(Long idLicencie);

}
