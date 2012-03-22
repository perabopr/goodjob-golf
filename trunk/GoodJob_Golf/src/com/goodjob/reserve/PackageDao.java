package com.goodjob.reserve;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;
import java.sql.ResultSet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.goodjob.db.DBManager;
import com.goodjob.reserve.dto.PackageDto;
import com.goodjob.reserve.dto.PackagePromiseDto;
import com.goodjob.reserve.dto.PackageReserveDto;
import com.goodjob.reserve.dto.RegionDto;
import com.goodjob.sql.PRODUCT;
import com.goodjob.sql.RESERVE;

public class PackageDao{
	public List<RegionDto> getRegionList(String rType){
		
		List<RegionDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(rType);
			ResultSetHandler rsh = new BeanListHandler(RegionDto.class);
			QueryRunner qr = new QueryRunner();
						
			list = (List<RegionDto>) qr.query(conn , PRODUCT.region_select, rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public List<PackageDto> getPackageList(String strWhere){		
		List<PackageDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new BeanListHandler(PackageDto.class);
			QueryRunner qr = new QueryRunner();
			
			System.out.println(String.format(RESERVE.getPackage_select,strWhere));
			
			list = (List<PackageDto>) qr.query(conn , String.format(RESERVE.getPackage_select,strWhere), rsh );
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;		
	}
	
	public List<PackagePromiseDto> getPackagePromise(int pkSeq){
		List<PackagePromiseDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(pkSeq);
			ResultSetHandler rsh = new BeanListHandler(PackagePromiseDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<PackagePromiseDto>) qr.query(conn , RESERVE.getPackagePromise, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public void setPackageReserve(PackageReserveDto glrDto){
		Connection conn = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glrDto.getMenu_seq());
			bind.add(glrDto.getReserve_name());
			bind.add(glrDto.getReserve_uid());
			bind.add(glrDto.getTour_date());
			bind.add(glrDto.getPer_num());
			bind.add(glrDto.getReserve_phone());
			bind.add(glrDto.getPackage_price());
			bind.add(glrDto.getRequest_content());
			bind.add(glrDto.getProcess_status());
			bind.add(glrDto.getPackage_seq());
			
			QueryRunner qr = new QueryRunner();
			
			//예약
			qr.update(conn, RESERVE.setPackageReserve_insert, bind.toArray());			
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
}
