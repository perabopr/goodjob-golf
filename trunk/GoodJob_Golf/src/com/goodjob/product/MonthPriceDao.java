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
import com.goodjob.product.dto.MonthPriceDto;
import com.goodjob.sql.PRODUCT;

public class MonthPriceDao {
	
	/**
	 * 메뉴골프장월별 가격 가져오기
	 * @param mpDto
	 * @return
	 */
	public List<MonthPriceDto> getMonthPrice(MonthPriceDto mpDto){
		Connection conn = null;
		List<MonthPriceDto> list = null;
		
		try{
			conn = DBManager.getConnection();	
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mpDto.getMenu_seq());
			bind.add(mpDto.getService_seq());
			bind.add(mpDto.getYearmonth());
			
			ResultSetHandler rsh = new BeanListHandler(MonthPriceDto.class);
				
			QueryRunner qr = new QueryRunner();
			list = (List<MonthPriceDto>)qr.query(conn, PRODUCT.month_price_select, rsh, bind.toArray());		
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return list;	
	}

	/**
	 * 메뉴골프장월별 가격 추가
	 * @param mpDto
	 */
	public void setMonthPriceInsert(MonthPriceDto mpDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mpDto.getMenu_seq());
			bind.add(mpDto.getService_seq());
			bind.add(mpDto.getYearmonth());
			bind.add(mpDto.getSite_seq());
			bind.add(mpDto.getPrice1());
			bind.add(mpDto.getPrice2());
			bind.add(mpDto.getPrice3());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.month_price_insert, bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}	
	}

	/**
	 * 메뉴골프장월별 가격 수정
	 * @param mpDto
	 */
	public void setMonthPriceUpdate(MonthPriceDto mpDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mpDto.getPrice1());
			bind.add(mpDto.getPrice2());
			bind.add(mpDto.getPrice3());
			bind.add(mpDto.getMenu_seq());
			bind.add(mpDto.getService_seq());
			bind.add(mpDto.getYearmonth());
			bind.add(mpDto.getSite_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.month_price_update, bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}	
	}
	
	/**
	 * 메뉴골프장월별 가격 삭제
	 * @param mpDto
	 */
	public void setMonthPriceDelete(MonthPriceDto mpDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mpDto.getMenu_seq());
			bind.add(mpDto.getService_seq());
			bind.add(mpDto.getYearmonth());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.month_price_delete, bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}	
	}
}
