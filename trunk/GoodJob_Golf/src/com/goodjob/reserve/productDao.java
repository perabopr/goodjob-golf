package com.goodjob.reserve;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
	public int getSequenceId(){
		Connection conn = null;
		int idSeq = 0;
		try{
			conn = DBManager.getConnection();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return idSeq;
	}
	public int setProductInsert(ProductDto prdtDto){
		Connection conn = null;
		int idSeq = 0;
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
			
			//추가
			qr.update(conn, RESERVE.product_insert, bind.toArray());
			
			//생성키 반환.
			Statement stmt = conn.createStatement();
			ResultSet rst = stmt.executeQuery(RESERVE.getSequenceId);
			if(rst.next()){
				idSeq = rst.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return idSeq;
	}

	public List<ProductDto> getProductSelect(ProductDto prdtDto){
		Connection conn = null;
		List<ProductDto> list = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(prdtDto.getMenu_seq());
			bind.add(prdtDto.getGolflink_seq());
			bind.add(prdtDto.getProduct_year());
			bind.add(prdtDto.getProduct_month());
			
			ResultSetHandler rsh = new BeanListHandler(ProductDto.class);
					
			QueryRunner qr = new QueryRunner();
			
			list = (List<ProductDto>)qr.query(conn, RESERVE.product_select_where, rsh, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	public void setProductUpdate(int prdtSeq, String viewYn){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(viewYn);
			bind.add(prdtSeq);
			
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
			bind.add(prdtDto.getMenu_seq());
			bind.add(prdtDto.getGolflink_seq());
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
	
	public void setProductSubDelete(ProductSubDto prdtsubDto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(prdtsubDto.getProduct_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, String.format(RESERVE.product_sub_delete, prdtsubDto.getProductsub_seqs()), bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}

	public void setProductSubInsert(ProductSubDto prdtsubDto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(prdtsubDto.getProduct_seq());
			bind.add(prdtsubDto.getGolflink_course_seq());
			bind.add(prdtsubDto.getTime_start());
			bind.add(prdtsubDto.getTime_end());
			bind.add(prdtsubDto.getGoodjob_price());
			bind.add(prdtsubDto.getNH_price());
			bind.add(prdtsubDto.getProduct_status());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.product_sub_insert, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	public void setProductSubUpdate(ProductSubDto prdtsubDto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(prdtsubDto.getGolflink_course_seq());
			bind.add(prdtsubDto.getTime_start());
			bind.add(prdtsubDto.getTime_end());
			bind.add(prdtsubDto.getGoodjob_price());
			bind.add(prdtsubDto.getNH_price());
			bind.add(prdtsubDto.getProduct_status());
			bind.add(prdtsubDto.getProductsub_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.product_sub_update, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
}
