<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.Console"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRUD- AddReg</title>

		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="style.css">

</head>
<body>

	<% 
		Class.forName("com.mysql.jdbc.Driver");			
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUDALM","root", "");
	
		Statement s= connection.createStatement();
		
		request.setCharacterEncoding("UTF-8");
		
		
		
		if(s.getMaxRows()== 0){
			String resetIDs= "ALTER TABLE KEYBOARD AUTO_INCREMENT=0";
			s.execute(resetIDs);
		}
		
		ResultSet list= s.executeQuery ("SELECT COUNT(*) AS TOTAL FROM KEYBOARD WHERE BRAND='" + 
		request.getParameter("brandbox") + "' AND MODEL='" + 
		request.getParameter("modelbox")+"' AND TYPE='" +
		request.getParameter("keytype") + "'");
		
		list.next();
		System.out.println("Total of this item existing in database: " + list.getString("TOTAL"));
	
		if(Integer.valueOf(list.getString("TOTAL")) != 0){
			
			out.print("<div class='alert alert-danger'>" +
					  "<p><strong>Error:</strong> The keyboard you are trying to add is aready registered in the database.</p>" +
					  "</div>");
			connection.close();
		}
		else {
			
			String query= "INSERT INTO KEYBOARD(BRAND, MODEL, TYPE, STOCK, PRICE) VALUES ('"
					+ request.getParameter("brandbox") + "', '"
					+ request.getParameter("modelbox") + "', '"
					+ request.getParameter("keytype") + "',"
					+ Integer.valueOf("0") + ","
					+ Float.valueOf(request.getParameter("pricebox")) + ")";
			s.execute(query);
			out.print("<div class='alert alert-info'>" +
			"<p><strong>Success!: </strong>The keyboard register has been succesfully added!</p>" +
			"</div>"
			);
		}
		
		
		connection.close();
	%>	

	<div id="backlink">
		<a href="index.jsp" class="btn" role="button">Back</a>
	</div>
	
</body>
</html>