<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
	Gson gsonObj = new Gson();
	Map<Object, Object> map = null;
	List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
	String dataPoints = null;

	try {
		//Class.forName("com.mysql.jdbc.Driver");
		String db_name = ConnectToDB.getCrime_db_name();
		String db_collection_name = ConnectToDB.getCrime_collection_name();
		
		// Get the mongodb connection
		MongoDatabase db = ConnectToDB.getConnection().getDatabase(db_name);

		// Get the mongodb collection.
		MongoCollection<Document> collection = db.getCollection(db_collection_name);
		
		FindIterable<Document> result = collection.find();
		// Use cursor iterator
		MongoCursor<Document> cursor = result.iterator();
		
		// Iterate records
		while (cursor.hasNext()) {
			Document document = cursor.next();
			xVal = document.get("dateTime").toString();
			yVal = document.get("_id").toString();

			map = new HashMap<Object, Object>();
			map.put("dateTime", Double.parseDouble(xVal));
			map.put("_id", Double.parseDouble(yVal));
			list.add(map);
			
            dataPoints = gsonObj.toJson(list);
		}
		
		
		String xVal, yVal;

		ResultSet resultSet = statement.executeQuery("select * from datapoints");

		while (resultSet.next()) {
			xVal = resultSet.getString("x");
			yVal = resultSet.getString("y");
			map = new HashMap<Object, Object>();
			map.put("x", Double.parseDouble(xVal));
			map.put("y", Double.parseDouble(yVal));
			list.add(map);
			dataPoints = gsonObj.toJson(list);
		}
		connection.close();
	} catch (SQLException e) {
		out.println(
				"<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
		dataPoints = null;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Harassments Dashboard</title>

<script type="text/javascript">
	window.onload = function() {
<%if (dataPoints != null) {%>
	var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			exportEnabled : true,
			title : {
				text : "JSP Column Chart from Database"
			},
			data : [ {
				type : "column", //change type to bar, line, area, pie, etc
				dataPoints :
<%out.print(dataPoints);%>
	} ]
		});
		chart.render();
<%}%>
	}
</script>
</head>

<body>
	<h2>Harassments Data Dashboard</h2>
	<h4>Hello Police Officer!</h4>

	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

	<a href="<c:url value="listRecords"></c:url>">To full list Records</a>

</body>
</html>
