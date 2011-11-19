package com.goodjob.db;

/**<pre>
 * 2011. 11. 14.
 * COPYRIGHT - gundallove
 * DBManager.java
 *</pre>
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

import org.apache.commons.dbutils.DbUtils;

/**
 * <table><tr><td>
 * 자카르차의 커먼스 프로젝트이 commons-dbcp 를 이용한 풀이다.
 * 디비세팅값은 dbpool.properties 에 들어가야 하며
 * 파일의 위치는 클래스 패스내에 있어야 하며 팩키지 않에 들어가지 않아야 한다.
 * DBManager.java
 * </td></tr></table>
 */


public class DBManager {
	
	private static String driver = "";
	private static String url = "";
	private static String user = "";
	private static String password = "";
	
	static {
		
		ResourceBundle rb = ResourceBundle.getBundle("com.goodjob.db.dbpool");
		driver = rb.getString("driver");
		url = rb.getString("url");
		user = rb.getString("user");
		password = rb.getString("password");
	}
	
	/**
	 * 커넥션을 얻어 온다. 
	 * getConnection
	 * @param connName
	 * @return
	 * @throws SQLException Connection
	 */
	public static Connection getConnection() throws SQLException{
		
		DbUtils.loadDriver(driver);
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
}
