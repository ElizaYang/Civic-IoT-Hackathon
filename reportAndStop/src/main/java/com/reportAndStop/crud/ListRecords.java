package com.reportAndStop.crud;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.reportAndStop.bean.Record;
import com.reportAndStop.mongoDB.ConnectToDB;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;

@WebServlet(name = "listRecords", urlPatterns = {"/listRecords"})
public class ListRecords extends HttpServlet{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
		
		// array list store all queried records
		List<Record> list = new ArrayList<Record>();
		
		String db_name = ConnectToDB.getCrime_db_name();
		String db_collection_name = ConnectToDB.getCrime_collection_name();

		// Get the mongodb connection
		MongoClient curConnection = ConnectToDB.getConnection();
		MongoDatabase db = curConnection.getDatabase(db_name);
		
		// Get the mongodb collection.
		MongoCollection<Document> collection = db.getCollection(db_collection_name);
		// Get all documents in the collection
		FindIterable<Document> result = collection.find();
		// Use cursor iterator
		MongoCursor<Document> cursor = result.iterator();
		// Iterate records
		while (cursor.hasNext()) {
			Document document = cursor.next();
			
            Record record = new Record();
            
            record.setId(document.get("_id").toString());  
            
            record.setDateTime(document.get("dateTime").toString());
            record.setLocation(document.get("location").toString());
            record.setType(document.get("type").toString());
            record.setInvest(document.get("invest").toString());            
            
            record.setName(document.get("name").toString());
            record.setContact(document.get("contact").toString());

            record.setSuspRace(document.get("suspRace").toString());
            record.setSuspGender(document.get("suspGender").toString());          
            record.setSuspAge(document.get("suspAge").toString());           
            record.setSuspHeight(document.get("suspHeight").toString());
            record.setSuspWeight(document.get("suspWeight").toString());
            record.setSuspChar(document.get("suspChar").toString());

            list.add(record);
		}
		// sent back to request page
		request.setAttribute("records", list);
		// close connection to db
		curConnection.close();
		
		RequestDispatcher view = request.getRequestDispatcher("/listRecords.jsp");
        view.forward(request, response);
	}
            
	@Override	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}
}
