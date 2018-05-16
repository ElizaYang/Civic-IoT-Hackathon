<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Sexual Harassment Online Report System</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<!-- CSS File -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">	
</head>

<body class="container">
<br/><br/>

<h2 class="text-primary text-center">Welcome to the Report & Stop System</h2>
<br/>

<br/>
	<form class="form-horizontal container" action="createRecord" method="post">
		<!-- SECTION ONE-->
		<span>
			<h4 class="text-info">Section1 - Reporter information</h4><hr align=center><br />
			<div class="form-group row">
				<label class="col-sm-4 col-form-label font-weight-bold">Your Name</label>
				<div class="col-sm-8">
					<input name="name" type="text" class="form-control"
						placeholder="Full name" required>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-4 col-form-label font-weight-bold">Contact Number</label>
				<div class="col-sm-8">
					<input name="contact" type="text" class="form-control"
						placeholder="Phone Number">
				</div>
			</div>

			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-4 pt-0 font-weight-bold">Report Type</legend>
					<div class="col-sm-8">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="invest" value="no"
								checked> <label class="form-check-label">Just
									document it, no police involved</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="invest" value = "yes">
								<label class="form-check-label">Request police
									investigation, response to me</label>
						</div>
					</div>
				</div>
			</fieldset>
		</span>
	<br/>
		<!-- SECTION TWO-->
		<span>
			<h4 class="text-info">Section2 - Event detail</h4><hr align=center><br />
			<div class="form-group row">
				<label class="col-sm-4 col-form-label font-weight-bold">Date</label>
				<div class="col-sm-8">
					<input name="dateTime" type="date" class="form-control"
						placeholder="pick from drop down calendar" required>
				</div>
			</div>
	
	
			<div class="form-group row">
				<label class="col-sm-4 col-form-label font-weight-bold">Location</label>
				<div class="col-sm-8">
					<input name="location" type="text" class="form-control"
						placeholder="Where did it happend">
				</div>
			</div>



			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-4 pt-0 font-weight-bold">Harassment
						Type</legend>
					<div class="col-sm-8">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="type" value="verbal" checked>
								<label class="form-check-label">Verbal sexual harassment</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="type" value="physical">
								<label class="form-check-label">Physical sexual
									harassment</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="type" value="rape">
								<label class="form-check-label">Rape</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="type" value="stalking">
								<label class="form-check-label">Stalking</label>
						</div>
					</div>
				</div>
			</fieldset>

			<div class="form-group row">
				<label class="col-sm-4 col-form-label font-weight-bold">Other detail</label>
				<div class="col-sm-8">
					<input name="detail" type="text" class="form-control"
						placeholder="Anything else we should know">
				</div>
			</div>
		</span>
	<br/>
		<!-- SECTION THREE-->
		<span>
			<h4 class="text-info">Section3 - Crime suspect detail</h4><hr align=center><br />
			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-4 pt-0 font-weight-bold">Gender</legend>
					<div class="col-sm-8">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspGender"
								value="male" checked> <label class="form-check-label">Male</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspGender"
								value="female"> <label class="form-check-label">Female</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspGender"
								value="other"> <label class="form-check-label">Other</label>
						</div>
					</div>
				</div>
			</fieldset>

			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-4 pt-0 font-weight-bold">Age</legend>
					<div class="col-sm-8">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspAge"
								value="0-20" checked> <label class="form-check-label">0-20</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspAge"
								value="20-40"> <label class="form-check-label">20-40</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspAge"
								value="40-60"> <label class="form-check-label">40-60</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspAge"
								value="60-80"> <label class="form-check-label">60-80</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspAge"
								value="over 80"> <label class="form-check-label">80-100</label>
						</div>
						
					</div>
				</div>
			</fieldset>
			<div class="form-group row">
				<label class="col-sm-4 col-form-label font-weight-bold">Height(approximate)</label>
				<div class="col-sm-8">
					<input name="suspHeight" type="text" class="form-control"
						placeholder="in inch">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-4 col-form-label font-weight-bold">Weight(approximate)</label>
				<div class="col-sm-8">
					<input name="suspWeight" type="text" class="form-control"
						placeholder="in pound">
				</div>
			</div>

			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-4 pt-0 font-weight-bold">Race</legend>
					<div class="col-sm-8">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspRace" value="americanIndian" checked> 
							<label
								class="form-check-label">American Indian/Alaska</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspRace"
								value="asian"> <label class="form-check-label">Asian</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspRace"
								value="black"> <label class="form-check-label">Black/African
									American</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspRace"
								value="hispanic"> <label class="form-check-label">Hispanic/Latino</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspRace"
								value="white"> <label class="form-check-label">White</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="suspRace"
								value="pacific"> <label class="form-check-label">Hawaiian/Islander</label>
						</div>
					</div>
				</div>
			</fieldset>
			
			<div class="form-group row">
				<label class="col-sm-4 col-form-label font-weight-bold">Skintone</label>
				<div class="col-sm-8">
					<input name="suspSkinTone" type="text" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-4 col-form-label font-weight-bold">Scare/Marks</label>
				<div class="col-sm-8">
					<input name="suspChar" type="text" class="form-control">
				</div>
			</div>


		</span>
		<!-- Submit button-->
		<div class="form-group row">
			<div class="col-sm-4">
				<button type="button" class="btn btn-light">Cancel</button>
			</div>

			<div class="col-sm-8">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</div>

	</form>
</body>
</html>