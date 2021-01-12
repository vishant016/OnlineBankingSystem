/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package g;

import java.io.*;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author vishant
 */
@WebServlet(name = "fileuploader", urlPatterns = {"/fileuploader"})
public class fileuploader extends HttpServlet {

    boolean flag = false;
    int name = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
        response.setContentType("text/html;charset=UTF-8");
//PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);

        String user = (String) session.getAttribute("name");
        String accno = (String) session.getAttribute("accno");
        Connection con = GetCon.getCon();

        String email = null;
        String phone = null;
        PreparedStatement ps1;
        try {
            ps1 = con.prepareStatement("select * from bank where accountno=?");
            ps1.setInt(1, Integer.parseInt(accno));
            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {
                email = rs.getString(5);
                phone = rs.getString(4);
            }
        } catch (SQLException e) {
            System.out.println("vishant");
        }
        boolean isMultipart;

        if (email.equals(request.getParameter("email")) && phone.equals(request.getParameter("phone"))) {
            
            response.sendRedirect("validatepan.jsp");
            
    }
        else
        {
            out.println("your input is invalid");
            response.sendRedirect("minortomajor.jsp");
            
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(fileuploader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(fileuploader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
