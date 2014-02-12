package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.AlbumDao;
import dao.AlbumDaoImpl;
import dao.PhotoDao;
import dao.PhotoDaoImpl;
import java.io.File;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Album;
import model.Photo;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;
import util.FilesUtil;

public class UploadPhotoAlbum extends ActionSupport implements ServletContextAware {

    private List<File> files;
    private List<String> filesContentType;
    private List<String> filesFileName;
    private String filesPath;
    private ServletContext context;
    private String idAlbum;
    private String nomAlbum;

    public static final PhotoDao photoDao = PhotoDaoImpl.getInstance();
    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            System.out.print("\n\n---------------------------------------");
            int i = 0;
            HttpServletRequest request = ServletActionContext.getRequest();
            idAlbum = request.getParameter("idAlbum");
            context = ServletActionContext.getServletContext();
            try {
                Album album = albumDao.find(Long.valueOf(idAlbum));
                nomAlbum = album.getNom();
                for (File file : files) {
                    String fileName = filesFileName.get(i);
                    System.out.print("\nFile [" + i + "] ");
                    System.out.print("; name:" + fileName);
                    System.out.print("; contentType: " + filesContentType.get(i));
                    System.out.print("; length: " + file.length());
                    System.out.println("; path: " + context.getRealPath(""));
                    String path = context.getRealPath("") + ActionUtils.PATH_TO_ALBUM + idAlbum + File.separator;

                    Photo photo = new Photo();
                    photo.setLibelle(fileName);
                    photo.setAlbum(album);
                    photo.setLien(fileName);
                    photoDao.create(photo);
                    FilesUtil.saveFile(file, filesFileName.get(i), path);

                    i++;
                }
            } catch (NumberFormatException e) {
                // l'id album n'est pas un int
                return ERROR;
            }
            System.out.println("\n---------------------------------------\n");
            return SUCCESS;
        } else {
            // non connecté
            return ERROR;
        }
    }

    public List<File> getFiles() {
        return files;
    }

    public void setFiles(List<File> files) {
        this.files = files;
    }

    public List<String> getFilesContentType() {
        return filesContentType;
    }

    public void setFilesContentType(List<String> filesContentType) {
        this.filesContentType = filesContentType;
    }

    public List<String> getFilesFileName() {
        return filesFileName;
    }

    public void setFilesFileName(List<String> filesFileName) {
        this.filesFileName = filesFileName;
    }

    public String getFilesPath() {
        return filesPath;
    }

    public void setFilesPath(String filesPath) {
        this.filesPath = filesPath;
    }

    public void setServletContext(ServletContext sc) {
        this.context = sc;
    }

    public ServletContext getContext() {
        return context;
    }

    public void setContext(ServletContext context) {
        this.context = context;
    }

    public String getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(String idAlbum) {
        this.idAlbum = idAlbum;
    }

    public String getNomAlbum() {
        return nomAlbum;
    }

    public void setNomAlbum(String nomAlbum) {
        this.nomAlbum = nomAlbum;
    }

}
