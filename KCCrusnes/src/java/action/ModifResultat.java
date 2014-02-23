/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.ResultatDao;
import dao.ResultatDaoImpl;
import exception.NotLoggedException;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Resultat;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ModifResultat extends ActionSupport {

    public static final ResultatDao resultatDao = ResultatDaoImpl.getInstance();
    private InputStream stream;
    private List<model.Resultat> resultats;

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idResultat = request.getParameter("id");
            int idResultatInt = Integer.parseInt(idResultat);
            String placeString = request.getParameter("place");
            int place;
            try {
                place = Integer.parseInt(placeString);
            } catch (NumberFormatException e) {
                // La place n'est pas un entier
                return ERROR;
            }
            Resultat modifResultat = resultatDao.find(idResultatInt);
            modifResultat.setPlace(place);
            resultatDao.update(modifResultat);
            resultats = resultatDao.findByCompet(modifResultat.getCompetition().getId());
            StringBuilder html = new StringBuilder();
            int i = 0;
            for (Resultat resultat : resultats) {
                html.append("<tr><td>");
                html.append(resultat.getLicencie().getNom());
                html.append("</td><td>");
                html.append(resultat.getLicencie().getPrenom());
                html.append("</td><td>");
                html.append(resultat.getPlace());
                html.append("<s:if test=\"#session.logined == 'true'\"><button onclick=\"deleteResultat(");
                html.append(resultat.getId());
                html.append(")\" class=\"pull-right btn btn-danger\">Supprimer</button><button onclick=\"modifierResultat(");
                html.append(resultat.getId());
                html.append(",");
                html.append(i);
                html.append(",");
                html.append(resultat.getPlace());
                html.append(")\" class=\"pull-right btn btn-primary\">Modifier</button></s:if></td></td></tr>");
                i++;
            }
            stream = new ByteArrayInputStream(html.toString().getBytes());
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            throw new NotLoggedException();
        }
    }

    public List<model.Resultat> getResultats() {
        return resultats;
    }

    public void setResultats(List<model.Resultat> resultats) {
        this.resultats = resultats;
    }

    public InputStream getStream() {
        return stream;
    }

    public void setStream(InputStream stream) {
        this.stream = stream;
    }

}
