

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetEmp")
public class GetEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public GetEmp() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String skls = request.getParameter("skills");
		Statement ps = null;
		PrintWriter out = response.getWriter();
		String query = "select * from userrecord where skills like '%"+skls+"%'";
		try{
			Class.forName("org.h2.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/skillMapper","niit","12345");
			
			ps = con.createStatement();
			
			ResultSet rs = ps.executeQuery(query);
			out.write("<html><head><style>"
					+ "table {  width:100%;} table, th, td {  border: 1px solid black;  border-collapse: collapse;"+
					"} th, td {   padding: 15px;   text-align: left;} table#t01 tr:nth-child(even) {  background-color: #eee;"+
					"} table#t01 tr:nth-child(odd) { background-color: #fff;} table#t01 th {  background-color: black;"+
					"color: white;}</style></head><body><table id='t01'>"
					+ "<tr>	<th>First Name</th>	<th>Last Name</th> <th>Email</th> <th>Gender</th><th>Action</th></tr>");
			while(rs.next()){
						out.write(""
						+ "<tr><td>"+rs.getString("FirstName")+"</td>"
						+ "<td>"+ rs.getString("LastName")+"</td>"
						+ "<td>"+rs.getString("Email")+"</td>"
						+ "<td>"+rs.getString("Gender")+"</td>"
						+ "<td><input type='checkbox' name='hr' value='Y'> <input type='submit' value='HIRE'/></td>"
						+ "</tr></table></body></html>");
			}
		}catch(Exception exp){
			
		}
	}

}
