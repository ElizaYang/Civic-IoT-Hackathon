package com.reportAndStop.crud;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.reportAndStop.bean.Record;
import com.reportAndStop.mongoDB.ConnectToDB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

@WebServlet(name = "searchRecords", urlPatterns = {"/searchRecords"})
public class SearchRecords extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// This method is called by the servlet container to process a 'post' request
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		doGet(req, resp);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		// Reading post parameters from the request
		String date = req.getParameter("search_date"), 
			   location = req.getParameter("search_location"),
			   type = req.getParameter("search_type"),
			   age = req.getParameter("search_age"),
			   height = req.getParameter("search_height"),
			   race = req.getParameter("search_race");
		
		// array list store all queried records
		List<Record> filterList = new ArrayList<Record>();
		
		List<BasicDBObject> objList = new ArrayList<BasicDBObject>();	
//		if ((date == null || location == null && type == null && age == null && height == null && race == null)
//				|| date + location + type + age + height + race == "") {
		if ((type == null && age == null && height == null && race == null)
				&& location == "" && date =="") {
			req.setAttribute("error_message", "Filter at least one field before search.");
			req.getRequestDispatcher("/listRecords.jsp").forward(req, resp);
		} else {
			if (date != null && date != "") {
				objList.add(new BasicDBObject("dateTime", date));
			}
			if (location != null && location != "") {
				objList.add(new BasicDBObject("location", location));
			}
			if (type != null && type != "") {
				objList.add(new BasicDBObject("type", type));
			}
			if (age != null && age != "") {
				objList.add(new BasicDBObject("suspAge", age));
			}
			if (height != null && height != "") {
				objList.add(new BasicDBObject("suspHeight", height));
			}
			if (race != null && race != "") {
				objList.add(new BasicDBObject("suspRace", race));
			}
			
			String db_collection_name = ConnectToDB.getCrime_collection_name();
			// Get the mongodb database
			MongoDatabase db =  ConnectToDB.getDBConnection();		
			// Get the mongodb collection.
			MongoCollection<Document> collection = db.getCollection(db_collection_name);
		
			BasicDBObject whereQuery = new BasicDBObject();
			// Pipeline the query criteria
			whereQuery.put("$and", objList);
			System.out.println("Query is?= " + whereQuery.toString());
			
			FindIterable<Document> cursor = collection.find(whereQuery);
			
			for(Document doc : cursor) {
				
				Record record = new Record();            
	            record.setId(doc.get("_id").toString());              
	            record.setDateTime(doc.get("dateTime").toString());
	            record.setLocation(doc.get("location").toString());
	            record.setType(doc.get("type").toString());
	            record.setInvest(doc.get("invest").toString());                       
	            record.setName(doc.get("name").toString());
	            record.setContact(doc.get("contact").toString());
	            record.setSuspRace(doc.get("suspRace").toString());
	            record.setSuspGender(doc.get("suspGender").toString());          
	            record.setSuspAge(doc.get("suspAge").toString());           
	            record.setSuspHeight(doc.get("suspHeight").toString());
	            record.setSuspWeight(doc.get("suspWeight").toString());
	            record.setSuspChar(doc.get("suspChar").toString());

	            filterList.add(record);
				//record_found = true;
			}

			// sent back to request page
			req.setAttribute("records", filterList);
			// close connection to db
			ConnectToDB.closeMongoClient();
			RequestDispatcher view = req.getRequestDispatcher("/listRecords.jsp");
	        view.forward(req, resp);			
		}		
		
	}
}