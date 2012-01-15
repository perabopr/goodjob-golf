package com.goodjob.coupon;

import java.sql.Connection;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.goodjob.coupon.dto.CouponDto;
import com.goodjob.db.DBManager;
import com.goodjob.sql.BBS;
import com.goodjob.sql.COUPON;
import com.goodjob.util.Utils;

public class CouponDao {
	public List<CouponDto> getGolfLinkList(String cCode){
		List<CouponDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			String strQuery = "";
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cCode);
			
			ResultSetHandler rsh = new BeanListHandler(CouponDto.class);
			
			QueryRunner qr = new QueryRunner();
						
			list = (List<CouponDto>) qr.query(conn , MessageFormat.format(COUPON.chkCouponReg, strQuery), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}	

	public List<CouponDto> getGolfLinkList(String userId, String cType){
		List<CouponDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			String strQuery = "";
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(userId);
			if(cType.equals("0"))
			{				
				strQuery = " AND use_date IS NULL";
			}
			
			ResultSetHandler rsh = new BeanListHandler(CouponDto.class);
			
			QueryRunner qr = new QueryRunner();
						
			list = (List<CouponDto>) qr.query(conn , MessageFormat.format(COUPON.listUserCoupon, strQuery), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public void setCoupon(String coupon_name , String type , List<String[]> coupon){
		Connection conn = null;
		try {

			conn = DBManager.getConnection();
			
			String[] temp = null;
			ArrayList<Object> params = null;
			QueryRunner qr = new QueryRunner();
			int size = coupon.size();
			
			for(int i = 0 ; i < size ; i++){
				
				temp = coupon.get(i);
				params = new ArrayList<Object>();
				params.add(coupon_name);
				params.add(type);
				params.add(temp[0]);
				params.add(temp[1]);
				params.add(Utils.getDate("yyyy-MM-dd"));
				params.add(temp[2]);

				qr.update(conn, COUPON.coupon_insert , params.toArray());	
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
}
