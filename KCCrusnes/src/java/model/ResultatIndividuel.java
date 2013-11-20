/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author mathieu_canzerini
 */
public class ResultatIndividuel extends Resultat{
    private Licencie licencie;

    public ResultatIndividuel(Competition competition, Licencie licencie, int place) {
        super(competition, place);
        this.licencie = licencie;
    }

    public Licencie getLicencie() {
        return licencie;
    }

    public void setLicencie(Licencie licencie) {
        this.licencie = licencie;
    }

}
