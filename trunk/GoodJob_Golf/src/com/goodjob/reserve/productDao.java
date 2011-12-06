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

import com.goodjob.db.DBManager;

import com.goodjob.reserve.dto.ProductDto;
import com.goodjob.reserve.dto.ProductSubDto;
import com.goodjob.sql.RESERVE;

public class productDao {
	public void setProductInsert(ProductDto prdtDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(prdtDto.getMenu_seq());
			bind.add(prdtDto.getGolflink_seq());
			bind.add(prdtDto.getProduct_year());
			bind.add(prdtDto.getProduct_month());
			bind.add(prdtDto.getProduct_day());
			bind.add(prdtDto.getView_yn());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.product_insert, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public void setProductUpdate(ProductDto prdtDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(prdtDto.getProduct_year());
			bind.add(prdtDto.getProduct_month());
			bind.add(prdtDto.getProduct_day());
			bind.add(prdtDto.getView_yn());
			bind.add(prdtDto.getProduct_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.product_update, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public void setProductDelete(int prdt_seq){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(prdt_seq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.product_delete, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public List<ProductSubDto> getProductSubSelect(ProductDto prdtDto){
		List<ProductSubDto> list = null;
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(prdtDto.getProduct_year());
			bind.add(prdtDto.getProduct_month());
			bind.add(prdtDto.getProduct_day());
			
			ResultSetHandler rsh = new BeanListHandler(ProductSubDto.class);
			
			QueryRunner qr = new QueryRunner();
			
			list = (List<ProductSubDto>)qr.query(conn, RESERVE.product_sub_select_date, rsh, bind.toArray());	
					
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
}
