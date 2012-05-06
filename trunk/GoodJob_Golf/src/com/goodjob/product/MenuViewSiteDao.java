package com.goodjob.product;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.goodjob.db.DBManager;
import com.goodjob.product.dto.MenuViewSiteDto;
import com.goodjob.sql.PRODUCT;

public class MenuViewSiteDao {
	public List<MenuViewSiteDto> getMenuViewSiteListNHException(MenuViewSiteDto mvsDto){
		List<MenuViewSiteDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mvsDto.getMenu_seq());
			bind.add(mvsDto.getService_seq());
			ResultSetHandler rsh = new BeanListHandler(MenuViewSiteDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<MenuViewSiteDto>)qr.query(conn, PRODUCT.menu_view_site_select_NHException, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;		
	}
	
	public List<MenuViewSiteDto> getMenuViewSiteList(MenuViewSiteDto mvsDto){
		List<MenuViewSiteDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mvsDto.getMenu_seq());
			bind.add(mvsDto.getService_seq());
			ResultSetHandler rsh = new BeanListHandler(MenuViewSiteDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<MenuViewSiteDto>)qr.query(conn, PRODUCT.menu_view_site_select, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;		
	}
	
	public void setMenuViewSiteInsert(MenuViewSiteDto mvsDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mvsDto.getMenu_seq());
			bind.add(mvsDto.getService_seq());
			bind.add(mvsDto.getSite_seq());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.menu_view_site_insert, bind.toArray());
		}
		catch (Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}		
		
	}
	
	public void setMenuViewSiteDelete(MenuViewSiteDto mvsDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mvsDto.getMenu_seq());
			bind.add(mvsDto.getService_seq());
			bind.add(mvsDto.getSite_seq());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.menu_view_site_delete, bind.toArray());
		}
		catch (Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}		
		
	}
	
}
