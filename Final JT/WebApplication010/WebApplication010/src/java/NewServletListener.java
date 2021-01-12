import javax.servlet.ServletContext;  
import javax.servlet.http.HttpSessionEvent;  
import javax.servlet.http.HttpSessionListener;  
  
public class NewServletListener implements HttpSessionListener{  
    ServletContext ctx=null;  
    static int total=0,current=0,rp=0,rc=0;  
      
    @Override
    public void sessionCreated(HttpSessionEvent e) {  
    total++;  
    current++;  
      
    ctx=e.getSession().getServletContext();  
    ctx.setAttribute("totalusers", total);  
    ctx.setAttribute("currentusers", current);  
 
      
    }  
  
    @Override
    public void sessionDestroyed(HttpSessionEvent e) {  
        current--;  
        ctx.setAttribute("currentusers",current);
       
          
    }  
  
}  