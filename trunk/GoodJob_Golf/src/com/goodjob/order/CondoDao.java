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

import com.goodjob.db.DBManager;

import com.goodjob.order.dto.CondoDto;
import com.goodjob.sql.ORDER;

public class CondoDao {
	public List<CondoDto> getList(String tableName , Map<String,String> data){
		List<CondoDto> list = null;
		Connection conn = null;
		
		String field = StringUtils.defaultIfEmpty(data.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
		int npage = NumberUtils.toInt(data.get("npage"), 1);
		int per_page = NumberUtils.toInt(data.get("per_page"), ORDER.per_page);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			
			ResultSetHandler rsh = new BeanListHandler(CondoDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			
			//요값은 무조건있어야지요~
			where = "WHERE menu_seq = ? " ;
			params.add(data.get("menu_seq"));
			
			if("condo_name".equals(field) && keyword.length()>0){
				where += "AND condo_name LIKE concat('%',?,'%') ";
				params.add(keyword);
			}else if("in_date".equals(field) && keyword.length()>0){
				where += "AND in_date LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_name".equals(field) && keyword.length()>0){
				where += "AND reserve_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("condo_price".equals(field) && keyword.length()>0){
				where += "AND condo_price LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("process_status".equals(field) && keyword.length()>0){
				where += "AND process_status LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			//페이징
			params.add(((npage-1)* per_page));
			params.add(per_page);
			
			list = (List<CondoDto>)qr.query(conn , MessageFormat.format(ORDER.listCondo, tableName, where), rsh , params.toArray());
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
			
			if("condo_name".equals(field) && keyword.length()>0){
				where += "AND condo_name LIKE concat('%',?,'%') ";
				params.add(keyword);
			}else if("in_date".equals(field) && keyword.length()>0){
				where += "AND in_date LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("reserve_name".equals(field) && keyword.length()>0){
				where += "AND reserve_name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("condo_price".equals(field) && keyword.length()>0){
				where += "AND condo_price LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}else if("process_status".equals(field) && keyword.length()>0){
				where += "AND process_status LIKE concat('%',?,'%') " ;
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
}
