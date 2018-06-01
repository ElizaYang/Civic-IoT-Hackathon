
package com.reportAndStop.crud;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.reportAndStop.mongoDB.ConnectToDB;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;

// name show on url 
@WebServlet(name = "createRecord", urlPatterns = { "/createRecord" })
public class CreateRecord extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// processRequest(request, response);
		String insertMessage = "";

		req.setCharacterEncoding("UTF-8");

		// Get id info from the page
		String name = req.getParameter("name");
		String contact = req.getParameter("contact");
		String invest = req.getParameter("invest");
		String dateTime = req.getParameter("dateTime");
		String location = req.getParameter("location");
		String type = req.getParameter("type");
		String suspGender = req.getParameter("suspGender");
		String suspAge = req.getParameter("suspAge");
		String suspHeight = req.getParameter("suspHeight");
		String suspWeight = req.getParameter("suspWeight");
		String suspRace = req.getParameter("suspRace");
		String suspSkinTone = req.getParameter("suspSkinTone");
		String suspChar = req.getParameter("suspChar");

		String db_collection_name = ConnectToDB.getCrime_collection_name();

		// Get the mongodb connection
		MongoDatabase db = ConnectToDB.getDBConnection();

		// Get the mongodb collection.
		MongoCollection<Document> collection = db.getCollection(db_collection_name);
		

		try {
			collection.insertOne(new Document().append("name", name).append("contact", contact).append("invest", invest)
					.append("dateTime", dateTime).append("location", location).append("type", type)
					.append("suspGender", suspGender).append("suspAge", suspAge).append("suspHeight", suspHeight)
					.append("suspWeight", suspWeight).append("suspRace", suspRace).append("suspSkinTone", suspSkinTone)
					.append("suspChar", suspChar));
			insertMessage = "Record successfully inserted!";
		} catch (Exception e) {
			insertMessage = "An error occured while inserting data! Error is:" + e;
		}
		req.setAttribute("insertMessage", insertMessage);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/donePage.html");
		dispatcher.forward(req, resp);
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String insertMessage = "";
		request.setAttribute("insertMessage", insertMessage);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/donePage.html");
		dispatcher.forward(request, response);
	}
}
