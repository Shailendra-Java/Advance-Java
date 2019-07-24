

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/verify")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		String pass = request.getParameter("psw");
		String msg=null;
		String query = "select * from userrecord where email=? and password = ?";
		try{
			Class.forName("org.h2.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/skillMapper","niit","12345");
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, userId);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("status").equals("NA"))
					msg = "Sorry your profile is pending for approval with HR desk";
				else
					msg = "Profile Activated";
				if(!rs.getString("Role").equals("HR")){
					RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp?msg="+msg);
					rd.forward(request, response);
				}
				else{
					RequestDispatcher rd = request.getRequestDispatcher("approve.jsp");
					rd.forward(request, response);
				}
			}
			else{
				msg = "Invalid id OR password!";
				RequestDispatcher rd = request.getRequestDispatcher("sign.jsp?err="+msg);
				rd.forward(request, response);
			}
			
			
		}catch(Exception exception){
			response.getWriter().println(exception);
		}
	}

}
