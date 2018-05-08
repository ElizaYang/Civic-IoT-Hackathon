<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to online Report System</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery Files -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="resource/js/form_login.js"></script>

<!-- CSS File -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body>
	<div id="mongoDbServlet" class="container">
		<div>&nbsp;</div><div>&nbsp;</div>
		<h1 align="center" class="text-primary">Welcome to the Report &
			Stop System</h1>
		<p align="center">
			This is a website to report any sexual harassments you have
			encountered or witnessed. <br /> Police will use the database to
			lock suspects and streamline deployment. Let's build a better
			community together. <br /> YOUR REPORT MATTERS! <br />
		</p>
		<div>&nbsp;</div>
		<hr width=75% align=center>
		<div>&nbsp;</div>

		<!----- REPORT BUTTON ------>
		<div align="center" id="report_form">
			<h4 class="text-primary">Victim Report Portal</h4>
			<form method="post" action="reportPage">
				<button id="submit_btn" type="submit" class="btn btn-success btn-lg">
					Click here - Start Report Harassment</button>
			</form>
		</div>

		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<hr width=50% align=center>

		<!------ LOGIN FOR POLICE OFFICER ------>
		<div align="center" id="login_form">
			<h4 class="text-primary">Police Officer Login Portal</h4>
			<!--width is set by this div -->
			<div class="col-sm-4 col-sm-offset-4">
				<form id="user_login_form" name="loginForm" method="post"
					action="loginServlet">
					<!----- LOGIN ID ------>
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							class="form-control" id="login_id"
							placeholder="Enter login id ..." name="login_id" maxlength="6">
					</div>
					<div>&nbsp;</div>

					<!----- LOGIN PSW ------>
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input type="password"
							class="form-control" id="login_pwd"
							placeholder="Enter password ..." name="login_pwd">
					</div>

					<!----- SUBMIT BUTTON ------>
					<div>&nbsp;</div>
					<button id="submit_btn" type="submit"
						class="btn btn-primary btn-sm">Police Office Login</button>
					<h4 id="errMsg" class="text-danger" align="center">${error_message}</h4>
				</form>
			</div>

		</div>
	</div>
</body>
</html>