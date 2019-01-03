

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 PrintWriter out=response.getWriter();  
         
         request.getRequestDispatcher("link.html").include(request, response);  
           
         HttpSession session=request.getSession(false);
         if(session!=null)
         {
        	 session.invalidate();
        	 out.print("You are successfully logged out!");
         }
         else           
        	  out.println("Please Login first!"); 
           
         out.close(); 
	}

}
