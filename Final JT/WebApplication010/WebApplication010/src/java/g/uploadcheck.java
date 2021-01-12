/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package g;

import java.io.File;
import java.io.IOException;
     
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author vishant
 */
@WebServlet(name = "uploadcheck", urlPatterns = {"/uploadcheck"})
public class uploadcheck extends HttpServlet {

    boolean flag = false;
    int name = 0;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        response.setContentType("text/html;charset=UTF-8");
          HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        System.out.println(request.getParameter("PAN"));
         boolean isMultipart;
         String value="";
         
        String user = (String) session.getAttribute("name");
        String accno = (String) session.getAttribute("accno");
           Connection con = GetCon.getCon();

         isMultipart = ServletFileUpload.isMultipartContent(request);

            System.out.println(isMultipart);
            if (isMultipart) {
                System.out.println("yes");
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                if (request.getParameter("msg").equals("notdone")) {
                    flag = true;
                    name++;
                    session.setAttribute("count", Integer.toString(name));

                } else {
                    out.println("not done1");
                }

                try {
                    List items = upload.parseRequest(new ServletRequestContext(request));

                    Iterator iterator = items.iterator();
                    while (iterator.hasNext()) {
                        
                        FileItem item = (FileItem) iterator.next();
                        if(item.isFormField())
                        {
                             String name = item.getFieldName();
      value = item.getString();
     System.out.println(name);
     System.out.println(value);
                        }
                        File pa = new File("C:\\Users\\vishant\\Documents\\flutter\\Final JT\\WebApplication010\\WebApplication010\\web\\images\\pan\\");

                        File uploadedFile = new File(pa + "/" + user + "_" + accno + ".jpeg");
                        item.write(uploadedFile);
                    }
                } catch (IOException io) {
                    System.out.println("Error in fileupload " + io);
                }
                System.out.println(flag);
               // session.setAttribute(request.getParameter("msg"), "done");

                if (flag == true) {
                    PreparedStatement ps2;
                    int i=0;
                     ps2 = con.prepareStatement("insert into requests(accountno,request,date) values(?,?,?)");
                        ps2.setInt(1, Integer.parseInt(accno));
                        ps2.setString(2, "kyc");
                        ps2.setDate(3, new java.sql.Date(System.currentTimeMillis()));
                        System.out.println(request.getParameter("PAN"));
                         PreparedStatement ps3;
                    int j=0;
                     ps3 = con.prepareStatement("Update bank set panno=? where accountno=?");
                     ps3.setString(1,value);
                     ps3.setInt(2, Integer.parseInt(accno));
                        i = ps2.executeUpdate();
                        j = ps3.executeUpdate();
                    response.sendRedirect("feature.jsp");
                    flag = false;
                } else {
                    response.sendRedirect("start.jsp");
                }
            }
         else {
            out.println("Your input is wrong");
            response.sendRedirect("minortomajor.jsp");
        }
    }
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(uploadcheck.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(uploadcheck.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
