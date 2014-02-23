/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import exception.NotLoggedException;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class PhotosServeur extends ActionSupport {

    private List<String> files;

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            // Directory path here
            String path = request.getSession().getServletContext().getRealPath("/view/resources/img/");
            files = new ArrayList<String>();
            File folder = new File(path);
            File[] listOfFiles = folder.listFiles();
            for (File file : listOfFiles) {
                if (file.isFile()) {
                    files.add(file.getName());
                }
            }
            path = request.getSession().getServletContext().getRealPath("/view/resources/img/liens");
            folder = new File(path);
            listOfFiles = folder.listFiles();
            for (File file : listOfFiles) {
                if (file.isFile()) {
                    files.add("liens/" + file.getName());
                }
            }
            path = request.getSession().getServletContext().getRealPath("/view/resources/img/licencie");
            folder = new File(path);
            listOfFiles = folder.listFiles();
            for (File file : listOfFiles) {
                if (file.isFile()) {
                    files.add("licencie/" + file.getName());
                }
            }
            path = request.getSession().getServletContext().getRealPath("/view/resources/img/carousel");
            folder = new File(path);
            listOfFiles = folder.listFiles();
            for (File file : listOfFiles) {
                if (file.isFile()) {
                    files.add("carousel/" + file.getName());
                }
            }
            return SUCCESS;
        } else {
            throw new NotLoggedException();
        }
    }

    public List<String> getFiles() {
        return files;
    }

    public void setFiles(List<String> files) {
        this.files = files;
    }

}
