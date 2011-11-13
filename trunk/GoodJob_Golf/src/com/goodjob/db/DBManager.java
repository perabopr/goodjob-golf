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
	
	private static final String connName = "mysql";
	private static String pool = null;
	private static DBManager instance = null;
	private static String dbUser = "";
	private static String dbPass = "";
	private static String dbHost = "";
	private static String dbName = "";
	
	/**
	 * 커넥션을 얻어 온다. 
	 * getConnection
	 * @param connName
	 * @return
	 * @throws SQLException Connection
	 */
	public static Connection getConnection() throws SQLException{
		
		DbUtils.loadDriver("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://"+dbHost+"/"+dbName, dbUser, dbPass);
		return conn;
	}
}
