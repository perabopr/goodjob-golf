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
import com.goodjob.sql.PRODUCT;
import com.goodjob.product.dto.CondoDto;
import com.goodjob.product.dto.CondoGalleryDto;
import com.goodjob.product.dto.CondoPromiseDto;
import com.goodjob.product.dto.CondoRoomDto;

public class CondoDao {
	/**
	 * 콘도 - 가져오기.
	 * @param strWhere
	 * @return
	 */
	public List<CondoDto> getCondoSelect(int region_seq, int condoSeq){
		List<CondoDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();

			String strQuery = "";
			ArrayList<Object> bind = new ArrayList<Object>();
			if(region_seq > 0)
			{				
				strQuery = " AND a.region_seq = ? ";
				bind.add(region_seq);
			}
			if(condoSeq > 0)
			{
				strQuery = " AND a.condo_seq = ? ";
				bind.add(condoSeq);								
			}
			
			QueryRunner qr = new QueryRunner();
			
			ResultSetHandler rsh = new BeanListHandler(CondoDto.class);
			
			list = (List<CondoDto>)qr.query(conn , MessageFormat.format(PRODUCT.condo_select, strQuery), rsh , bind.toArray());
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
			bind.add(cDto.getUse_rule());
			bind.add(cDto.getWay_map());
			
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
			bind.add(cDto.getUse_rule());
			bind.add(cDto.getWay_map());
			bind.add(cDto.getCondo_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_update, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}	
	}
	
	public void setCondoOrderUpdate(CondoDto cDto){
		Connection conn = null;
		try	{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cDto.getOrder_num());
			bind.add(cDto.getCondo_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_order_update, bind.toArray());
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
	
	public void setCondoGallery2Delete(int condoSeq){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(condoSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_gallery2_delete, bind.toArray());
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
	public List<CondoRoomDto> getCondoRoomSelect(int idSeq){
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
	public void setCondoRoomInsert(CondoRoomDto ctDto){
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
	public void setCondoRoomUpdate(CondoRoomDto ctDto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(ctDto.getRoomtype());
			bind.add(ctDto.getPrice_n1());
			bind.add(ctDto.getPrice_n2());
			bind.add(ctDto.getPrice_n3());
			bind.add(ctDto.getPrice_s1());
			bind.add(ctDto.getPrice_s2());
			bind.add(ctDto.getPrice_s3());
			bind.add(ctDto.getCondoroom_seq());
			
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
	public void setCondoRoomDelete(int condoSeq){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(condoSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_room_delete, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
	
	/**
	 * 콘도 위약처리규정 - 가져오기.
	 * @param cdSeq
	 * @return
	 */
	public List<CondoPromiseDto> getCondoPromiseSelect(int cdSeq){
		List<CondoPromiseDto> list = null;
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cdSeq);
			
			ResultSetHandler rsh = new BeanListHandler(CondoPromiseDto.class);
			
			QueryRunner qr = new QueryRunner();
			
			list = (List<CondoPromiseDto>)qr.query(conn, PRODUCT.condo_promise_select, rsh, bind.toArray());	
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	/**
	 * 콘도위약 - 추가
	 * @param glpDto
	 */
	public void setCondoPromiseInsert(CondoPromiseDto cdpDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cdpDto.getCondo_seq());
			bind.add(cdpDto.getPromise1_type());
			bind.add(cdpDto.getPromise1());
			bind.add(cdpDto.getPromise2_type());
			bind.add(cdpDto.getPromise2());
			bind.add(cdpDto.getPromise3_type());
			bind.add(cdpDto.getPromise3());
			bind.add(cdpDto.getPromise4_type());
			bind.add(cdpDto.getPromise4());
			bind.add(cdpDto.getPromise5_type());
			bind.add(cdpDto.getPromise5());
			bind.add(cdpDto.getCancelrule());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_promise_insert, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 콘도위약 - 수정
	 * @param glpDto
	 */
	public void setCondoPromiseUpdate(CondoPromiseDto cdpDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(cdpDto.getPromise1_type());
			bind.add(cdpDto.getPromise1());
			bind.add(cdpDto.getPromise2_type());
			bind.add(cdpDto.getPromise2());
			bind.add(cdpDto.getPromise3_type());
			bind.add(cdpDto.getPromise3());
			bind.add(cdpDto.getPromise4_type());
			bind.add(cdpDto.getPromise4());
			bind.add(cdpDto.getPromise5_type());
			bind.add(cdpDto.getPromise5());
			bind.add(cdpDto.getCondo_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_promise_update, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 콘도위약 - 삭제
	 * @param idSeq
	 */
	public void setCondoPromiseDelete(int idSeq){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.condo_promise_delete, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
}
