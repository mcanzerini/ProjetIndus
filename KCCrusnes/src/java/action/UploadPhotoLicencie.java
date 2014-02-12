package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import java.io.File;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Licencie;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;
import util.FilesUtil;

public class UploadPhotoLicencie extends ActionSupport implements ServletContextAware {

    private File file;
    private String fileContentType;
    private String fileFileName;
    private String filePath;
    private ServletContext context;
    private String idLicencieString;

    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            System.out.print("\n\n---------------------------------------");
            int i = 0;
            HttpServletRequest request = ServletActionContext.getRequest();
            idLicencieString = request.getParameter("idLicenciePhoto");
            context = ServletActionContext.getServletContext();
            try {
                System.out.println("1");
                Long idLicencie = Long.valueOf(idLicencieString);
                System.out.println("2");
                Licencie licencie = licencieDao.find(idLicencie);
                String fileName = fileFileName;
                System.out.print("\nFile ");
                System.out.print("; name:" + fileName);
                System.out.print("; contentType: " + fileContentType);
                System.out.print("; length: " + file.length());
                System.out.println("; path: " + context.getRealPath(""));
                String path = context.getRealPath("") + ActionUtils.PATH_TO_LICENCIE;
                FilesUtil.saveFile(file, fileFileName, path);
                System.out.println("3");
                String anciennePhoto = licencie.getPhoto();
                licencie.setPhoto(fileFileName);
                licencieDao.update(licencie);
                System.out.println("4");
                if (anciennePhoto != null && !anciennePhoto.equals("") && !anciennePhoto.equals(ActionUtils.DEFAULT_PHOTO_LICENCIE)) {
                    context = ServletActionContext.getServletContext();
                    path = context.getRealPath("") + ActionUtils.PATH_TO_LICENCIE + anciennePhoto;
                    File photoFile = new File(path);
                    photoFile.delete();
                }
                System.out.println("5");
            } catch (NumberFormatException e) {
                // l'id album n'est pas un int
                return ERROR;
            }
            System.out.println("\n---------------------------------------\n");
            return SUCCESS;
        } else {
            return ERROR;
            //non connecté
        }
    }

    public void setServletContext(ServletContext sc) {
        this.context = sc;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public ServletContext getContext() {
        return context;
    }

    public void setContext(ServletContext context) {
        this.context = context;
    }

    public String getIdLicencieString() {
        return idLicencieString;
    }

    public void setIdLicencieString(String idLicencieString) {
        this.idLicencieString = idLicencieString;
    }

}
