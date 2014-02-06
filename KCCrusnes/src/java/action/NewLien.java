package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.HibernateFactory;
import dao.ReferenceDao;
import dao.ReferenceDaoImpl;
import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Reference;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;
import org.hibernate.Transaction;
import util.FilesUtil;

public class NewLien extends ActionSupport implements ServletContextAware {

    private File file;
    private String fileContentType;
    private String fileFileName;
    private String filePath;
    private ServletContext context;

    public static final ReferenceDao referenceDao = ReferenceDaoImpl.getInstance();

    @Override
    public String execute() throws Exception {
        System.out.print("\n\n---------------------------------------");
        HttpServletRequest request = ServletActionContext.getRequest();
        String lien = request.getParameter("lien");
        context = ServletActionContext.getServletContext();

        String fileName = fileFileName;
        System.out.print("\nFile ");
        System.out.print("; name:" + fileName);
        System.out.print("; contentType: " + fileContentType);
        System.out.print("; length: " + file.length());
        System.out.println("; path: " + context.getRealPath(""));
        String path = context.getRealPath("") + ActionUtils.PATH_TO_LIEN;

        Reference ref = new Reference();
        ref.setImage(fileName);
        ref.setLien(lien);
        Transaction t = HibernateFactory.currentSession().beginTransaction();
        referenceDao.create(ref);
        FilesUtil.saveFile(file, fileFileName, path);
        if (!t.wasCommitted()) {
            t.commit();
        }

        System.out.println("\n---------------------------------------\n");
        return SUCCESS;
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

    public void setServletContext(ServletContext sc) {
        this.context = sc;
    }
}
