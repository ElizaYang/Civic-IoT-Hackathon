package com.reportAndStop.crud;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.reportAndStop.bean.Record;
import com.reportAndStop.mongoDB.ConnectToDB;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import org.bson.types.ObjectId;

@WebServlet(name = "updateRecords", urlPatterns = { "/updateRecords" })
public class UpdateRecords extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get collection name
		String db_collection_name = ConnectToDB.getCrime_collection_name();
		// Get the mongodb database
		MongoDatabase db = ConnectToDB.getDBConnection();
		// Get the mongodb collection.
		MongoCollection<Document> collection = db.getCollection(db_collection_name);

		String selectedId = request.getParameter("_id");
		ObjectId objectId = new ObjectId(selectedId);
		FindIterable<Document> searchResult = collection.find(new Document("_id", objectId));

		MongoCursor<Document> cursor = searchResult.iterator();
		Document oldRecord = cursor.next();
		Record selectedRecord = new Record();

		selectedRecord.setId(oldRecord.get("_id").toString());		
		
		selectedRecord.setDateTime(oldRecord.get("dateTime").toString());				
		selectedRecord.setLocation(oldRecord.get("location").toString());
		selectedRecord.setType(oldRecord.get("type").toString());
		selectedRecord.setInvest(oldRecord.get("invest").toString());

		selectedRecord.setName(oldRecord.get("name").toString());
		selectedRecord.setContact(oldRecord.get("contact").toString());

		selectedRecord.setSuspRace(oldRecord.get("suspRace").toString());
		selectedRecord.setSuspGender(oldRecord.get("suspGender").toString());
		selectedRecord.setSuspAge(oldRecord.get("suspAge").toString());
		selectedRecord.setSuspHeight(oldRecord.get("suspHeight").toString());
		selectedRecord.setSuspWeight(oldRecord.get("suspWeight").toString());
		selectedRecord.setSuspChar(oldRecord.get("suspChar").toString());

		request.setAttribute("selectedRecord", selectedRecord);
		ConnectToDB.closeMongoClient();

		RequestDispatcher dispatcher = request.getRequestDispatcher("/updateRecords.jsp");
		dispatcher.forward(request, response);
		// response.sendRedirect(request.getContextPath()+"/updateRecords");               
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String selectedId = request.getParameter("_id");
		ObjectId objectId = new ObjectId(selectedId);

		// Get collection name
		String db_collection_name = ConnectToDB.getCrime_collection_name();
		// Get the mongodb database
		MongoDatabase db = ConnectToDB.getDBConnection();
		// Get the mongodb collection.
		MongoCollection<Document> collection = db.getCollection(db_collection_name);

		try {
			collection.updateOne(new Document("_id", objectId),
					new Document("$set",
							new Document().append("dateTime", request.getParameter("dateTime"))
							.append("location", request.getParameter("location"))
							.append("type", request.getParameter("type"))
							.append("invest", request.getParameter("invest"))
							.append("name", request.getParameter("name"))
							.append("contact", request.getParameter("contact"))
							.append("suspRace", request.getParameter("suspRace"))
							.append("suspGender", request.getParameter("suspGender"))
							.append("suspAge", request.getParameter("suspAge"))
							.append("suspHeight", request.getParameter("suspHeight"))
							.append("suspWeight", request.getParameter("suspWeight"))
							.append("suspChar", request.getParameter("suspChar"))
											));
			System.out.println("Update Is Successful");
		} catch (Exception e) {
			System.out.println("An error occured while updating record. Error is:" + e);
		}
		ConnectToDB.closeMongoClient();


		//RequestDispatcher dispatcher = request.getRequestDispatcher("/updateRecords.jsp");
		//dispatcher.forward(request, response);
		response.sendRedirect(request.getContextPath()+"/listRecords");
	}

}
