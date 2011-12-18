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
import com.goodjob.reserve.dto.GolfLinkDto;
import com.goodjob.reserve.dto.GolfLinkPriceDto;
import com.goodjob.reserve.dto.GolfLinkPromiseDto;
import com.goodjob.reserve.dto.ProductDto;
import com.goodjob.reserve.dto.ProductReserveDto;
import com.goodjob.sql.RESERVE;

public class GolfLinkDao {
	public List<GolfLinkDto> getGolfLinkList(String strWhere){
		List<GolfLinkDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<GolfLinkDto>) qr.query(conn , String.format(RESERVE.getReserveGolf, strWhere), rsh);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;		
	}
	
	public List<ProductDto> getGolfProductList(ProductDto pDto){
		List<ProductDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(pDto.getGolflink_seq());
			bind.add(pDto.getProduct_startDate());
			bind.add(pDto.getProduct_endDate());
			ResultSetHandler rsh = new BeanListHandler(ProductDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<ProductDto>) qr.query(conn , RESERVE.getReserveGolfDate, rsh , bind.toArray());
					
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public List<GolfLinkDto> getGolfLinkDetail(int idSeq){
		List<GolfLinkDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<GolfLinkDto>) qr.query(conn , RESERVE.getDetailGolf, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;		
	}
	
	public List<GolfLinkPriceDto> getGolfLinkPrice(int idSeq){
		List<GolfLinkPriceDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			ResultSetHandler rsh = new BeanListHandler(GolfLinkPriceDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<GolfLinkPriceDto>) qr.query(conn , RESERVE.getDetailGolfPrice, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;		
	}
	
	public List<ProductReserveDto> getGolfProduct(ProductReserveDto prDto){
		List<ProductReserveDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(prDto.getGolflink_seq());
			bind.add(prDto.getProduct_date());
			ResultSetHandler rsh = new BeanListHandler(ProductReserveDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<ProductReserveDto>) qr.query(conn , RESERVE.getProductReserve, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public List<GolfLinkPromiseDto> getGolfPromise(int productsubSeq){
		List<GolfLinkPromiseDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(productsubSeq);
			ResultSetHandler rsh = new BeanListHandler(GolfLinkPromiseDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<GolfLinkPromiseDto>) qr.query(conn , RESERVE.getGolfPromise, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
}
