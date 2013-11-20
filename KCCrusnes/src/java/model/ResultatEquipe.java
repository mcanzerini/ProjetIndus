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
public class ResultatEquipe extends Resultat{
    private List<Licencie> equipe;

    public ResultatEquipe(Competition competition, int place, List<Licencie> equipe){
        super(competition, place);
        this.equipe = equipe;
    }

    public List<Licencie> getEquipe() {
        return equipe;
    }

    public void setEquipe(List<Licencie> equipe) {
        this.equipe = equipe;
    }
    

}
