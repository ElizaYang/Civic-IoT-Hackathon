<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mongodb.*"%>
<%@ page import="com.mongodb.client.MongoCollection"%>
<%@ page import="com.mongodb.client.MongoDatabase"%>
<%@ page import="com.mongodb.client.MongoCursor"%>
<%@ page import="com.mongodb.client.FindIterable"%>
<%@ page import="com.mongodb.client.AggregateIterable"%>
<%@ page import="com.reportAndStop.mongoDB.ConnectToDB"%>
<%@ page import="org.bson.Document"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="java.text.*"%>
<%@ page import="com.google.gson.*"%>

<%
	Gson areaGsonObj = new Gson();
	Gson pieGsonObj = new Gson();
	Gson barGsonObj = new Gson();
	
	Map<Object, Object> areaMap = null;
	Map<Object, Object> pieMap = null;
	Map<Object, Object> barMap = null;
	
	List<Map<Object, Object>> areaList = new ArrayList<Map<Object, Object>>();
	List<Map<Object, Object>> pieList = new ArrayList<Map<Object, Object>>();
	List<Map<Object, Object>> barList = new ArrayList<Map<Object, Object>>();

	String areaDataPoints = null;
	String pieDataPoints = null;
	String barDataPoints = null;

	try {
		String db_collection_name = ConnectToDB.getCrime_collection_name();	
		// Get the mongodb database
		MongoDatabase db =  ConnectToDB.getDBConnection();		
		// Get the mongodb collection.
		MongoCollection<Document> collection = db.getCollection(db_collection_name);	

		System.out.println("Connected to database successfully");

		// FIRST AREA CHART
		List<Object> substrList = Arrays.asList(new Object[]{"$dateTime", 0, 7});
		DBObject monthProjection = new BasicDBObject("$substr", substrList);
		BasicDBObject groupFields = new BasicDBObject("_id", 0);

		groupFields.put("_id", monthProjection);
		groupFields.put("countByMonth", new BasicDBObject("$sum", 1));
		BasicDBObject group = new BasicDBObject("$group", groupFields);
		BasicDBObject sort = new BasicDBObject();
		sort.put("_id", -1);
		BasicDBObject orderby = new BasicDBObject("$sort", sort);

		List<BasicDBObject> operationList = new LinkedList<BasicDBObject>();
		operationList.add(group);
		operationList.add(orderby);

		AggregateIterable<Document> groupByDateDoc = collection.aggregate(operationList);

		for (Document doc : groupByDateDoc) {
			String date = doc.get("_id").toString();
			System.out.println("month: " + date);
			int countByMonth = doc.getInteger("countByMonth");
			System.out.println("count: " + countByMonth);
			areaMap = new HashMap<Object, Object>();

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
			Date dateObj = dateFormat.parse(date);
			long millis = dateObj.getTime();

			areaMap.put("x", millis);
			areaMap.put("y", countByMonth);

			areaList.add(areaMap);
			// parse list of object to json format
			areaDataPoints = areaGsonObj.toJson(areaList);
			// System.out.println(areaDataPoints);
		}

		// SECOND PIE CHART
		long totalCount = collection.count();
		BasicDBObject groupFields2 = new BasicDBObject("_id", 0);

		groupFields2.put("_id", "$type");
		groupFields2.put("countByType", new BasicDBObject("$sum", 1));
		BasicDBObject group2 = new BasicDBObject("$group", groupFields2);

		BasicDBObject sort2 = new BasicDBObject();
		sort2.put("countByType", -1);
		BasicDBObject orderby2 = new BasicDBObject("$sort", sort2);

		List<BasicDBObject> operationList2 = new LinkedList<BasicDBObject>();
		operationList2.add(group2);
		operationList2.add(orderby2);

		AggregateIterable<Document> groupByTypeDoc = collection.aggregate(operationList2);

		for (Document doc : groupByTypeDoc) {
			String type = doc.get("_id").toString();
			System.out.println("type: " + type);
			int countByType = doc.getInteger("countByType");
			System.out.println("countByType: " + countByType);

			pieMap = new HashMap<Object, Object>();

			long percentage = 100 * countByType / totalCount;
			pieMap.put("y", percentage);
			pieMap.put("legendText", type);
			pieMap.put("label", type);

			pieList.add(pieMap);
			// parse list of object to json format
			pieDataPoints = pieGsonObj.toJson(pieList);
			//System.out.println(pieDataPoints);
		}

		// THIRD BAR CHART
		BasicDBObject groupFields3 = new BasicDBObject("_id", 0);

		groupFields3.put("_id", "$location");
		groupFields3.put("countByLocation", new BasicDBObject("$sum", 1));
		BasicDBObject group3 = new BasicDBObject("$group", groupFields3);

		BasicDBObject sort3 = new BasicDBObject();
		sort3.put("countByLocation", -1);
		BasicDBObject orderby3 = new BasicDBObject("$sort", sort3);
		BasicDBObject limit3 = new BasicDBObject("$limit", 10);
		
		List<BasicDBObject> operationList3 = new LinkedList<BasicDBObject>();
		operationList3.add(group3);
		operationList3.add(orderby3);
		operationList3.add(limit3);

		AggregateIterable<Document> groupByLocationDoc = collection.aggregate(operationList3);

		for (Document doc : groupByLocationDoc) {
			String location = doc.get("_id").toString();
			System.out.println("location: " + location);
			int countByLocation = doc.getInteger("countByLocation");
			System.out.println("countByLocation: " + countByLocation);

			barMap = new HashMap<Object, Object>();

			barMap.put("y", countByLocation);
			barMap.put("label", location);

			barList.add(barMap);
			// parse list of object to json format
			barDataPoints = barGsonObj.toJson(barList);
			//System.out.println(pieDataPoints);			
		}
		ConnectToDB.closeMongoClient();

	} catch (MongoException e) {
		System.out.println("catch exception! " + e);
	}
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap CSS -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
		<style>
			body {
				background-color: #fafafa;
				font-size: 16px;
				line-height: 1.5;
			}
			
			h1,h2,h3,h4,h5,h6 {
				font-weight: 400;	
			}
			
			#header {
				border-bottom: 5px solid #37474F;
				color: #37474F;
				margin-bottom: 1.5rem;
				padding: 1rem 0;
			}
			
			.card {
				border: 0rem;
				border-radius: 0rem;
			}
			
			.card-header {
				background-color: #37474F;
				border-radius: 0 !important;
				color:	white;
				margin-bottom: 0;
				padding:	1rem;
			}

			.card-block {
				border: 1px solid #cccccc;	
			}
			
			.shadow {
				box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.14),
										0 1px 18px 0 rgba(0, 0, 0, 0.12),
										0 3px 5px -1px rgba(0, 0, 0, 0.2);
			}
			
			#areaChartContainer, #pieChartContainer, #barChartContainer {
				height: 300px;
				width: 100%;
			}			
		</style>

