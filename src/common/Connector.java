package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Connector {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521/xe";
	private static final String ID = "c##test";
	private static final String PWD = "test";
	private static Connection conn;
	
	private static void init() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

//	private static final String URL = "jdbc:mariadb://localhost:3306/java";
//	private static final String ID = "test";
//	private static final String PWD = "test";
//	private static Connection conn;
//	
//	private static void init() {
//		try {
//			Class.forName("org.mariadb.jdbc.Driver");
//
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}

	public static Connection getConnection() {
		if(conn == null) {
			init();
			
			try {
				conn = DriverManager.getConnection(URL, ID, PWD);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}return conn;
	}
	
	public static void close() {
		if(conn!=null) {
			try{
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		conn = null;
	}

	public static void main(String[] args) throws SQLException {
			Connection conn = getConnection();
			Statement stmt = conn.createStatement();
			String sql = "select * from board";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.println("출력");
			}
	}

}

