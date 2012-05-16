package com.goodjob.product;

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

import com.goodjob.db.DBManager;
import com.goodjob.product.dto.SiteDto;
import com.goodjob.sql.PRODUCT;

public class SiteDao {
	/**
	 * 상호 전체 리스트 가져오기.
	 * @return
	 */
	public List<SiteDto> getSiteAllList(){
		List<SiteDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			ResultSetHandler rsh = new BeanListHandler(SiteDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<SiteDto>)qr.query(conn, PRODUCT.site_all_select, rsh , bind.toArray());
					
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	/**
	 * 상호 리스트 가져오기.
	 * @return
	 */
	public List<SiteDto> getSiteList(){
		List<SiteDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			ResultSetHandler rsh = new BeanListHandler(SiteDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<SiteDto>)qr.query(conn, PRODUCT.site_select, rsh , bind.toArray());
					
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	/**
	 * 상호 추가.
	 * @param sDto
	 */
	public void setSiteInsert(SiteDto sDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(sDto.getSite_name());
			bind.add(sDto.getPhone_num());
			bind.add(sDto.getBank_num());
			bind.add(sDto.getUse_yn());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.site_insert, bind.toArray());
		}
		catch (Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}		
	}
	
	/**
	 * 상호 수정.
	 * @param sDto
	 */
	public void setSiteUpdate(SiteDto sDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(sDto.getSite_name());
			bind.add(sDto.getPhone_num());
			bind.add(sDto.getBank_num());
			bind.add(sDto.getUse_yn());
			bind.add(sDto.getSite_seq());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.site_update, bind.toArray());
		}
		catch (Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}		
	}
}
