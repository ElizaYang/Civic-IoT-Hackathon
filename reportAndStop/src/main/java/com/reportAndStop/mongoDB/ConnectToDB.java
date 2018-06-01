package com.reportAndStop.mongoDB;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

public class ConnectToDB {
	
	static MongoClient mongoClient;
	
	// Method to make a connection to the mongodb server listening on a default port
	public static MongoDatabase getDBConnection() {
		
		MongoClientURI uri = new MongoClientURI("mongodb://se452admin:se452admin@ds133241.mlab.com:33241/heroku_p6rw9bjd");
		mongoClient = new MongoClient(uri);

		MongoDatabase db = mongoClient.getDatabase(uri.getDatabase());
		return db;
	}

	// Close
	public static void closeMongoClient(){
		mongoClient.close();
    }
	
//	public static String getCrime_db_name() {
//		return "crimeDB";
//	}
	public static String getCrime_collection_name() {
		return "crime_records";
	}
//	public static String getPolice_db_name() {
//		return "officer_records";
//	}
	public static String getPolice_collection_name() {
		return "officerLoginInfo";
	}

}
