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
import dao.HibernateFactory;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import exception.NotLoggedException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Adresse;
import model.Grade;
import model.Licencie;
import model.Sexe;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ModifLicencie extends ActionSupport {

    private List<String> myErrors;
    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();
    public static final AdresseDao adresseDao = AdresseDaoImpl.getInstance();
    private Long idLicencie;

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idString = request.getParameter("id");
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String date = request.getParameter("date");
            String villeNaissance = request.getParameter("villeNaissance");
            String numRue = request.getParameter("numRue");
            String nomRue = request.getParameter("nomRue");
            String ville = request.getParameter("ville");
            String CP = request.getParameter("CP");
            String pays = request.getParameter("pays");
            String telephone = request.getParameter("telephone");
            String sexe = request.getParameter("sexe");
            String numLicencie = request.getParameter("numLicence");
            String actif = request.getParameter("actif");
            String poids = request.getParameter("poids");
            String etudiant = request.getParameter("etudiant");
            String grade = request.getParameter("grade");
            Integer poidsInt = null;
            myErrors = new ArrayList<String>();
            if (nom == null || nom.equals("")) {
                myErrors.add("Le nom est obligatoire");
            }
            if (prenom == null || prenom.equals("")) {
                myErrors.add("Le prénom est obligatoire");
            }
            if (telephone == null || telephone.equals("")) {
                myErrors.add("Le téléphone est obligatoire");
            }
            if (numLicencie == null || numLicencie.equals("")) {
                myErrors.add("Le numéro de licence est obligatoire");
            }
            try {
                poidsInt = Integer.valueOf(poids);
            } catch (NumberFormatException e) {
                myErrors.add("Le poids doit être un nombre");
            }
            if (date == null || date.equals("")) {
                System.out.println("date obligatoire");
            }
            if (!myErrors.isEmpty()) {
                //erreurs de saisies
                session.put("myErrors", myErrors);
                return ERROR;
            } else {
                GregorianCalendar dateCalendar;
                String[] strings = date.split("/");
                if (strings.length == 3) {
                    try {
                        dateCalendar = new GregorianCalendar(Integer.parseInt(strings[2]), Integer.parseInt(strings[1]) - 1, Integer.parseInt(strings[0]));
                    } catch (NumberFormatException e) {
                        dateCalendar = null;
                    }
                } else {
                    myErrors.add("La date doit être du type : jj/mm/aaaa");
                    session.put("myErrors", myErrors);
                    return ERROR;
                }
                Licencie licencie = licencieDao.find(Long.valueOf(idString));
                licencie.setActif(Boolean.valueOf(actif));
                licencie.setDateNaissance(dateCalendar);
                licencie.setEtudiant(Boolean.valueOf(etudiant));
                licencie.setGrade(Grade.valueOf(grade));
                licencie.setNom(nom);
                licencie.setPrenom(prenom);
                licencie.setPoids(poidsInt);
                System.out.println(sexe);
                System.out.println(grade);
                licencie.setSexe(Sexe.valueOf(sexe));
                licencie.setVilleNaissance(villeNaissance);
                licencie.setTelephone(telephone);
                licencie.setNumLicence(numLicencie);

                Adresse adresse = adresseDao.findByLieu(numRue, nomRue, CP, ville, pays);
                if (adresse == null) {
                    adresse = new Adresse();
                    adresse.setCodePostal(CP);
                    adresse.setNomVoie(nomRue);
                    adresse.setNumVoie(numRue);
                    adresse.setPays(pays);
                    adresse.setVille(ville);
                    adresseDao.create(adresse);
                }

                licencie.setAdresse(adresse);

                licencieDao.update(licencie);
                HibernateFactory.currentSession().flush();
                idLicencie = licencie.getId();
                session.remove("myErrors");
                return SUCCESS;
            }
        } else {
            // non connecté
            throw new NotLoggedException();
        }

    }

    public List<String> getMyErrors() {
        return myErrors;
    }

    public void setMyErrors(List<String> errors) {
        this.myErrors = errors;
    }

    public Long getIdLicencie() {
        return idLicencie;
    }

    public void setIdLicencie(Long idLicencie) {
        this.idLicencie = idLicencie;
    }

}
