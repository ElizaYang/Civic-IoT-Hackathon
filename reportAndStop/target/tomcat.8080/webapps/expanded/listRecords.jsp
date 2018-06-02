<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.reportAndStop.bean.Record"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- CSS File -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"> 
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>	 -->
<title>Show Records</title>

</head>

<body class="container-fluid">
	<!-- Body -->
	<h2 class="text-primary text-center">All sexual harassments records</h2>

	<a href="<c:url value="policeDashboard.jsp"></c:url>">
				<button id="submit_btn" class="btn btn-secondary btn-sm">
					Back to dashboard</button></a>	<div>&nbsp;</div>
				
	<!-- Searching -->
	<div class=row> 
			<form action="searchRecords" method="post">
					
				<div class="input-group">
					<!----- SEARCH DATE ------>
					<div class=col-sm-2>
					<label>Date: </label>
					<input type="date" class="form-control" name="search_date">
					</div>
					
					<!----- SEARCH LOCATION ------>	
					<div class=col-sm-2>
					<label>Zipcode: </label> 				
					<input type="text" class="form-control" name="search_location"
					placeholder="Filter Zipcode"  maxlength="5">
					</div>
					
					<!----- SEARCH TYPE ------>	
         			<div class=col-sm-2>
					<label>Type: </label>	
					<select class="form-control" name = "search_type">
						<option value="" selected disabled hidden>Filter Type</option>
            			<option value = "verbal">Verbal</option>
            			<option value = "physical">Physical</option>
            			<option value = "rape">Rape</option>
            			<option value = "stalking">Stalking</option>            			
         			</select>
         			</div>	
         			
					<!----- SEARCH AGE ------>	
					<div class=col-sm-2>
					<label>Age: </label>	
					<select class="form-control" name = "search_age">
						<option value="" selected disabled hidden>Filter Age</option>
            			<option value = "0-20">0-20</option>
            			<option value = "20-40">20-40</option>
            			<option value = "40-60">40-60</option>
            			<option value = "60-80">60-80</option>
            			<option value = "over 80">over 80</option>
         			</select>
         			</div>
         			
         			<!----- SEARCH HEIGHT ------>	
         			<div class=col-sm-2>
					<label>Height: </label>	
					<select class="form-control" name = "search_height">
						<option value="" selected disabled hidden>Filter Height</option>
            			<option value = "4">under 5</option>
            			<option value = "5">5-6</option>
            			<option value = "6">6-7</option>
            			<option value = "7">over 7</option>            			
         			</select>
         			</div>	
         			
         			<!----- SEARCH HEIGHT ------>	
         			<div class=col-sm-2>
					<label>Race: </label>	
					<select class="form-control" name = "search_race">
						<option value="" selected disabled hidden>Filter Race</option>
            			<option value="americanIndian">American Indian/Alaska</option>
            			<option value = "asian">Asian</option>
            			<option value = "white">White</option>  
            			<option value = "black">Black/African American</option>
            			<option value = "hispanic">Hispanic/Latino</option>   
            			<option value = "pacific">Hawaiian/Islander</option>           			
         			</select>
         			</div>
         			
         			<!----- SUBMIT BUTTON ------>
					<div class=col-sm-2>&nbsp;	
					<button id="submit_btn" type="submit"
						class="btn btn-primary btn-sm form-control">Search</button>
					</div>	
					<div class=col-sm-2>&nbsp;	
						<h6 id="errMsg" class="text-danger" align="center">${error_message}</h6>
					</div>								
				</div>													
			</form>
	</div>
	<div>&nbsp;</div>								
	<div class=row>
		<form class=col-sm-2 method="post" action="listRecords">
			<button id="submit_btn" class="btn btn-secondary btn-sm">Show full List
			</button>
		</form>
	</div>						
	
	<div>&nbsp;</div>
	
	<!-- Result Record Table display -->
	<div>
	
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
					<th>Delete/Update</th>
				</tr>
				</thead>
				<!-- content -->
				<c:forEach items="${records}" var="record" varStatus="status">
					<tr>					
						<th scope="row">${record.id}</th>
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
						<td>
						<a
							href="<c:url value="deleteRecords"><c:param name="_id" value="${record.id}"/></c:url>">Delete</a>
						<a
							href="<c:url value="updateRecords"><c:param name="_id" value="${record.id}"/></c:url>">Update</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>