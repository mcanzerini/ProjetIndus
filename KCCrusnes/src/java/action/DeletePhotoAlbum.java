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
import model.Photo;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Transaction;

/**
 *
 * @author mathieu_canzerini
 */
public class DeletePhotoAlbum extends ActionSupport {

// ACTION AJAXXXXXXXX !!
    private String idAlbum;
    public static final PhotoDao photoDao = PhotoDaoImpl.getInstance();
    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();
    private ServletContext context;

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            idAlbum = request.getParameter("idAlbum");
            String nombrePhotoString = request.getParameter("nombrePhoto");
            try {
                Integer nbPhoto = Integer.parseInt(nombrePhotoString);
                Transaction t = HibernateFactory.currentSession().beginTransaction();
                //t.begin();
                for (int i = 0; i < nbPhoto; i++) {
                    String idPhotoString = request.getParameter("" + i);
                    Integer idPhoto = Integer.parseInt(idPhotoString);
                    Photo photo = photoDao.find(idPhoto);
                    // TODO : supprimer la photo dur le disque
                    photoDao.delete(photo);
                    context = ServletActionContext.getServletContext();
                    String path = context.getRealPath("") + ActionUtils.PATH_TO_ALBUM + idAlbum + File.separator + photo.getLien();
                    File photoFile = new File(path);
                    photoFile.delete();
                }
                albumDao.update(albumDao.find(Long.valueOf(idAlbum)));
                // commit only if tx still hasn't been committed yet (by hibernate)
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

    public String getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(String idAlbum) {
        this.idAlbum = idAlbum;
    }

    public void setServletContext(ServletContext sc) {
        this.context = sc;
    }

    public ServletContext getContext() {
        return context;
    }
}
