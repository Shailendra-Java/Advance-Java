

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Logger log = Logger.getAnonymousLogger();
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName, lastName, email, pass, gender, role, msg;
		PrintWriter out = response.getWriter();
		
		firstName = request.getParameter("fname");
		lastName = request.getParameter("lname");
		email = request.getParameter("eid");
		pass = request.getParameter("psw");
		gender = request.getParameter("gender");
		role = request.getParameter("type");
		String query = "insert into UserRecord values(?,?,?,?,?,?,?,?)";
		try{
			Class.forName("org.h2.Driver");
			log.info("Driver Loaded");
			Connection con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/skillMapper","niit","12345");
			log.info("Connection Created");
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, firstName);
			ps.setString(2, lastName);
			ps.setString(3, email);
			ps.setString(4, pass);
			ps.setString(5, gender);
			ps.setString(6, role);
			ps.setString(7, "NA");
			ps.setString(8, "null");
			
			int count = ps.executeUpdate();
			if(count > 0){
				msg = "Congratulation!!! "+firstName+" your record is pending with HR for approval";
				RequestDispatcher rd = request.getRequestDispatcher("sign.jsp?msg="+msg);
				rd.forward(request, response);
			}
			else
				log.info("Failed add operation");
			
			
		}catch(Exception exception){
			log.info("SQL Error : "+exception);
		}
	}

}
