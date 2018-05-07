package com.reportAndStop.servlet;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import com.reportAndStop.mongoDB.ConnectToDB;
import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class LoginValidate {

//	// Method to make a connection to the mongodb server listening on a default port
//	
//	public static MongoClient getConnection() {
//		int port_no = 27017;
//		String url = "localhost";
//
//		MongoClient mongoClntObj = new MongoClient(url, port_no);
//		return mongoClntObj;
//	}

	// Method to search a user in the mongodb
	public static boolean searchUserInDb(String loginId, String loginPwd) {
		boolean user_found = false;
		
		String db_name = ConnectToDB.getPolice_db_name();
		String db_collection_name = ConnectToDB.getPolice_collection_name();

		// Get the mongodb connection
		MongoDatabase db = ConnectToDB.getConnection().getDatabase(db_name);

		// Get the mongodb collection.
		MongoCollection<Document> col = db.getCollection(db_collection_name);

		// Get the particular record from the mongodb collection		
		List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
		obj.add(new BasicDBObject("id", loginId));
		obj.add(new BasicDBObject("pwd", loginPwd));

		// Form a where query
		BasicDBObject whereQuery = new BasicDBObject();
		whereQuery.put("$and", obj);
		System.out.println("Sql query is?= " + whereQuery.toString());

		FindIterable<Document> cursor = col.find(whereQuery);
		for(Document doc : cursor) {
			System.out.println("Found?= " + doc);
			user_found = true;
		}
		return user_found;
	}
}