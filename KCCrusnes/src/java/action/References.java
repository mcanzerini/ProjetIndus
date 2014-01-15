/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.ReferenceDao;
import dao.ReferenceDaoImpl;
import java.util.List;
import model.Reference;

/**
 *
 * @author mathieu_canzerini
 */
public class References extends ActionSupport {

    private List<Reference> references;
    public static final ReferenceDao referenceDao = ReferenceDaoImpl.getInstance();

    public String execute() throws Exception {
        references = referenceDao.findAll();
        return SUCCESS;
    }

    public List<Reference> getReferences() {
        return references;
    }

    public void setReferences(List<Reference> references) {
        this.references = references;
    }

}
