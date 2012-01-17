package com.goodjob.coupon;

import java.sql.Connection;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import com.goodjob.coupon.dto.CouponDto;
import com.goodjob.db.DBManager;
import com.goodjob.sql.BBS;
import com.goodjob.sql.COUPON;
import com.goodjob.util.Utils;
import com.sun.org.apache.xpath.internal.operations.Bool;

public class CouponDao {
	
	/**
	 * 
	 * @param cCode
	 * @return 0:코드없음, 1:코드등록완료, 2:등록된코드
	 */
	public int chkCouponReg(String cCode, String userId){
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
			
			if(list.size() == 0){
				return 0;
			}else{
				if(list.get(0).getReg_user() == null){
					bind = new ArrayList<Object>();
					bind.add(userId);
					bind.add(list.get(0).getCoupon_seq());
					qr.update(conn, COUPON.coupon_update , bind.toArray());
				}else{	
					return 2;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return 1;
	}	

	public List<CouponDto> getUserCouponList(String userId, String cType, Boolean chkDate){
		List<CouponDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			String strQuery = "";
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(userId);
			if(cType.equals("0"))
			{				
				strQuery = " AND use_date IS NULL ";
			}else{
				strQuery = " AND use_date IS NOT NULL ";
			}
			if(chkDate){
				String strNowDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
				strQuery += " AND expiredate_end >= '"+strNowDate+"'";
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
	
	public void setCouponUse(CouponDto cpDto){
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			QueryRunner qr = new QueryRunner();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cpDto.getMenu_seq());
			bind.add(cpDto.getReserve_seq());
			bind.add(cpDto.getCoupon_seq());
			qr.update(conn, COUPON.coupon_use_update , bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
	
	public void setCouponUseCancel(int menuSeq, int reserveSeq){
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			QueryRunner qr = new QueryRunner();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(menuSeq);
			bind.add(reserveSeq);
			qr.update(conn, COUPON.coupon_use_cancel_update , bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
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
	
	public List<CouponDto> getCouponList(Map<String,String> data){
		List<CouponDto> list = null;
		Connection conn = null;
		
		String type = StringUtils.defaultIfEmpty(data.get("type"), "");
		String field = StringUtils.defaultIfEmpty(data.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
		int npage = NumberUtils.toInt(data.get("npage"), 1);
		int per_page = NumberUtils.toInt(data.get("per_page"), 20);
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(type);
			
			//검색조건
			String where = "";
			if("code".equals(field) && keyword.length()>0){
				where = "and a.coupon_code = ? " ;
				bind.add(keyword);
			}
			else if("price".equals(field) && keyword.length()>0){
				where = "and a.sale_price = ? " ;
				bind.add(keyword);
			}
			else if("start_dt".equals(field) && keyword.length()>0){
				where = "and a.expiredate_start = ? " ;
				bind.add(keyword);
			}
			else if("end_dt".equals(field) && keyword.length()>0){
				where = "and a.expiredate_end = ? " ;
				bind.add(keyword);
			}
			
			//페이징
			bind.add(((npage-1)* per_page));
			bind.add(per_page);
			
			ResultSetHandler rsh = new BeanListHandler(CouponDto.class);
			
			QueryRunner qr = new QueryRunner();
						
			list = (List<CouponDto>) qr.query(conn , MessageFormat.format(COUPON.coupon_list, where), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public int getTotalCoupon(Map<String,String> data){
		Connection conn = null;
		Map<String, Long> map = null;
		String type = StringUtils.defaultIfEmpty(data.get("type"), "");
		String field = StringUtils.defaultIfEmpty(data.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(type);
			
			//검색조건
			String where = "";
			if("name".equals(field) && keyword.length()>0){
				where = "and b.mem_name LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("id".equals(field) && keyword.length()>0){
				where = "and b.mem_id LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("remain".equals(field)){
				where = "and reg_user is null " ;
			}
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map<String, Long>)qr.query(conn , MessageFormat.format(COUPON.coupon_total, where), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("cnt")+"");
	}
	
}
