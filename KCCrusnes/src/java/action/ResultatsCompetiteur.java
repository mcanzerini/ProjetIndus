/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import dao.ResultatDao;
import dao.ResultatDaoImpl;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Licencie;
import model.Resultat;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ResultatsCompetiteur extends ActionSupport {

    public static final ResultatDao resultatDao = new ResultatDaoImpl();
    public static final LicencieDao licencieDao = new LicencieDaoImpl();
    private List<Resultat> resultats;
    private List<Licencie> licencies;

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String nomLicencie = request.getParameter("nom");
        String prenomLicencie = request.getParameter("prenom");
        licencies = licencieDao.findByNomPrenom(nomLicencie, prenomLicencie);
        if (licencies != null && licencies.size() != 1) {
            return ERROR;
        } else {
            String resultatString = request.getParameter("resultat");
            Long resultat = Long.valueOf(resultatString);
            resultats = resultatDao.findByLicencie(nomLicencie, prenomLicencie, resultat);
            return SUCCESS;
        }
    }

    public List<Resultat> getResultats() {
        return resultats;
    }

    public void setResultats(List<Resultat> resultats) {
        this.resultats = resultats;
    }

    public List<Licencie> getLicencies() {
        return licencies;
    }

    public void setLicencies(List<Licencie> licencies) {
        this.licencies = licencies;
    }

}
