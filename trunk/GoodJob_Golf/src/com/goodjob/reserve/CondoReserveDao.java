package com.goodjob.reserve;

import java.sql.Connection;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.goodjob.db.DBManager;
import com.goodjob.reserve.dto.CondoPromiseDto;
import com.goodjob.reserve.dto.CondoDto;
import com.goodjob.reserve.dto.CondoGalleryDto;
import com.goodjob.reserve.dto.CondoReserveDto;
import com.goodjob.reserve.dto.CondoRoomDto;
import com.goodjob.sql.RESERVE;

public class CondoReserveDao {

	public List<CondoDto> getCondoList(int region , int site_seq){
		
		List<CondoDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			
			
			ResultSetHandler rsh = new BeanListHandler(CondoDto.class);
			QueryRunner qr = new QueryRunner();
			
			String where = " AND site_seq = ? ";
			bind.add(site_seq);
			if(region > 0){
				where = " AND region_seq = ? ";
				bind.add(region);
			}
			
			list = (List<CondoDto>) qr.query(conn , MessageFormat.format(RESERVE.condo_select_list,where), rsh , bind.toArray());
			
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
			
			list = (List<CondoRoomDto>)qr.query(conn , RESERVE.condo_room_select, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;		
	}
	
	public List<CondoPromiseDto> getCondoPromise(int condoSeq){
		List<CondoPromiseDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(condoSeq);
			ResultSetHandler rsh = new BeanListHandler(CondoPromiseDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<CondoPromiseDto>) qr.query(conn , RESERVE.condo_promise, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public void setCondoReserve(CondoReserveDto cdDto){
		
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(5);
			bind.add(cdDto.getCondo_seq());
			bind.add(cdDto.getReserve_name());
			bind.add(cdDto.getReserve_uid());
			bind.add(cdDto.getCondo_name());
			bind.add(cdDto.getRoomtype());
			bind.add(cdDto.getCondoroom_seq());
			bind.add(cdDto.getIn_date().replaceAll("-", ""));
			bind.add(cdDto.getOut_date().replaceAll("-", ""));
			bind.add(cdDto.getRoom_num());
			bind.add(cdDto.getPer_num());
			bind.add(cdDto.getReserve_phone());
			bind.add(0);
			bind.add(cdDto.getReserve_memo());
			bind.add(cdDto.getSite_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, RESERVE.condo_reserve_insert, bind.toArray());
						
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
}
