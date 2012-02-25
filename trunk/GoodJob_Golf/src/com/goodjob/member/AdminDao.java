/**
 * 
 */
package com.goodjob.member;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.goodjob.db.DBManager;
import com.goodjob.sql.ADMIN;

/**
 * @author Administrator
 *
 */
public class AdminDao {

	public void setInsert(AdminDto dto){
		
		Connection conn = null;
		try {
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(dto.getAdmin_id());
			bind.add(dto.getAdmin_pwd());
			bind.add(dto.getAdmin_name());
			bind.add(dto.getType());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn , ADMIN.insert , bind.toArray());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public void setUpdate(AdminDto dto){
		Connection conn = null;
		try {
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(dto.getAdmin_pwd());
			bind.add(dto.getAdmin_name());
			bind.add(dto.getAdmin_id());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn , ADMIN.update , bind.toArray());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public void setDelete(String  admin_id){
		
		Connection conn = null;
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(admin_id);
			QueryRunner qr = new QueryRunner();
			qr.update(conn , ADMIN.delete , bind.toArray());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public List<AdminDto> getAdminList(){
	
		Connection conn = null;
		List<AdminDto> list = null;
		try {
			
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new BeanListHandler(AdminDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<AdminDto>) qr.query(conn , ADMIN.list , rsh);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return list;
	}
	
	public AdminDto login(String admin_id){
		
		Connection conn = null;
		AdminDto dto = null;
		String pw = null;
		
		try {
			
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(admin_id);
			
			ResultSetHandler rsh = new BeanHandler(AdminDto.class);
			QueryRunner qr = new QueryRunner();
			dto = (AdminDto) qr.query(conn , ADMIN.login , rsh , bind.toArray() );
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return dto;
	}
}
