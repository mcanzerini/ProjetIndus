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
import dao.HoraireDao;
import dao.HoraireDaoImpl;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Heure;
import model.Horaire;
import model.Jour;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class NewHoraire extends ActionSupport {

    public static final HoraireDao horaireDao = HoraireDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String groupe = request.getParameter("groupe");
            String jour = request.getParameter("jour");
            String[] debut = request.getParameter("debut").split(":");
            String[] fin = request.getParameter("fin").split(":");
            Horaire horaire = new Horaire();
            horaire.setGroupe(groupe);
            horaire.setJour(Jour.valueOf(jour.toUpperCase()));
            Heure heureDebut = new Heure();
            heureDebut.setHeure(Integer.parseInt(debut[0]));
            heureDebut.setMinute(Integer.parseInt(debut[1]));
            Heure heureFin = new Heure();
            heureFin.setHeure(Integer.parseInt(fin[0]));
            heureFin.setMinute(Integer.parseInt(fin[1]));
            horaire.setHeureDebut(heureDebut);
            horaire.setHeureFin(heureFin);
            horaireDao.create(horaire);
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }
}
