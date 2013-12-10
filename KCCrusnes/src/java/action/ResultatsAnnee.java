/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.ResultatDao;
import dao.ResultatDaoImpl;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Resultat;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ResultatsAnnee extends ActionSupport {

    public static final ResultatDao resultatDao = ResultatDaoImpl.getInstance();
    private List<Resultat> resultats;
    private String saison;

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        saison = request.getParameter("saison");
        String[] annees;
        annees = saison.split("/");
        Integer annee = Integer.parseInt(annees[1]);
        resultats = resultatDao.findByAnnee(annee);
        return SUCCESS;
    }

    public List<Resultat> getResultats() {
        return resultats;
    }

    public void setResultats(List<Resultat> resultats) {
        this.resultats = resultats;
    }

    public String getSaison() {
        return saison;
    }

    public void setSaison(String saison) {
        this.saison = saison;
    }

}
