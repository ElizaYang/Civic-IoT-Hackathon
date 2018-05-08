<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.reportAndStop.bean.Record"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- CSS File -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
<title>Show Records</title>
</head>

<body class="container-fluid">
	<!-- Body -->
	
	<!-- Searching -->
	<div>
		<table>
			<tbody>
				<tr>
					<td width="50" align="center">Name:&nbsp;</td>
					<td><input id="searchPlayerName" name="name" type="text"
						class="allInput" value="${name}" /></td>
					<td width="50" align="center">&nbsp;Age:&nbsp;</td>
					<td><input id="searchPlayerTeam" name="supsAge" type="text"
						class="allInput" value="${supsAge}" /></td>
					<td width="80" align="right"><input type="submit"
						class="tabSub" value="Search" /></td>
				</tr>
			</tbody>
		</table>
	</div>


	<!-- Result display -->
	<div>
	<h2 class="text-primary text-center">All sexual harassments records</h2>
		<table class="table table-striped">
			<tbody>

				<!-- Header -->
  				<thead class="thead-dark">
				<tr>
					<!-- <th><input type="checkbox" id="all" onclick="#"/></th> -->
					<th>Case Id</th>
					<th>Victim Name</th>
					<th>Date</th>
					<th>Type</th>
					<th>Location</th>
					<th>Suspect Gender</th>
					<th>Suspect Race</th>
					<th>Suspect Age</th>
					<th>Suspect Height</th>
					<th>Suspect Weight</th>
					<th>Suspect Marks</th>

					<th>Victim Contact</th>
					<th>Invest</th>
					<th>Delete</th>
				</tr>
				</thead>
				
				<c:forEach items="${records}" var="record" varStatus="status">
					<tr>
						
						<%-- <td><input type="checkbox" name="_id" value="${record.id}" />
						</td> --%>
						<th scope="row">${record.id}</th>
<%-- 						<td>${record.id}</td> --%>
						<td>${record.name}</td>
						<td>${record.dateTime}</td>
						<td>${record.type}</td>
						<td>${record.location}</td>
						<td>${record.suspGender}</td>
						<td>${record.suspRace}</td>
						<td>${record.suspAge}</td>
						<td>${record.suspHeight}</td>
						<td>${record.suspWeight}</td>
						<td>${record.suspChar}</td>
						<td>${record.contact}</td>
						<td>${record.invest}</td>
						<td><a
							href="<c:url value="deleteRecords"><c:param name="_id" value="${record.id}"/></c:url>">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
				<a href="<c:url value="lineChart.jsp"></c:url>">Show dashboard</a>
	</div>

</body>
</html>