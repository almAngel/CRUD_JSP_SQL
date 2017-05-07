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
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="style.css">
		
		<title>CRUD- RegList</title>
	</head>
	<body>

		<%
			Class.forName("com.mysql.jdbc.Driver");			
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUDALM","root", "");
		
			Statement s= connection.createStatement();
			request.setCharacterEncoding("UTF-8");
			ResultSet list = s.executeQuery ("SELECT * FROM KEYBOARD");
		%>
		
		<div class="well well-sm">
			<h1 id="header">CRUD- RegList</h1><br>
		</div>
		
		<div class="container" id="addeditcontainer">
			<form method="get" action="addreg.jsp">
				<input type="text" name="idbox" size="5" placeholder="ID" disabled/>
				<input type="text" name="brandbox" size="10" placeholder="Brand"/>
				<input type="text" name="modelbox" size="15" placeholder="Model"/>
				<select name="keytype" required>
					<option value="">--</option>
					<option value="Mechanical">Mechanical</option>
					<option value="Membrane">Membrane</option>
					<option value="Hybrid">Hybrid</option>
				</select>
				<input type= "text" name="stockbox" size="5" placeholder="Units" disabled/>
				<input type="text" name="pricebox" size="8" placeholder="0.00€"/>
				<input type="submit" value="Add"  class="btn"/>
			</form>
		</div>
	
		<div class= "container">
			<table class="table table-hover">
				<tr>
					<thead>
						<th>ID</th>
						<th>Brand</th>
						<th>Model</th>
						<th>Type</th>
						<th>Stock</th>
						<th>Price</th>
					</thead>
				</tr>
				<%
					while (list.next()) {
					out.println("<tr><tbody><td>");
					out.println(String.format("%05d",list.getInt("ID")) + "</td>");
					out.println("<td>" + list.getString("BRAND") + "</td>");
					out.println("<td>" + list.getString("MODEL") + "</td>");
					out.println("<td>" + list.getString("TYPE") + "</td>");
					out.println("<td>" + list.getString("STOCK") + "</td>");
					out.println("<td>" + String.format("%.2f",list.getFloat("PRICE")) + " €" + "</td>");
				%>
				<div>
					<td>
						<form method="get" action="preditreg.jsp">
							<input type="hidden" name="idnum" value="<%=list.getInt("ID")%>"/>
							<input type="hidden" name="brand" value="<%=list.getString("BRAND")%>"/>
							<input type="hidden" name="model" value="<%=list.getString("MODEL")%>"/>
							<input type="hidden" name="type" value="<%=list.getString("TYPE")%>"/>
							<input type="hidden" name="stock" value="<%=list.getString("STOCK")%>"/>
							<input type="hidden" name="price" value="<%=list.getString("PRICE")%>"/>
							<input type="submit" value="Modify" id="stbutton" class="btn"/>
						</form>
						
					</td>
				</div>
				<div>
					<td>
						<form method="get" action="delreg.jsp">
							<input type="hidden" name="idnum" value="<%=list.getInt("ID")%>"/>
							<input type="submit" value="Delete" id="ndbutton" class="btn"/>
						</form>
					</td>
				</div>	
					</tr>
				</tbody>
				<%
					} // while
				   connection.close();
				%>
			</table>
		</div>		
						
	</body>
</html>