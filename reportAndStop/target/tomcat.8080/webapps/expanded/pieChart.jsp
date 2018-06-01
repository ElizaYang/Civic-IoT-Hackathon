<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.mongodb.*" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCursor" %>
<%@ page import="com.mongodb.client.FindIterable" %>
<%@ page import="com.mongodb.client.AggregateIterable" %>
<%@ page import="com.reportAndStop.mongoDB.ConnectToDB" %>
<%@ page import="org.bson.Document" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.text.*" %>
<%@ page import="com.google.gson.*" %>

<%
	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	String dataPoints = null;
	
	try {
		String db_collection_name = ConnectToDB.getCrime_collection_name();	
		// Get the mongodb database
		MongoDatabase db =  ConnectToDB.getDBConnection();		
		// Get the mongodb collection.
		MongoCollection<Document> collection = db.getCollection(db_collection_name);				
	
        System.out.println("Connected to database successfully");
        
        long totalCount = collection.count();
        BasicDBObject groupFields = new BasicDBObject("_id", 0);
        
		groupFields.put("_id", "$type");
		groupFields.put("count", new BasicDBObject( "$sum", 1));
		BasicDBObject group = new BasicDBObject("$group", groupFields);	
		
		
		
		BasicDBObject sort = new BasicDBObject();
		sort.put("count", -1);
		BasicDBObject orderby = new BasicDBObject("$sort", sort);	

		List<BasicDBObject> operationList = new LinkedList<BasicDBObject>();
		operationList.add(group);	
		operationList.add(orderby);
		
		AggregateIterable<Document> groupByTypeDoc = collection.aggregate(operationList);
		
		
		for (Document doc : groupByTypeDoc ) {
			String type = doc.get("_id").toString();
            System.out.println("type: " + type);
            int count = doc.getInteger("count");
            System.out.println("count: " + count);
            
            map = new HashMap<Object, Object>();   
            
            long percentage = 100*count/totalCount;
        	map.put("y", percentage);  
        	map.put("legendText", type);  
        	map.put("label", "Verbal"); 

			
			list.add(map);
			// parse list of object to json format
            dataPoints = gsonObj.toJson(list);
            System.out.println(dataPoints);
		}

	} catch (MongoException e) {
		System.out.println("catch exception! " + e);
}	

%> 
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	window.onload = function() {
	
	var chart = new CanvasJS.Chart("pieChartContainer", {
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		exportEnabled: true,
		animationEnabled: true,
		title: {
			text: "Harrasments Type Percentage",
			fontFamily: "Impact"
		},
		legend: {
	        verticalAlign: "center",
	        horizontalAlign: "left",
	        fontSize: 16,
	        fontFamily: "Helvetica"
	    },
	    theme: "light2",
	    data: [
	    {
	        type: "pie",
	        //indexLabelFontFamily: "Garamond",
	        indexLabelFontSize: 20,
	        indexLabel: "{label} {y}%",
	        startAngle: 0,
	        showInLegend: true,
	        toolTipContent: "{legendText} {y}%",
	        dataPoints: <%out.print(dataPoints);%>              
	    }
	    ]
	});
	chart.render();
}
</script>
</head>
<body>
<div id="pieChartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
