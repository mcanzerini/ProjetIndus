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
import dao.HibernateFactory;
import dao.PhotoDao;
import dao.PhotoDaoImpl;
import exception.NotLoggedException;
import java.io.File;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Album;
import model.Evenement;
import model.Photo;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Transaction;

/**
 *
 * @author mathieu_canzerini
 */
public class DeleteAlbum extends ActionSupport {

    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();
    public static final PhotoDao photoDao = PhotoDaoImpl.getInstance();
    public static final EvenementDao evenementDao = EvenementDaoImpl.getInstance();

    private ServletContext context;

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idEvenementString = request.getParameter("id");
            try {
                Integer idEvenement = Integer.parseInt(idEvenementString);
                Evenement evenement = evenementDao.find(idEvenement);
                Album album = evenement.getAlbum();
                Transaction t = HibernateFactory.currentSession().beginTransaction();
                //t.begin();
                for (Photo photo : album.getPhotos()) {
                    // TODO : supprimer la photo dur le disque
                    photoDao.delete(photo);
                    context = ServletActionContext.getServletContext();
                    String path = context.getRealPath("") + ActionUtils.PATH_TO_ALBUM + album.getId() + File.separator + photo.getLien();
                    File photoFile = new File(path);
                    photoFile.delete();
                    path = context.getRealPath("") + ActionUtils.PATH_TO_ALBUM + album.getId();
                    File dir = new File(path);
                    System.out.println(dir.getAbsolutePath());
                    System.out.println(path);
                    dir.delete();
                }
                albumDao.delete(album);
                evenement.setAlbum(null);
                evenementDao.update(evenement);
                if (!t.wasCommitted()) {
                    t.commit();
                }
                return SUCCESS;
            } catch (NumberFormatException e) {
                // l'id n'est pas un int
                return ERROR;
            }

        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            throw new NotLoggedException();
        }
    }

    public void setServletContext(ServletContext sc) {
        this.context = sc;
    }

    public ServletContext getContext() {
        return context;
    }
}
