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
		<title>Insert title here</title>
		
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
			request.setCharacterEncoding("UTF-8");
			
			Statement s= connection.createStatement();	
		
			String query= "UPDATE KEYBOARD SET BRAND='"+ 
				request.getParameter("brandbox") + "',MODEL='"
				+ request.getParameter("modelbox") + "',TYPE='"
				+ request.getParameter("keytype") + "',STOCK="
				+ Long.valueOf(request.getParameter("stockbox")) + ",PRICE="
				+ Float.valueOf(request.getParameter("pricebox"))
				+ " " + "WHERE ID=" + request.getParameter("idnum");
			System.out.println(query);
			s.execute(query);
		%>
		
		<div class='alert alert-info'>
			<p><strong>Success!: </strong>The keyboard register(id: <%out.print(request.getParameter("idnum")); %>) has been succesfully edited!</p>
		</div>
		
		<div id="backlink">
			<a href="index.jsp" class="btn" role="button">Back</a>
		</div>
	
	</body>
</html>