

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

@WebServlet("/ActivateAccount")
public class ActivateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ActivateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		String query = "update userrecord set status ='A' where email= ?";
		try{
			Class.forName("org.h2.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/skillMapper","niit","12345");
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, userId);
			
			int check = ps.executeUpdate();
			if(check > 0){
				response.getWriter().println("<h1 style='color:green'>Account activated</h1>");
				ps.close();
				
				ps = con.prepareStatement("select * from userrecord where email =?");
				ps.setString(1, userId);
				ResultSet rs = ps.executeQuery();
				if(rs.next()){
				
					try {
		    	          String subject="Account activation";
		    	          String msg="<h1 style='color:green'>Hi! "+rs.getString(1).concat(" "+rs.getString(2))+"!!!</h1></br><h3> your account"
		    	          		+ "has been activated</h3><br>"
		                          + "<p><i>Enjoy the full services of skill mapper </i></p>";   	          
		    	          
		    	          final String user="thakurshailendrasingh1991@gmail.com";//change accordingly  
		    	          final String pass=Credential.getPassword();  
		    	            
		    	          //1st step) Get the session object    
		    	          Properties props = new Properties();  
		    	         //change accordingly  
		    	          props.put("mail.smtp.user",user); 
		    	          props.put("mail.smtp.password", pass);
		    	          props.put("mail.smtp.host", "smtp.gmail.com"); 
		    	         
		    	          props.put("mail.smtp.port", "587 "); 
		    	         // props.put("mail.debug", "true"); 
		    	          props.put("mail.smtp.auth", "true"); 
		    	          props.put("mail.smtp.starttls.enable","true"); 
		    	          props.put("mail.smtp.EnableSSL.enable","true");
		    	          props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		    	          
		    	          Session session = Session.getInstance(props, null);
		    	          //session.setDebug(true);
		 
		    	          MimeMessage message = new MimeMessage(session);
		    	          message.setFrom(new InternetAddress(user));
	
		    	          // To get the array of addresses
		    	          
		    	              message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		    	          
	
		    	          message.setSubject(subject);
		    	          message.setContent(msg, "text/html");
	
		    	          Transport transport = session.getTransport("smtp");
		    	          
		    	              transport.connect("smtp.gmail.com", user, pass);
		    	              transport.sendMessage(message, message.getAllRecipients());
		                      
		       }catch(Exception e)
		       {
		           System.out.println(e);
		       }
			}
			}
			else
				response.getWriter().println("<h1 style='color:red'>Account activated failed</h1>");
		}catch(Exception exp){
			
		}
	}

}
