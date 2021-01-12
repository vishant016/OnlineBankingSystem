/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package g;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vishant
 */
@WebServlet(name = "adduser", urlPatterns = {"/adduser"})
public class adduser extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PreparedStatement ps1;
        try (PrintWriter out = response.getWriter()) {
              String acc = request.getParameter("accountno");
            String cif = request.getParameter("cif");
            String dob = request.getParameter("dob");
            String email = request.getParameter("email");
            String ph = request.getParameter("phone");
            String username = request.getParameter("username");
            String amount = request.getParameter("amount");
            String name = request.getParameter("name");
            String address = request.getParameter("adress");
            String password="1234";
            String pan="0";
             Connection con = GetCon.getCon();
             ps1= con.prepareStatement("insert into bank values(?,?,?,?,?,?,?,?,?,?,?)");
             
             ps1.setInt(1,Integer.parseInt(acc));
             ps1.setString(2,username);
             ps1.setString(3,password);
             ps1.setString(4,ph);
             ps1.setString(5,email);
             ps1.setString(6,cif);
             ps1.setString(7,dob);
             ps1.setInt(8,Integer.parseInt(amount));
             ps1.setString(9,name);
             ps1.setString(10,address);
             ps1.setString(11,pan);
             int i=ps1.executeUpdate();  
              System.out.println(i);
             if(i==1)
             {
                 out.println("<h1>success<h1>");
                  RequestDispatcher rd1 = request.getRequestDispatcher("admin.jsp");
                rd1.include(request, response);
             }
             else
             {
                 System.out.println("error");
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
            Logger.getLogger(adduser.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(adduser.class.getName()).log(Level.SEVERE, null, ex);
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
