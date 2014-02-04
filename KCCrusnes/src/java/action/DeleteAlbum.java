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
import dao.AlbumDao;
import dao.AlbumDaoImpl;
import dao.EvenementDao;
import dao.EvenementDaoImpl;
import dao.PhotoDao;
import dao.PhotoDaoImpl;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Album;
import model.Evenement;
import model.Photo;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class DeleteAlbum extends ActionSupport {

    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();
    public static final PhotoDao photoDao = PhotoDaoImpl.getInstance();
    public static final EvenementDao evenementDao = EvenementDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idEvenementString = request.getParameter("id");
            try {
                Integer idEvenement = Integer.parseInt(idEvenementString);
                Evenement evenement = evenementDao.find(idEvenement);
                Album album = evenement.getAlbum();
                for (Photo photo : album.getPhotos()) {
                    // TODO : supprimer la photo dur le disque
                    photoDao.delete(photo);
                }
                albumDao.delete(album);
                evenement.setAlbum(null);
                evenementDao.update(evenement);
                return SUCCESS;
            } catch (NumberFormatException e) {
                // l'id n'est pas un int
                return ERROR;
            }

        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }

}
