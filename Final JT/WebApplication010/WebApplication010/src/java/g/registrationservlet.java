/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package g;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vishant
 */
@WebServlet(urlPatterns = {"/registrationservlet"})
public class registrationservlet extends HttpServlet {
    encryption md=new encryption();

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
            throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con = GetCon.getCon();
            PreparedStatement ps;
            // String usr=(String) request.getAttribute("tem_user");
            ServletContext sc = getServletContext();
            String usr;
            usr = (String) sc.getAttribute("tem_user");
            String sql = "Update bank set password=?,username=? where username=?";
            ps = con.prepareStatement(sql);
            String username = request.getParameter("username1");
            String password = request.getParameter("password");
           String secretKey = "boooooooooom!!!!";
            String encryptpass=md.encrypt(password,secretKey);
            ps.setString(2, username);
            ps.setString(1, encryptpass);
            ps.setString(3, usr);

            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet loginservlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1><font color=green>Registration successfull</font></h1>");
                out.println("</body>");
                out.println("</html>");
                RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                rd1.include(request, response);
            } else {
                out.println("<h1><font color=red>Registration unsuccessfull</font></h1>");
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.include(request, response);
            }

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
        } catch (SQLException ex) {
            System.out.println("Vishant login");
            Logger.getLogger(registrationservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(registrationservlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(registrationservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(registrationservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
