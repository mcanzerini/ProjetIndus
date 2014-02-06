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
import dao.HibernateFactory;
import dao.ReferenceDao;
import dao.ReferenceDaoImpl;
import java.io.File;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Reference;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Transaction;

/**
 *
 * @author mathieu_canzerini
 */
public class DeleteLien extends ActionSupport {

// ACTION AJAXXXXXXXX !!
    public static final ReferenceDao referenceDao = ReferenceDaoImpl.getInstance();
    private ServletContext context;

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idLien = request.getParameter("id");

            try {
                Integer idLienInt = Integer.parseInt(idLien);
                Transaction t = HibernateFactory.currentSession().beginTransaction();
                //t.begin();
                Reference ref = referenceDao.find(idLienInt);

                referenceDao.delete(ref);
                context = ServletActionContext.getServletContext();
                String path = context.getRealPath("") + ActionUtils.PATH_TO_LIEN + ref.getImage();
                File photoFile = new File(path);
                photoFile.delete();

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

    public void setServletContext(ServletContext sc) {
        this.context = sc;
    }

    public ServletContext getContext() {
        return context;
    }
}