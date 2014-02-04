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
import dao.AdresseDao;
import dao.AdresseDaoImpl;
import dao.CompetitionDao;
import dao.CompetitionDaoImpl;
import dao.EvenementDao;
import dao.EvenementDaoImpl;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Adresse;
import model.Competition;
import model.Evenement;
import model.NiveauCompetition;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class NewEvenement extends ActionSupport {

    public static final EvenementDao evenementDao = EvenementDaoImpl.getInstance();
    public static final CompetitionDao competitionDao = CompetitionDaoImpl.getInstance();
    public static final AdresseDao adresseDao = AdresseDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            try {
                HttpServletRequest request = ServletActionContext.getRequest();
                String numeroRue = request.getParameter("numRue");
                String nom = request.getParameter("nom");
                String dateString = request.getParameter("date");
                String nomRue = request.getParameter("nomRue");
                if (numeroRue != null && numeroRue.equals("")) {
                    numeroRue = null;
                }
                if (nomRue != null && nomRue.equals("")) {
                    nomRue = null;
                }
                String ville = request.getParameter("ville");
                if (ville != null && ville.equals("")) {
                    ville = null;
                }
                String pays = request.getParameter("pays");
                if (pays != null && pays.equals("")) {
                    pays = null;
                }
                String CP = request.getParameter("CP");
                if (CP != null && CP.equals("")) {
                    CP = null;
                }
                String type = request.getParameter("type");
                String photoPrincipale = request.getParameter("photo");
                if (photoPrincipale == null || photoPrincipale.equals("")) {
                    photoPrincipale = ActionUtils.DEFAULT_PHOTO_EVENEMENT;
                }
                Adresse adresse = adresseDao.findByLieu(numeroRue, nomRue, CP, ville, pays);
                if (adresse == null) {
                    adresse = new Adresse();
                    adresse.setCodePostal(CP);
                    adresse.setNomVoie(nomRue);
                    adresse.setNumVoie(numeroRue);
                    adresse.setPays(pays);
                    adresse.setVille(ville);
                    adresseDao.create(adresse);
                }
                if (type.equals("competition")) {
                    Competition evenement = new Competition();
                    String programme = request.getParameter("programme");
                    if (programme != null && programme.equals("")) {
                        programme = null;
                    }
                    String niveau = request.getParameter("niveau");
                    if (niveau != null && niveau.equals("")) {
                        niveau = null;
                    }
                    evenement.setLienProgramme(programme);
                    evenement.setNiveau(NiveauCompetition.valueOf(niveau));
                    evenement.setLieu(adresse);
                    evenement.setNom(nom);
                    evenement.setPhotoPrincipale(photoPrincipale);
                    Calendar date = null;
                    if (dateString != null && !dateString.equals("")) {
                        String[] strings = dateString.split("/");
                        if (strings.length == 3) {
                            try {
                                date = new GregorianCalendar(Integer.parseInt(strings[2]), Integer.parseInt(strings[1]) - 1, Integer.parseInt(strings[0]));
                            } catch (NumberFormatException e) {
                                date = null;
                            }
                        }
                    }
                    evenement.setDate(date);
                    evenementDao.update(evenement);
                } // Rajouter les tests pour stage et sorties
                else {
                    Evenement evenement = new Evenement();
                    evenement.setLieu(adresse);
                    evenement.setNom(nom);
                    evenement.setPhotoPrincipale(photoPrincipale);
                    Calendar date = null;
                    if (dateString != null && !dateString.equals("")) {
                        String[] strings = dateString.split("/");
                        if (strings.length == 3) {
                            try {
                                date = new GregorianCalendar(Integer.parseInt(strings[2]), Integer.parseInt(strings[1]) - 1, Integer.parseInt(strings[0]));
                            } catch (NumberFormatException e) {
                                date = null;
                            }
                        }
                    }
                    evenement.setDate(date);
                    evenementDao.update(evenement);
                }
            } catch (NumberFormatException e) {
                // donnees ne sont pas des int
                return ERROR;
            }
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }
}
