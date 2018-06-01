package com.reportAndStop.crud;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.reportAndStop.mongoDB.ConnectToDB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import org.bson.types.ObjectId;

@WebServlet(name = "deleteRecords", urlPatterns = {"/deleteRecords"})
public class DeleteRecords extends HttpServlet{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
		
		// Get collection name	
		String db_collection_name = ConnectToDB.getCrime_collection_name();
		// Get the mongodb database
		MongoDatabase db =  ConnectToDB.getDBConnection();		
		// Get the mongodb collection.
		MongoCollection<Document> collection = db.getCollection(db_collection_name);
		
		
		String[] selectedIds = request.getParameterValues("_id");
		System.out.println("selectedIds numbers: " + selectedIds.length);
		for (int i = 0; i < selectedIds.length; i++) {
			String id = selectedIds[i];
			System.out.println("deleting record: " + id);
			ObjectId objectId = new ObjectId(id);
			
			try {
				collection.deleteOne(new Document("_id",objectId));	     
				ConnectToDB.closeMongoClient();
	        } catch (Exception e) {
	        	System.out.println("Error: " + e);
	        }
		}		
		
		response.sendRedirect(request.getContextPath()+"/listRecords");
	}
            

}
