package g;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "logoutServlet", urlPatterns = {"/logoutServlet"})
public class logoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    HttpSession session = null;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html");
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        session = request.getSession();

        try (PrintWriter out = response.getWriter()) {

            if (session.getAttribute("name") != null) {

        
                // session.setAttribute("user", null);
                session.removeAttribute("name");
                session.getMaxInactiveInterval();
                RequestDispatcher rd1 = request.getRequestDispatcher("logout.jsp");
                rd1.forward(request, response);
            } else {
                out.println("<h2><font color=red>You have to log in first</font></h2>");
                request.getRequestDispatcher("login.jsp").include(request, response);

            }
        }
    }
}
