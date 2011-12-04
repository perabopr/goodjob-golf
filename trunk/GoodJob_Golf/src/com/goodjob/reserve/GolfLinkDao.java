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
import com.goodjob.reserve.dto.GolfLinkCourseDto;
import com.goodjob.reserve.dto.GolfLinkDto;
import com.goodjob.reserve.dto.GolfLinkPriceDto;
import com.goodjob.sql.RESERVE;

public class GolfLinkDao {
	/**
	 * 골프장 - 추가
	 * @param gldto
	 */
	public void setGolfLinkInsert(GolfLinkDto gldto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(gldto.getMenu_seq());
			bind.add(gldto.getGolflink_name());
			bind.add(gldto.getRegion_seq());
			bind.add(gldto.getHoll_type());
			bind.add(gldto.getCourse_guide());
			bind.add(gldto.getGolflink_address1());
			bind.add(gldto.getGolflink_address2());
			bind.add(gldto.getPoint_x());
			bind.add(gldto.getPoint_y());
			bind.add(gldto.getImg_main());
			bind.add(gldto.getImg_sub1());
			bind.add(gldto.getImg_sub2());
			bind.add(gldto.getImg_sub3());
			bind.add(gldto.getImg_sub4());
			bind.add(gldto.getCancel_term());
			bind.add(gldto.getView_yn());
			bind.add(gldto.getCancel_rule());
			bind.add(gldto.getPromise_rule());
			bind.add(gldto.getUse_guide());
			bind.add(gldto.getGolflink_guide());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, RESERVE.golflink_insert, bind.toArray());
		}
		catch (Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 골프장 - 메뉴별_전체가져오기.
	 * @return
	 */
	public List<GolfLinkDto> getGolfLinkList(int menu_seq){
		List<GolfLinkDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(menu_seq);
			ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
			QueryRunner qr = new QueryRunner();
						
			list = (List<GolfLinkDto>) qr.query(conn , RESERVE.golflink_select_full, rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}	
	
	/**
	 * 골프장 - 가져오기.
	 * @param gl_seq
	 * @return
	 */
	public GolfLinkDto getGolfLink(int gl_seq){
		GolfLinkDto gldto = null;
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(gl_seq);
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
			QueryRunner qr = new QueryRunner();			
			
			gldto = (GolfLinkDto)qr.query(conn, RESERVE.golflink_select, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return gldto;
	}
	
	/**
	 * 골프장 - 수정
	 * @param gldto
	 */
	public void setGolfLinkUpdate(GolfLinkDto gldto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(gldto.getMenu_seq());
			bind.add(gldto.getGolflink_name());
			bind.add(gldto.getRegion_seq());
			bind.add(gldto.getHoll_type());
			bind.add(gldto.getCourse_guide());
			bind.add(gldto.getGolflink_address1());
			bind.add(gldto.getGolflink_address2());
			bind.add(gldto.getPoint_x());
			bind.add(gldto.getPoint_y());
			bind.add(gldto.getImg_main());
			bind.add(gldto.getImg_sub1());
			bind.add(gldto.getImg_sub2());
			bind.add(gldto.getImg_sub3());
			bind.add(gldto.getImg_sub4());
			bind.add(gldto.getCancel_term());
			bind.add(gldto.getView_yn());
			bind.add(gldto.getCancel_rule());
			bind.add(gldto.getPromise_rule());
			bind.add(gldto.getUse_guide());
			bind.add(gldto.getGolflink_guide());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.golflink_update, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}	
	
	/**
	 * 골프장 - 삭제
	 * @param gl_seq
	 */
	public void setGolfLinkDelete(int gl_seq){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(gl_seq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.golflink_delete, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
	
	/**
	 * 골프장 가격 - 추가
	 * @param glpdto
	 */
	public void setGolfLinkPriceInsert(GolfLinkPriceDto glpdto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glpdto.getPrice_type());
			bind.add(glpdto.getGolflink_price());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.golflink_price_insert, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}	
	}
	
	public List<GolfLinkCourseDto> getGolfLinkCourseSelect(int glSeq){
		List<GolfLinkCourseDto> list = null;
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glSeq);
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkCourseDto.class);
			
			QueryRunner qr = new QueryRunner();
			
			list = (List<GolfLinkCourseDto>)qr.query(conn, RESERVE.golflink_course_select, rsh, bind.toArray());			
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}	
	
	public void setGolfLinkCourseInsert(GolfLinkCourseDto glc){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glc.getGolflink_seq());
			bind.add(glc.getCourse_name());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.golflink_course_insert, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public void setGolfLinkCourseDelete(int glcSeq){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glcSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.golflink_course_delete, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
}
