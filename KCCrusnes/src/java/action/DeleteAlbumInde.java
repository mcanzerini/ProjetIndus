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
import dao.HibernateFactory;
import dao.PhotoDao;
import dao.PhotoDaoImpl;
import java.io.File;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Album;
import model.Photo;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Transaction;

/**
 *
 * @author mathieu_canzerini
 */
public class DeleteAlbumInde extends ActionSupport {

    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();
    public static final PhotoDao photoDao = PhotoDaoImpl.getInstance();

    private ServletContext context;

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idAlbumString = request.getParameter("id");
            try {
                String path;
                Integer idAlbum = Integer.valueOf(idAlbumString);
                Album album = albumDao.find(idAlbum);
                context = ServletActionContext.getServletContext();
                Transaction t = HibernateFactory.currentSession().beginTransaction();
                //t.begin();
                for (Photo photo : album.getPhotos()) {
                    // TODO : supprimer la photo dur le disque
                    photoDao.delete(photo);
                    path = context.getRealPath("") + ActionUtils.PATH_TO_ALBUM + album.getId() + File.separator + photo.getLien();
                    File photoFile = new File(path);
                    photoFile.delete();
                }
                albumDao.delete(album);
                path = context.getRealPath("") + ActionUtils.PATH_TO_ALBUM + album.getId();
                File dir = new File(path);
                dir.delete();
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
            return ERROR;
        }
    }

    public void setServletContext(ServletContext sc) {
        this.context = sc;
    }

    public ServletContext getContext() {
        return context;
    }
}
