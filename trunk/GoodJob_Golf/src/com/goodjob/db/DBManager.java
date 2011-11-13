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
import java.util.Enumeration;
import java.util.Properties;
import java.util.ResourceBundle;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.ConnectionFactory;
import org.apache.commons.dbcp.DataSourceConnectionFactory;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDriver;
import org.apache.commons.pool.ObjectPool;
import org.apache.commons.pool.impl.GenericObjectPool;

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

	/**
	 * 커넥션을 얻어 온다. 
	 * getConnection
	 * @param connName
	 * @return
	 * @throws SQLException Connection
	 */
	public static Connection getConnection() throws SQLException{
		
		if(instance == null) {
			if(!initDrivers(connName))
				return null;
		}
		Connection conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:" + connName);
		return conn;
	}
	
	/**
	 * 커넥션의 세팅값이 있는지 조사한다. 
	 * initDrivers
	 * @return boolean
	 */
	public synchronized static boolean initDrivers(String connName){
		
		if(instance == null){
			
			String tmp = "";
			DBManager  connPool = new DBManager();
			ResourceBundle rbun = ResourceBundle.getBundle("com.goodjob.db.dbpool");
			Enumeration enumeration = rbun.getKeys();
			Properties  props  = new Properties();
			props.put("db" , connName);
			
			try{
				
				while(enumeration.hasMoreElements()){
					tmp = (String)enumeration.nextElement();
					props.put( tmp , rbun.getString(tmp));
				}
				
				connPool.loadDrivers(props);
				
			}catch(Exception e) {
				return false;
			}

			instance = connPool;
		}
		return true;
	}
	
	/**
	 * BasicDataSource 에 디비 세팅값을 세팅한다. 
	 * loadDrivers
	 * @param props void
	 */
	private void loadDrivers(Properties props){

		BasicDataSource  bds = null;
		String  name    = null;
		String  pool    = null;
		String  driver  = null;
		String  url   = null;
		String  db   = null;
		String  user  = null;
		String  password = null;
		int   maxActive = 10;
		int   maxIdle  = 30;
		int   maxWait  = 10000;
		boolean  defaultAutoCommit = false;
		boolean  defaultReadOnly   = false;

		try{
			db					= props.getProperty("db");
			driver     			= props.getProperty(db+".driver");
			url      				= props.getProperty(db+".url");
			user     			= props.getProperty(db+".user");
			password    	= props.getProperty(db+".password");
			maxActive    	= Integer.parseInt(props.getProperty(db+".maxActive"));
			maxIdle     		= Integer.parseInt(props.getProperty(db+".maxIdle"));
			maxWait     		= Integer.parseInt(props.getProperty(db+".maxWait"));
			defaultAutoCommit 	= props.getProperty(db+".defaultAutoCommit").equals("true");
			defaultReadOnly   	= props.getProperty(db+".defaultReadOnly").equals("true");

			bds = new BasicDataSource();
			bds.setDriverClassName(driver);
			bds.setUrl(url);
			bds.setUsername(user);
			bds.setPassword(password);
			bds.setMaxActive(maxActive);
			bds.setMaxIdle(maxIdle);
			bds.setMaxWait(maxWait);
			bds.setDefaultAutoCommit(defaultAutoCommit);
			bds.setDefaultReadOnly(defaultReadOnly);

			createPools(db, bds);

			System.out.println("Initialized pool : " + db);

		}catch(Exception e) {
			System.out.println("Can't initialize pool : " + db);
		}
	}

	/**
	 * 실제로 디비커넥션을 생성 한다. 
	 * createPools
	 * @param pool
	 * @param bds
	 * @throws Exception void
	 */
	private void createPools(String pool, BasicDataSource bds) throws Exception {
		try{

			ObjectPool    connectionPool    = new GenericObjectPool(null);
			ConnectionFactory  connectionFactory = new DataSourceConnectionFactory(bds);
			PoolableConnectionFactory poolableConnectionFactory; 

			try{
				poolableConnectionFactory = new PoolableConnectionFactory(connectionFactory, connectionPool, null, null, false, true);
			} catch(Exception e) {
				return;
			}

			PoolingDriver driver = new PoolingDriver();
			driver.registerPool(pool, connectionPool);

		}catch(Exception e)	{
			e.printStackTrace();
		}
	}
}
