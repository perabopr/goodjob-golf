/**
 * 
 */
package com.goodjob.mypage;

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
import com.goodjob.reserve.dto.CondoReserveDto;
import com.goodjob.reserve.dto.GolfLinkReserveDto;
import com.goodjob.reserve.dto.PackageReserveDto;
import com.goodjob.sql.BBS;
import com.goodjob.sql.MYPAGE;

/**
 * @author Administrator
 *
 */
public class MyPageDao {

	public List<GolfLinkReserveDto> getGolfReserveList(Map<String,String> params){
		
		List<GolfLinkReserveDto> list = null;
		Connection conn = null;
		
		String startDt = StringUtils.trimToEmpty(params.get("startDt"));
		String endDt = StringUtils.trimToEmpty(params.get("endDt"));
		String mem_id = StringUtils.trimToEmpty(params.get("mem_id"));
		
		int npage = NumberUtils.toInt(params.get("npage"), 1);
		int per_page = NumberUtils.toInt(params.get("per_page"), BBS.per_page);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mem_id);
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkReserveDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if(startDt.length()>0 && endDt.length() > 0){
				where = " and date_format(reserve_day,'%Y-%m-%d') between ? and ? " ;
				bind.add(startDt);
				bind.add(endDt);
			}
			
			list = (List<GolfLinkReserveDto>) qr.query(conn , MessageFormat.format(MYPAGE.my_golf_reserve, where), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	public List<PackageReserveDto> getPackageReserveList(Map<String,String> params){
		
		List<PackageReserveDto> list = null;
		Connection conn = null;
		
		String startDt = StringUtils.trimToEmpty(params.get("startDt"));
		String endDt = StringUtils.trimToEmpty(params.get("endDt"));
		String mem_id = StringUtils.trimToEmpty(params.get("mem_id"));
		
		int npage = NumberUtils.toInt(params.get("npage"), 1);
		int per_page = NumberUtils.toInt(params.get("per_page"), BBS.per_page);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> bind = new ArrayList<Object>();
			//bind.add("3");
			bind.add(mem_id);
			
			ResultSetHandler rsh = new BeanListHandler(PackageReserveDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if(startDt.length()>0 && endDt.length() > 0){
				where = " and date_format(reserve_day,'%Y-%m-%d') between ? and ? " ;
				bind.add(startDt);
				bind.add(endDt);
			}
			
			list = (List<PackageReserveDto>) qr.query(conn , MessageFormat.format(MYPAGE.my_package_reserve, where), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	public List<CondoReserveDto> getCondoReserveList(Map<String,String> params){
		
		List<CondoReserveDto> list = null;
		Connection conn = null;
		
		String startDt = StringUtils.trimToEmpty(params.get("startDt"));
		String endDt = StringUtils.trimToEmpty(params.get("endDt"));
		String mem_id = StringUtils.trimToEmpty(params.get("mem_id"));
		
		int npage = NumberUtils.toInt(params.get("npage"), 1);
		int per_page = NumberUtils.toInt(params.get("per_page"), 20);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add("5");
			bind.add(mem_id);
			
			ResultSetHandler rsh = new BeanListHandler(CondoReserveDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if(startDt.length()>0 && endDt.length() > 0){
				where = " and date_format(reserve_day,'%Y-%m-%d') between ? and ? " ;
				bind.add(startDt);
				bind.add(endDt);
			}
			
			list = (List<CondoReserveDto>) qr.query(conn , MessageFormat.format(MYPAGE.my_condo_reserve, where), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	public List<CouponDto> getMyCouponList(Map<String,String> params){
		
		List<CouponDto> list = null;
		Connection conn = null;
		
		String startDt = StringUtils.trimToEmpty(params.get("startDt"));
		String endDt = StringUtils.trimToEmpty(params.get("endDt"));
		String mem_id = StringUtils.trimToEmpty(params.get("mem_id"));
		
		String field = StringUtils.defaultIfEmpty(params.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(params.get("keyword"), "");
		
		String type = StringUtils.trimToEmpty(params.get("type"));
		
		int npage = NumberUtils.toInt(params.get("npage"), 1);
		int per_page = NumberUtils.toInt(params.get("per_page"), 20);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mem_id);
			
			ResultSetHandler rsh = new BeanListHandler(CouponDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("now".equals(type)){
				where = " and expiredate_end >= date_format(now(),'%Y-%m-%d') " ;
			}
			else{
				where = " and expiredate_end < date_format(now(),'%Y-%m-%d') " ;
				
				/*if(startDt.length()>0 && endDt.length() > 0){
					where += " and expiredate_end between ? and ? " ;
					bind.add(startDt);
					bind.add(endDt);
				}*/
				if("code".equals(field) && keyword.length()>0){
					where += "and a.coupon_code = ? " ;
					bind.add(keyword);
				}
				else if("price".equals(field) && keyword.length()>0){
					where += "and a.sale_price = ? " ;
					bind.add(keyword);
				}
				else if("end_dt".equals(field) && keyword.length()>0){
					where += "and a.expiredate_end = ? " ;
					bind.add(keyword);
				}
				else if("use_dt".equals(field) && keyword.length()>0){
					where += "and date_format(use_date,'%Y-%m-%d') = ? " ;
					bind.add(keyword);
				}
			}
			
			//페이징
			bind.add(((npage-1)* per_page));
			bind.add(per_page);
			
			list = (List<CouponDto>) qr.query(conn , MessageFormat.format(MYPAGE.my_coupon, where), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	public int getMyCouponTotal(Map<String,String> params){
		
		Connection conn = null;
		Map<String, Long> map = null;
		
		String startDt = StringUtils.trimToEmpty(params.get("startDt"));
		String endDt = StringUtils.trimToEmpty(params.get("endDt"));
		String mem_id = StringUtils.trimToEmpty(params.get("mem_id"));
		String type = StringUtils.trimToEmpty(params.get("type"));
		String field = StringUtils.defaultIfEmpty(params.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(params.get("keyword"), "");
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mem_id);
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("now".equals(type)){
				where = " and expiredate_end >= date_format(now(),'%Y-%m-%d') " ;
			}
			else{
				where = " and expiredate_end < date_format(now(),'%Y-%m-%d') " ;
				
				/*if(startDt.length()>0 && endDt.length() > 0){
					where += " and expiredate_end between ? and ? " ;
					bind.add(startDt);
					bind.add(endDt);
				}*/
				if("code".equals(field) && keyword.length()>0){
					where += "and a.coupon_code = ? " ;
					bind.add(keyword);
				}
				else if("price".equals(field) && keyword.length()>0){
					where += "and a.sale_price = ? " ;
					bind.add(keyword);
				}
				else if("end_dt".equals(field) && keyword.length()>0){
					where += "and a.expiredate_end = ? " ;
					bind.add(keyword);
				}
				else if("use_dt".equals(field) && keyword.length()>0){
					where += "and date_format(use_date,'%Y-%m-%d') = ? " ;
					bind.add(keyword);
				}
			}
			
			map = (Map<String, Long>)qr.query(conn , MessageFormat.format(MYPAGE.my_coupon_total, where), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return NumberUtils.toInt(map.get("cnt")+"");
	}
	
	public String getGolflinkName(int menu_seq , int reserve_seq){
		
		String name = "";
		Connection conn = null;
		try {
				
			Object[] params = {menu_seq , reserve_seq};
			
			conn = DBManager.getConnection();
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			Map<String, String> map = (Map<String, String>)qr.query(conn, MYPAGE.golflink_name , rsh , params);
			
			if(map != null)
				name = map.get("golflink_name");
			else
				name = "";
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return name;
	}
	
	public void setStatusUpdate(String tableName, Map<String,String> data){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();

			String reserve_seq = StringUtils.defaultIfEmpty(data.get("reserve_seq"), "");
			String process_status = StringUtils.defaultIfEmpty(data.get("process_status"), "");
			String card_bill_num = StringUtils.defaultIfEmpty(data.get("card_bill_num"), "");
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(process_status);
			bind.add(card_bill_num);
			bind.add(reserve_seq);
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, MessageFormat.format(MYPAGE.status_update, tableName), bind.toArray());
			
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}
	}
	
	//================================ NH Card =======================
	public List<GolfLinkReserveDto> getNHReserveList(Map<String,String> params){
		
		List<GolfLinkReserveDto> list = null;
		Connection conn = null;
		
		String startDt = StringUtils.trimToEmpty(params.get("startDt"));
		String endDt = StringUtils.trimToEmpty(params.get("endDt"));
		String reserve_name = StringUtils.trimToEmpty(params.get("reserve_name"));
		String reserve_phone = StringUtils.trimToEmpty(params.get("reserve_phone"));
		
		
		int npage = NumberUtils.toInt(params.get("npage"), 1);
		int per_page = NumberUtils.toInt(params.get("per_page"), BBS.per_page);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(reserve_name);
			bind.add(reserve_phone);
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkReserveDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if(startDt.length()>0 && endDt.length() > 0){
				where = " and date_format(reserve_day,'%Y-%m-%d') between ? and ? " ;
				bind.add(startDt);
				bind.add(endDt);
			}
			
			list = (List<GolfLinkReserveDto>) qr.query(conn , MessageFormat.format(MYPAGE.my_nh_reserve, where), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	public int getNHReserveTotal(Map<String,String> params){
		
		Map<String, Long> map = null;
		Connection conn = null;
		
		String startDt = StringUtils.trimToEmpty(params.get("startDt"));
		String endDt = StringUtils.trimToEmpty(params.get("endDt"));
		String reserve_name = StringUtils.trimToEmpty(params.get("reserve_name"));
		String reserve_phone = StringUtils.trimToEmpty(params.get("reserve_phone"));
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(reserve_name);
			bind.add(reserve_phone);
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if(startDt.length()>0 && endDt.length() > 0){
				where = " and date_format(reserve_day,'%Y-%m-%d') between ? and ? " ;
				bind.add(startDt);
				bind.add(endDt);
			}
			
			map = (Map<String, Long>)qr.query(conn , MessageFormat.format(MYPAGE.my_nh_reserve_total, where), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return NumberUtils.toInt(map.get("cnt")+"");
	}
}
