/**
 * 
 */
package com.goodjob.zipcode;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.goodjob.db.DBManager;
import com.goodjob.sql.ZIPCODE;

/**
 * @author Administrator
 *
 */
public class ZipCodeDao {

	Logger logger = Logger.getLogger(this.getClass());
	
	public List<ZipCodeDto> getAddress(String dong){
		
		List<ZipCodeDto> list = null;
		Connection conn = null;
		try {
			
			
			Object[] params = new Object[1];
			params[0] = dong;
			
          	conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new BeanListHandler(ZipCodeDto.class);
			QueryRunner qr = new QueryRunner();
			list = (List<ZipCodeDto>)qr.query(conn, ZIPCODE.address, rsh , params);
           
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public static void main(String[] a){
		
		ZipCodeDao dao = new ZipCodeDao();
		List<ZipCodeDto> list = dao.getAddress("서초");
		
		ZipCodeDto dto;
		for(int i = 0 ; i < list.size(); i++){
			
			dto = list.get(i);
			System.out.println("SIDO : " + dto.getSido());
			System.out.println("DONG : " + dto.getDong());
			System.out.println("=");
			
		}
	}
}
