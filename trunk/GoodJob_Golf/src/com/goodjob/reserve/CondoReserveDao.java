package com.goodjob.reserve;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.goodjob.db.DBManager;
import com.goodjob.reserve.dto.CondoDto;
import com.goodjob.reserve.dto.CondoGalleryDto;
import com.goodjob.reserve.dto.CondoRoomDto;
import com.goodjob.sql.RESERVE;

public class CondoReserveDao {

	public List<CondoDto> getCondoList(String region){
		
		List<CondoDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(region);
			
			ResultSetHandler rsh = new BeanListHandler(CondoDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<CondoDto>) qr.query(conn , RESERVE.condo_select_list, rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public CondoDto getCondo(int condo_seq){

		Connection conn = null;
		CondoDto cDto = null;
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(condo_seq);
			
			ResultSetHandler rsh = new BeanHandler(CondoDto.class);
			QueryRunner qr = new QueryRunner();
			
			cDto = (CondoDto) qr.query(conn , RESERVE.condo_select, rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return cDto;		
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
			
			list = (List<CondoGalleryDto>)qr.query(conn , RESERVE.condo_gallery_select, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
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
			
			list = (List<CondoRoomDto>)qr.query(conn , RESERVE.condo_term_select, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;		
	}
}
