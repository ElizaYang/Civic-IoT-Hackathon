<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.reportAndStop.bean.Record"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Records</title>
</head>
<body>

	<!-- Result display -->
	<div class="zixun fix">
		<table class="tab2" width="100%">
			<tbody>

				<!-- Header -->
				<tr>
					<th></th>
					<!-- <th><input type="checkbox" id="all" onclick="#"/></th> -->
					<th>Case Id</th>
					<th>Date</th>
					<th>Type</th>					
					<th>Location</th>									
					<th>Suspect Gender</th>
					<th>Suspect Race</th>
					<th>Suspect Age</th>
					<th>Suspect Height</th>
					<th>Suspect Weight</th>
					<th>Suspect Marks</th>
					<th>Victim Name</th>
					<th>Victim Contact</th>
					<th>Invest</th>	
				</tr>

				<!-- Body -->
				<c:forEach items="${records}" var="record" varStatus="status">
					<tr
						<c:if test="${status.index % 2 != 0}"> style="background-color:#ECF6EE;" </c:if>>
						<td><input type="checkbox" name="_id" value="${record.id}" />
						</td>
						<td>${record.id}</td>
						<td>${record.dateTime}</td>
						<td>${record.type}</td>
						<td>${record.location}</td>						
						<td>${record.suspGender}</td>
						<td>${record.suspRace}</td>
						<td>${record.suspAge}</td>
						<td>${record.suspHeight}</td>						
						<td>${record.suspWeight}</td>
						<td>${record.suspChar}</td>
						<td>${record.name}</td>
						<td>${record.contact}</td>
						<td>${record.invest}</td>
<%-- 						<td>
						<a
							href="<%=basePath %>DeleteOnePlayer.action?id=${player.id}">delete</a>
						</td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

</body>
</html>