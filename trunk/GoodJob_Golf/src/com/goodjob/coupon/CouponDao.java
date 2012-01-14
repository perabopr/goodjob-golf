package com.goodjob.coupon;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import com.goodjob.coupon.dto.CouponDto;
import com.goodjob.db.DBManager;
import com.goodjob.sql.COUPON;

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
}
