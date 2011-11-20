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

import com.goodjob.db.DBManager;
import com.goodjob.sql.ZIPCODE;

/**
 * @author Administrator
 *
 */
public class ZipCodeDao {

	public List<ZipCodeDto> getAddress(String dong){
		
		List<ZipCodeDto> list = null;
		Connection conn = null;
		try {
          	conn = DBManager.getConnection();
			ArrayList<String> params = new ArrayList<String>();
			params.add(dong);
			
			ResultSetHandler rsh = new BeanListHandler(ZipCodeDto.class);
			QueryRunner qr = new QueryRunner();
			list = (List<ZipCodeDto>)qr.query(conn, ZIPCODE.address, rsh , params);
           
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public static void main(String[] a){
		
		ZipCodeDao dao = new ZipCodeDao();
		List<ZipCodeDto> list = dao.getAddress("서초");
		
		System.out.println(list.size());
	}
}
