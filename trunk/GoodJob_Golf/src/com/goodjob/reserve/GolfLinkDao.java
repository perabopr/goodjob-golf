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
import com.goodjob.sql.RESERVE;
import com.goodjob.reserve.dto.GolfLinkCourseDto;
import com.goodjob.reserve.dto.GolfLinkDto;
import com.goodjob.reserve.dto.GolfLinkPriceDto;
import com.goodjob.reserve.dto.GolfLinkPromiseDto;

public class GolfLinkDao {	
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
	public List<GolfLinkDto> getGolfLink(int gl_seq){
		List<GolfLinkDto> list = null;
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(gl_seq);
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkDto.class);
			QueryRunner qr = new QueryRunner();			
			
			list = (List<GolfLinkDto>)qr.query(conn, RESERVE.golflink_select, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	/**
	 * 골프장 - 추가
	 * @param gldto
	 */
	public int setGolfLinkInsert(GolfLinkDto gldto){
		Connection conn = null;
		int idSeq = 0;
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
			
			//생성키 반환.
			Statement stmt = conn.createStatement();
			ResultSet rst = stmt.executeQuery(RESERVE.getSequenceId);
			if(rst.next()){
				idSeq = rst.getInt(1);
			}
		}
		catch (Exception e){
			System.out.println(e);
		}
		finally{
			DbUtils.closeQuietly(conn);
		}
		
		return idSeq;
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
			bind.add(gldto.getGolflink_seq());
			
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
	 * 골프장가격 - 가져오기.
	 * @param glSeq
	 * @return
	 */
	public List<GolfLinkPriceDto> getGolfLinkPriceSelect(int glSeq){
		List<GolfLinkPriceDto> list = null;
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glSeq);
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkPriceDto.class);
			
			QueryRunner qr = new QueryRunner();
			
			list = (List<GolfLinkPriceDto>)qr.query(conn, RESERVE.golflink_price_select, rsh, bind.toArray());	
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
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
			bind.add(glpdto.getGolflink_seq());
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
	
	/**
	 * 골프장가격 - 삭제
	 * @param glSeq
	 */
	public void setGolfLinkPriceDelete(int glSeq){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.golflink_price_delete, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}	
	}
	
	/**
	 * 골프장코스 - 가져오기.
	 * @param glSeq
	 * @return
	 */
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
	
	/**
	 * 골프장코스 - 추가
	 * @param glc
	 */
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
	
	/**
	 * 골프장코스 - 삭제
	 * @param glcSeq
	 */
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
	
	/**
	 * 골프장위약 - 가져오기.
	 * @param glSeq
	 * @return
	 */
	public List<GolfLinkPromiseDto> getGolfLinkPromiseSelect(int glSeq){
		List<GolfLinkPromiseDto> list = null;
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glSeq);
			
			ResultSetHandler rsh = new BeanListHandler(GolfLinkPromiseDto.class);
			
			QueryRunner qr = new QueryRunner();
			
			list = (List<GolfLinkPromiseDto>)qr.query(conn, RESERVE.golflink_promise_select, rsh, bind.toArray());	
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	/**
	 * 골프장위약 - 추가
	 * @param glpDto
	 */
	public void setGolfLinkPromiseInsert(GolfLinkPromiseDto glpDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glpDto.getGolflink_seq());
			bind.add(glpDto.getPromise1_type());
			bind.add(glpDto.getPromise1());
			bind.add(glpDto.getPromise2_type());
			bind.add(glpDto.getPromise2());
			bind.add(glpDto.getPromise3_type());
			bind.add(glpDto.getPromise3());
			bind.add(glpDto.getPromise4_type());
			bind.add(glpDto.getPromise4());
			bind.add(glpDto.getPromise5_type());
			bind.add(glpDto.getPromise5());
			bind.add(glpDto.getCancelrule());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.golflink_promise_insert, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 골프장위약 - 수정
	 * @param glpDto
	 */
	public void setGolfLinkPromiseUpdate(GolfLinkPromiseDto glpDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glpDto.getPromise1_type());
			bind.add(glpDto.getPromise1());
			bind.add(glpDto.getPromise2_type());
			bind.add(glpDto.getPromise2());
			bind.add(glpDto.getPromise3_type());
			bind.add(glpDto.getPromise3());
			bind.add(glpDto.getPromise4_type());
			bind.add(glpDto.getPromise4());
			bind.add(glpDto.getPromise5_type());
			bind.add(glpDto.getPromise5());
			bind.add(glpDto.getGolflink_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.golflink_promise_update, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 골프장위약 - 삭제
	 * @param idSeq
	 */
	public void setGolfLinkPromiseDelete(int idSeq){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.golflink_promise_delete, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
}
