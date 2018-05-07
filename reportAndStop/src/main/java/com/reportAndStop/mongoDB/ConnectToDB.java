package com.reportAndStop.mongoDB;

import com.mongodb.MongoClient;

public class ConnectToDB {
	
	static MongoClient mongoClntObj;
	
	// Method to make a connection to the mongodb server listening on a default port
	public static MongoClient getConnection() {
		int port_no = 27017;
		String url = "localhost";

		mongoClntObj = new MongoClient(url, port_no);
		return mongoClntObj;
	}
	// Close
	public static void closeMongoClient(){
		mongoClntObj.close();
    }
	
	public static String getCrime_db_name() {
		return "crimeDB";
	}
	public static String getCrime_collection_name() {
		return "crime_records";
	}
	public static String getPolice_db_name() {
		return "officer_records";
	}
	public static String getPolice_collection_name() {
		return "officerLoginInfo";
	}

}
