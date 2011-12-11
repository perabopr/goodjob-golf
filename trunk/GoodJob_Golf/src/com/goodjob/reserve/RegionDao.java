package com.goodjob.reserve;

import java.sql.Connection;
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

import com.goodjob.reserve.dto.RegionDto;
import com.goodjob.db.DBManager;
import com.goodjob.sql.PRODUCT;

public class RegionDao {
	
	/**
	 * 지역 - 전체가져오기.
	 * @return
	 */
	public List<RegionDto> getRegionList(String rType){
		
		List<RegionDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(rType);
			ResultSetHandler rsh = new BeanListHandler(RegionDto.class);
			QueryRunner qr = new QueryRunner();
						
			list = (List<RegionDto>) qr.query(conn , PRODUCT.region_select, rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	/**
	 * 지역 - 입력하기.
	 * @param rgDto
	 */
	public void setRegionInsert(RegionDto rgDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(rgDto.getRegion_name());
			bind.add(rgDto.getRegion_type());
			bind.add(rgDto.getRegion_etc());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.region_insert, bind.toArray());
		}
		catch (Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 지역 - 삭제하기.
	 * @param seq
	 */
	public void setRegionDelete(int seq){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.region_insert, seq);
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}
	}
}
