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
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Album;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ModifAlbum extends ActionSupport {

    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String nom = request.getParameter("nom");
            String idAlbum = request.getParameter("id");
            int idAlbumInt = Integer.parseInt(idAlbum);
            Album album = albumDao.find(idAlbumInt);
            album.setNom(nom);
            albumDao.update(album);
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }
}
