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

import com.goodjob.reserve.dto.MenuDto;
import com.goodjob.db.DBManager;
import com.goodjob.sql.RESERVE;

public class MenuDao {
	/**
	 * 메뉴 - 전체가져오기.
	 * @return
	 */
	public List<MenuDto> getRegionList(){
		
		List<MenuDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			ResultSetHandler rsh = new BeanListHandler(MenuDto.class);
			QueryRunner qr = new QueryRunner();
						
			list = (List<MenuDto>) qr.query(conn , RESERVE.menu_select, rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	/**
	 * 메뉴 - 입력하기.
	 * @param rgDto
	 */
	public void setRegionInsert(MenuDto mDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mDto.getMenu_name());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, RESERVE.menu_insert, bind.toArray());
		}
		catch (Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 메뉴 - 삭제하기.
	 * @param seq
	 */
	public void setMenuDelete(int seq){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, RESERVE.menu_insert, seq);
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}
	}
}