<script type="text/javascript">
	window.onload = function() {
		// CHART1: AREA CHART
		var chart1 = new CanvasJS.Chart("areaChartContainer", {
			animationEnabled : true,
			exportEnabled : true,
			title : {
				//text : "Monthly Sexual Harrasments",
				fontSize : 22,
				fontFamily : "Impact"
			},
			axisX : {
				valueFormatString : "MMM",
				interval : 1,
				intervalType : "month",
				title : "Month"
			},
			axisY : {
				title : "Number of cases"
			},
			data : [ {
				type : "splineArea",
				xValueType : "dateTime",
				yValueFormatString : "#,##0 cases",
				dataPoints : <%out.print(areaDataPoints);%>
			} ]
		});
		// CHART2: PIE CHART
		var chart2 = new CanvasJS.Chart("pieChartContainer", {
			theme : "light2", // "light1", "light2", "dark1", "dark2"
			exportEnabled : true,
			animationEnabled : true,
			title : {
				//text : "Harrasments Type",
				fontSize : 22,
				fontFamily : "Impact"
			},
			legend : {
				verticalAlign : "center",
				horizontalAlign : "left",
				fontSize : 14,
				fontFamily : "Helvetica"
			},
			theme : "light2",
			data : [ {
				type : "pie",
				//indexLabelFontFamily: "Garamond",
				indexLabelFontSize : 14,
				indexLabel : "{label} {y}%",
				startAngle : 0,
				showInLegend : true,
				toolTipContent : "{legendText} {y}%",
				dataPoints : <%out.print(pieDataPoints);%>
				} ]
		});
		// CHART3: BAR CHART
		var chart3 = new CanvasJS.Chart("barChartContainer", {
			animationEnabled: true,
			
			title:{
				//text:"Top 5 Cases Zipcode"
			},
			axisX:{
				interval: 1,
				reversed: true
			},
			axisY2:{
				interlacedColor: "rgba(1,77,101,.2)",
				interval: 1,
				gridColor: "rgba(1,77,101,.1)",
				//title: "Number of Cases"
			},
			data: [{
				type: "bar",
				axisYType: "secondary",
				yValueFormatString : "#,##0 cases",
				color: "#014D65",
				dataPoints: <%out.print(barDataPoints);%>
			}]
		});
		
		chart1.render();
		chart2.render();
		chart3.render();
	}
</script>

<script type="text/javascript"
	src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>

<body>
		<div class="container">
			<h2 id="header">
				<strong>Sexual Harassments Data Dashboard</strong>	
			</h2>
				<div align="left"><form method="post" action="listRecords">
					<button id="submit_btn" class="btn btn-secondary btn-sm">View or search full records
					</button></form></div>					
			<div class="row m-b-1">
				<div class="col-xs-12">
					<div class="card shadow">
						<h4 class="card-header">Monthly Sexual Harassments</h4>
						<div class="card-block">
							<div id="areaChartContainer"></div>
						</div>
					</div>
				</div>
			</div> <!-- row -->
			<div class="row m-b-1">
				<div class="col-md-6">
					<div class="card shadow">
						<h4 class="card-header">Harassments Type</h4>
						<div class="card-block">
							<div id="pieChartContainer"></div>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="card shadow">
						<h4 class="card-header">Top 10 Cases Zipcode</h4>
						<div class="card-block">
							<div id="barChartContainer"></div>
						</div>
					</div>
				</div>
			</div> <!-- row -->
		</div> <!-- container -->
	</body>

</html>