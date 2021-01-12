package g;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.HashMap;
import java.util.Map;
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
@WebServlet(urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            String temp_username = request.getParameter("username");
            ServletContext sc = getServletContext();
               //   Map<String, String> after = new HashMap<String, String>();
            // after.put("tem_user",temp_username);
            sc.setAttribute("tem_user", temp_username);
                // String password=request.getParameter("password");
            //String  repassword=request.getParameter("repassword");

                //String amoun=request.getParameter("amount");
            //int amount;
            // amount = Integer.parseInt(amoun);
               // String adderess=request.getParameter("adderess");
            String ph = request.getParameter("phone");
            String cif = request.getParameter("cif");
            String dob = request.getParameter("dob");
            String email = request.getParameter("email");
              String password = request.getParameter("psw");
            int status = RegisterUser.register(temp_username,password, ph, email, cif);

            if (status == 1) {
                out.print("<font color=green><h1>WELCOME! YOUR VERIFICATION DONE</h1></font>");
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.include(request, response);
            } 
            else {
                out.println("<center><font color=red><h1>Sorry,Registration failed. please try later</h1></font></center>");

                RequestDispatcher rd2 = request.getRequestDispatcher("create.html");
                rd2.include(request, response);
            }
        } catch (Exception e) {
            System.out.print("out");
            out.println(e);
        }

    }
}
