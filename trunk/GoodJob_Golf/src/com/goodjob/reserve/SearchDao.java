package com.goodjob.reserve;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.goodjob.db.DBManager;
import com.goodjob.reserve.dto.SearchDto;
import com.goodjob.sql.RESERVE;

public class SearchDao {
	public List<SearchDto> getSearch(String region_seq, String menu_seq, String sDate, String eDate){
		List<SearchDto> list = null;
		Connection conn = null;
		
		try {
			String strQuery = "";
			if(region_seq.length() > 0 && region_seq != "0"){
				strQuery += "AND a.region_seq = '" + region_seq + "' ";
			}
			if(menu_seq.length() > 0){
				strQuery += "AND a.menu_seq = '" + menu_seq + "' ";
			}
			if(sDate.length() > 0){
				strQuery += "AND b.product_date >= '" + sDate + "' ";
			}
			if(eDate.length() > 0){
				strQuery += "AND b.product_date < '" + eDate + "' ";
			}
			conn = DBManager.getConnection();
			
			String strNowDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(strNowDate);
			
			ResultSetHandler rsh = new BeanListHandler(SearchDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<SearchDto>)qr.query(conn , String.format(RESERVE.getSearch, strQuery), rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
}
