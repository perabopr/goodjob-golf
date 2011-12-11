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
import com.goodjob.sql.PRODUCT;
import com.goodjob.reserve.dto.CondoDto;
import com.goodjob.reserve.dto.CondoGalleryDto;
import com.goodjob.reserve.dto.CondoRoomDto;

public class CondoDao {
	/**
	 * 콘도 - 가져오기.
	 * @param strWhere
	 * @return
	 */
	public List<CondoDto> getCondoSelect(String strWhere){
		List<CondoDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			QueryRunner qr = new QueryRunner();
			ResultSetHandler rsh = new BeanListHandler(CondoDto.class);
			
			list = (List<CondoDto>)qr.query(conn , String.format(PRODUCT.condo_select, strWhere), rsh , bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	/**
	 * 콘도 - 추가
	 * @param cDto
	 * @return
	 */
	public int setCondoInsert(CondoDto cDto){
		int idSeq = 0;
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cDto.getCondo_name());
			bind.add(cDto.getRegion_seq());
			bind.add(cDto.getSaledate_start());
			bind.add(cDto.getSaledate_end());
			bind.add(cDto.getImg_main());
			bind.add(cDto.getAddress1());
			bind.add(cDto.getAddress2());
			bind.add(cDto.getPoint_x());
			bind.add(cDto.getPoint_y());
			bind.add(cDto.getView_yn());
			bind.add(cDto.getReserve_start());
			bind.add(cDto.getReserve_end());
			bind.add(cDto.getCondo_info());
			bind.add(cDto.getDetail_info());
			bind.add(cDto.getWay_map());
			bind.add(cDto.getEdit_rule());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_insert, bind.toArray());
			
			//생성키 반환.
			Statement stmt = conn.createStatement();
			ResultSet rst = stmt.executeQuery(PRODUCT.getSequenceId);
			if(rst.next()){
				idSeq = rst.getInt(1);
			}
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}	
		return idSeq;
	}
	
	/**
	 * 콘도 - 수정.
	 * @param cDto
	 */
	public void setCondoUpdate(CondoDto cDto){
		Connection conn = null;
		try	{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cDto.getCondo_name());
			bind.add(cDto.getRegion_seq());
			bind.add(cDto.getSaledate_start());
			bind.add(cDto.getSaledate_end());
			bind.add(cDto.getImg_main());
			bind.add(cDto.getAddress1());
			bind.add(cDto.getAddress2());
			bind.add(cDto.getPoint_x());
			bind.add(cDto.getPoint_y());
			bind.add(cDto.getView_yn());
			bind.add(cDto.getReserve_start());
			bind.add(cDto.getReserve_end());
			bind.add(cDto.getCondo_info());
			bind.add(cDto.getDetail_info());
			bind.add(cDto.getWay_map());
			bind.add(cDto.getEdit_rule());
			bind.add(cDto.getCondo_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_update, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}	
	}
	
	/**
	 * 콘도 - 삭제.
	 * @param idSeq
	 */
	public void setCondoDelete(int idSeq){
		Connection conn = null;
		try	{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_delete, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}			
	}
	
	/**
	 * 콘도겔러리 - 가져오기.
	 * @param idSeq
	 * @return
	 */
	public List<CondoGalleryDto> getCondoGallerySelect(int idSeq){
		List<CondoGalleryDto> list = null;
		Connection conn = null;
		try {
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			
			QueryRunner qr = new QueryRunner();
			ResultSetHandler rsh = new BeanListHandler(CondoGalleryDto.class);
			
			list = (List<CondoGalleryDto>)qr.query(conn , PRODUCT.condo_gallery_select, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	/**
	 * 콘도겔러리 - 추가.
	 * @param cgDto
	 */
	public void setCondoGalleryInsert(CondoGalleryDto cgDto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cgDto.getCondo_seq());
			bind.add(cgDto.getCondo_img());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_gallery_insert, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 콘도겔러리 - 수정.
	 * @param cgDto
	 */
	public void setCondoGalleryUpdate(CondoGalleryDto cgDto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cgDto.getCondo_img());
			bind.add(cgDto.getCondoimg_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_gallery_update, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
	
	/**
	 * 콘도겔러리 - 삭제.
	 * @param strWhere
	 */
	public void setCondoGalleryDelete(String strWhere){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, String.format(PRODUCT.condo_gallery_delete,strWhere));
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
	
	/**
	 * 콘도룸 - 가져오기.
	 * @param idSeq
	 * @return
	 */
	public List<CondoRoomDto> getCondoTermSelect(int idSeq){
		List<CondoRoomDto> list = null;
		Connection conn = null;
		try {
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			
			QueryRunner qr = new QueryRunner();
			ResultSetHandler rsh = new BeanListHandler(CondoRoomDto.class);
			
			list = (List<CondoRoomDto>)qr.query(conn , PRODUCT.condo_term_select, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;		
	}
	
	/**
	 * 콘도룸 - 추가.
	 * @param ctDto
	 */
	public void setCondoTermInsert(CondoRoomDto ctDto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(ctDto.getCondo_seq());
			bind.add(ctDto.getRoomtype());
			bind.add(ctDto.getPrice_n1());
			bind.add(ctDto.getPrice_n2());
			bind.add(ctDto.getPrice_n3());
			bind.add(ctDto.getPrice_s1());
			bind.add(ctDto.getPrice_s2());
			bind.add(ctDto.getPrice_s3());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_room_insert, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
	
	/**
	 * 콘도룸 - 수정.
	 * @param ctDto
	 */
	public void setCondoTermUpdate(CondoRoomDto ctDto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(ctDto.getCondo_seq());
			bind.add(ctDto.getRoomtype());
			bind.add(ctDto.getPrice_n1());
			bind.add(ctDto.getPrice_n2());
			bind.add(ctDto.getPrice_n3());
			bind.add(ctDto.getPrice_s1());
			bind.add(ctDto.getPrice_s2());
			bind.add(ctDto.getPrice_s3());
			bind.add(ctDto.getCondoterm_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_room_update, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
	
	/**
	 * 콘도룸 - 삭제
	 * @param idSeq
	 * @param strWhere
	 */
	public void setCondoTermDelete(int idSeq, String strWhere){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, String.format(PRODUCT.condo_room_delete, strWhere), bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
}
