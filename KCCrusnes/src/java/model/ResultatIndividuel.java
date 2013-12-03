/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author mathieu_canzerini
 */
public class ResultatIndividuel extends Resultat {

    private Licencie licencie;

    public ResultatIndividuel() {
    }

    public Licencie getLicencie() {
        return licencie;
    }

    public void setLicencie(Licencie licencie) {
        this.licencie = licencie;
    }

}
