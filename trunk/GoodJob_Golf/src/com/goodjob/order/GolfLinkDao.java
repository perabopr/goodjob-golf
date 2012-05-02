package com.goodjob.order;

import java.sql.Connection;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import com.goodjob.coupon.CouponDao;
import com.goodjob.db.DBManager;
import com.goodjob.order.dto.GolfLinkDto;
import com.goodjob.sql.ORDER;
import com.goodjob.sql.PRODUCT;

public class GolfLinkDao {
	public List<GolfLinkDto> getList(String tableName , Map<String,String> data){
		List<GolfLinkDto> list = null;
		Connection conn = null;
		
		String field = StringUtils.defaultIfEmpty(data.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
		int npage = NumberUtils.toInt(data.get("npage"), 1);
		int per_page = NumberUtils.toInt(data.get("per_page"), ORDER.per_page);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			
			//요값은 무조건있어야지요~
			where = "WHERE menu_seq = ? " ;
			params.add(data.get("menu_seq"));
			
			if("golflink_name".equals(field) && keyword.length()>0){
				where += "AND golflink_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_day".equals(field) && keyword.length()>0){
				String[] keywords = keyword.split("~");
				if(keywords.length == 2)
				{
					if(keywords[0].trim().length() > 0)
					{
						where += "AND booking_day >= ? " ;
						params.add(keywords[0].trim().replace("-", ""));						
					}
					if(keywords[1].trim().length() > 0)
					{
						where += "AND booking_day <= ? " ;
						params.add(keywords[1].trim().replace("-", ""));	
					}
				}
				else
				{
					if(keyword.startsWith("~"))
					{
						where += "AND booking_day <= ? " ;
						params.add(keyword.substring(1).trim().replace("-", ""));
					}
					else if(keyword.endsWith("~"))
					{
						where += "AND booking_day >= ? " ;
						params.add(keyword.substring(0,keyword.length()-1).trim().replace("-", ""));
					}
					else
					{
						where += "AND booking_day = ? " ;
						params.add(keyword.trim().replace("-", ""));
					}
				}
			}else if("reserve_name".equals(field) && keyword.length()>0){
				where += "AND reserve_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_uid".equals(field) && keyword.length()>0){
				where += "AND reserve_uid LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("product_price".equals(field) && keyword.length()>0){
				where += "AND product_price LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("process_status".equals(field) && keyword.length()>0){
				where += "AND process_status = ? " ;
				params.add(keyword);
			}else if("reserve_seq".equals(field) && keyword.length()>0){
				where += "AND reserve_seq = ? " ;
				params.add(keyword);
			}else if("recommend".equals(field) && keyword.length()>0){
				where = ",tb_member where menu_seq = ? and reserve_uid=mem_id and recommend=? " ;
				params.add(keyword);
			}
			
			
			
			//페이징
			params.add(((npage-1)* per_page));
			params.add(per_page);
			
			list = (List<GolfLinkDto>)qr.query(conn , MessageFormat.format(ORDER.listRealPre, tableName, where), rsh , params.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public List<GolfLinkDto> getGolfLinkReserve(int seq){
		List<GolfLinkDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			params.add(seq);
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<GolfLinkDto>)qr.query(conn , ORDER.RealPre, rsh , params.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	public int getTotalCount(String tableName , Map<String,String> data) {
		Connection conn = null;
		Map<String, Long> map = null;
		try {
			
			String field = StringUtils.defaultIfEmpty(data.get("field"), "");
			String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
			int npage = NumberUtils.toInt(data.get("npage"), 1);
			
			ArrayList<Object> params = new ArrayList<Object>();
			
			conn = DBManager.getConnection();

			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			
			//요값은 무조건있어야지요~
			where = "WHERE menu_seq = ? " ;
			params.add(data.get("menu_seq"));
			
			if("golflink_name".equals(field) && keyword.length()>0){
				where += "AND golflink_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_day".equals(field) && keyword.length()>0){
				where += "AND reserve_day LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_uid".equals(field) && keyword.length()>0){
				where += "AND reserve_uid LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_name".equals(field) && keyword.length()>0){
				where += "AND reserve_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("product_price".equals(field) && keyword.length()>0){
				where += "AND product_price LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("process_status".equals(field) && keyword.length()>0){
				where += "AND process_status LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("recommend".equals(field) && keyword.length()>0){
				where = ",tb_member where menu_seq = ? and reserve_uid=mem_id and recommend=? " ;
				params.add(keyword);
			}
			
			map = (Map<String, Long>)qr.query(conn, MessageFormat.format(ORDER.totalcnt, tableName , where) , rsh , params.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("cnt")+"");
	}
	
	public void setStatusUpdate(String tableName, Map<String,String> data){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();

			String reserve_seq = StringUtils.defaultIfEmpty(data.get("reserve_seq"), "");
			String booking_day = StringUtils.defaultIfEmpty(data.get("booking_day"), "");
			String booking_time = StringUtils.defaultIfEmpty(data.get("booking_time"), "");
			String booking_time_s = StringUtils.defaultIfEmpty(data.get("booking_time_s"), "");
			String booking_time_e = StringUtils.defaultIfEmpty(data.get("booking_time_e"), "");
			String per_num = StringUtils.defaultIfEmpty(data.get("per_num"), "");
			String product_price = StringUtils.defaultIfEmpty(data.get("product_price"), "");
			String balance_price = StringUtils.defaultIfEmpty(data.get("balance_price"), "");
			String process_status = StringUtils.defaultIfEmpty(data.get("process_status"), "");
			String package_price = StringUtils.defaultIfEmpty(data.get("package_price"), "");
			String condo_price = StringUtils.defaultIfEmpty(data.get("condo_price"), "");
			String tour_date = StringUtils.defaultIfEmpty(data.get("tour_date"), "");
			
			ArrayList<Object> bind = new ArrayList<Object>();
						
			String setQuery = "";
			if(booking_day.length() > 0){
				setQuery += ",booking_day = ? " ;
				bind.add(booking_day);
			}
			if(booking_time.length() > 0){
				setQuery += ",booking_time = ? " ;
				bind.add(booking_time);
			}
			if(booking_time_s.length() > 0){
				setQuery += ",booking_time_s = ? " ;
				bind.add(booking_time_s);				
			}
			if(booking_time_e.length() > 0){
				setQuery += ",booking_time_e = ? " ;
				bind.add(booking_time_e);				
			}
			if(product_price.length() > 0){
				setQuery += ",product_price = ? " ;
				bind.add(product_price);
			}
			if(balance_price.length() > 0){
				setQuery += ",balance_price = ? " ;
				bind.add(balance_price);
			}
			if(per_num.length() > 0){
				setQuery += ",per_num = ? " ;
				bind.add(per_num);
			}
			if(process_status.length() > 0){
				setQuery += ",process_status = ? " ;
				bind.add(process_status);
			}
			if(package_price.length() > 0){
				setQuery += ",package_price = ? " ;
				bind.add(package_price);
			}
			if(condo_price.length() > 0){
				setQuery += ",condo_price = ? " ;
				bind.add(condo_price);
			}
			if(tour_date.length() > 0){
				setQuery += ",tour_date = ? " ;
				bind.add(tour_date);				
			}
			if(setQuery.length() > 0){
				setQuery = setQuery.substring(1);
			}
			
			bind.add(reserve_seq);
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, MessageFormat.format(ORDER.update, tableName, setQuery), bind.toArray());

			if(tableName.equals("tb_golflink_reserve"))
			{
				bind = new ArrayList<Object>();
				bind.add(reserve_seq);
				ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
				List<GolfLinkDto> liSeq = (List<GolfLinkDto>)qr.query(conn , ORDER.product_sub_seq_select, rsh , bind.toArray());
				
				if(liSeq.size() > 0){
					bind = new ArrayList<Object>();
					if(process_status.equals("3")){	//(예약)예약취소
						bind.add("0");	//(상품)예약가능
					}else if(process_status.equals("0")){//(예약)예약대기
						bind.add("1");	//(상품)예약중
					}else if(process_status.equals("1") || process_status.equals("2")){//(예약)예약완료
						bind.add("2");	//(상품)예약마감
					}
					bind.add(liSeq.get(0).getProductsub_seq());
					
					//쿠폰 복구. 사용했으면~
					CouponDao cpDao = new CouponDao();				
					cpDao.setCouponUseCancel(liSeq.get(0).getMenu_seq(), liSeq.get(0).getReserve_seq());
				}
				
				qr.update(conn, ORDER.product_sub_status_update, bind.toArray());
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}
	}
	
	public List<GolfLinkDto> getTotalReserveSearch(GolfLinkDto searchWord){
		
		List<GolfLinkDto> list = null;
		Connection conn = null;
		
		String reserve_day = searchWord.getReserve_day();
		String reserve_uid = searchWord.getReserve_uid();
		String reserve_name = searchWord.getReserve_name();
		String golflink_name = searchWord.getGolflink_name();
		String booking_day = searchWord.getBooking_day();
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where1 = "";
			String where2 = "";
			String where3 = "";
			String where4 = "";
			
			if(reserve_day.length() > 0){
				where1 = "WHERE date_format(reserve_day,'%Y-%m-%d') = ? " ;
				params.add(reserve_day);
				where2 = "WHERE date_format(reserve_day,'%Y-%m-%d') = ? " ;
				params.add(reserve_day);
				where3 = "WHERE date_format(reserve_day,'%Y-%m-%d') = ? " ;
				params.add(reserve_day); 
			}else if(reserve_uid.length() > 0){
				where1 = "WHERE reserve_uid LIKE concat('%',?,'%') " ;
				params.add(reserve_name);
				where2 = "WHERE reserve_uid LIKE concat('%',?,'%') " ;
				params.add(reserve_name);
				where3 = "WHERE reserve_uid LIKE concat('%',?,'%') " ;
				params.add(reserve_name); 
			}else if(reserve_name.length() > 0){
				where1 = "WHERE reserve_name LIKE concat('%',?,'%') " ;
				params.add(reserve_name);
				where2 = "WHERE reserve_name LIKE concat('%',?,'%') " ;
				params.add(reserve_name);
				where3 = "WHERE reserve_name LIKE concat('%',?,'%') " ;
				params.add(reserve_name); 
			}else if(golflink_name.length() > 0){
				where1 = "WHERE golflink_name LIKE concat('%',?,'%') " ;
				params.add(golflink_name);
				where2 = "WHERE (package_name1 LIKE concat('%',?,'%') OR package_name2 LIKE concat('%',?,'%'))" ;
				params.add(golflink_name);
				params.add(golflink_name);
				where3 = "WHERE condo_name = ? " ;
				params.add(golflink_name); 				
			}else if(booking_day.length() > 0){
				where1 = "WHERE booking_day = ? " ;
				params.add(booking_day);
				where2 = "WHERE tour_date = ? " ;
				params.add(booking_day);
				where3 = "WHERE in_date = ? " ;
				params.add(booking_day); 
			}
			else{
				where4 = " limit 0 , 30 ";
			}
			
			list = (List<GolfLinkDto>)qr.query(conn , MessageFormat.format(ORDER.reserveTotalSearch_select, where1, where2, where3 , where4), rsh , params.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
}
