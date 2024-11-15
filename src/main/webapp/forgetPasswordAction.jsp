<%@page import = "connection.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<% 
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String answer = request.getParameter("answer");
String securityQuestion=request.getParameter("securityQuestion");
String newPassword = request.getParameter("newPassword");

int check = 0;
try
{
	 Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from user where email = '"+email+"' and mobilenumber = '"+mobileNumber + "' and securityQues = '"+securityQuestion+"' and answer='"+answer+"'");
	while(rs.next())
		{
		check=1;
		st.executeUpdate("Update user set password='"+newPassword+"'where email = '"+email+"'");
		response.sendRedirect("forgetPassword.jsp?msg = done");
		}
	if(check ==0){
		response.sendRedirect("forgetPassword.jsp?msg = invalid");
	}
		}
catch(Exception e)
{
	System.out.println(e);
}
%>
