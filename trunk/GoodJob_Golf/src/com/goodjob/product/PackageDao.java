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
import com.goodjob.product.dto.PackageDto;
import com.goodjob.product.dto.PackagePriceDto;
import com.goodjob.product.dto.PackagePromiseDto;

public class PackageDao {
	
	/**
	 * 패키지 - 가져오기.
	 * @param strWhere
	 * @return
	 */
	public List<PackageDto> getPackageSelect(int region_seq, int pkSeq){
		Connection conn = null;
		List<PackageDto> list = null;
		
		try{
			conn = DBManager.getConnection();
			
			String strQuery = "";
			ArrayList<Object> bind = new ArrayList<Object>();
			if(region_seq > 0)
			{				
				strQuery += " AND a.region_seq = ? ";
				bind.add(region_seq);
			}
			if(pkSeq > 0)
			{
				strQuery += " AND a.package_seq = ? ";
				bind.add(pkSeq);		
			}
			
			ResultSetHandler rsh = new BeanListHandler(PackageDto.class);
			
			QueryRunner qr = new QueryRunner();
			
			list = (List<PackageDto>)qr.query(conn, MessageFormat.format(PRODUCT.package_select, strQuery), rsh, bind.toArray());	
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return list;
	}
	
	/**
	 * 패키지 - 추가 & 패키지가격 - 추가.
	 * @param pkDto
	 */
	public void setPackageInsert(PackageDto pkDto, PackagePriceDto pkpDto){
		Connection conn = null;
		int idSeq = 0;
		try{
			conn = DBManager.getConnection();	
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(pkDto.getMenu_seq());
			bind.add(pkDto.getPackage_name1());
			bind.add(pkDto.getPackage_name2());
			bind.add(pkDto.getRegion_seq());
			bind.add(pkDto.getSaledate_start());
			bind.add(pkDto.getSaledate_end());
			bind.add(pkDto.getPackage_type());
			bind.add(pkDto.getImg_main());
			bind.add(pkDto.getImg_sub());
			bind.add(pkDto.getImg_sub1());
			bind.add(pkDto.getImg_sub2());
			bind.add(pkDto.getImg_sub3());
			bind.add(pkDto.getImg_sub4());
			bind.add(pkDto.getAddress1());
			bind.add(pkDto.getAddress2());
			bind.add(pkDto.getPoint_x());
			bind.add(pkDto.getPoint_x());
			bind.add(pkDto.getView_yn());
			bind.add(pkDto.getPackage_guide());
			bind.add(pkDto.getUse_guide());
			bind.add(pkDto.getUse_rule());
			bind.add(pkDto.getGolflink_guide());
			bind.add(pkDto.getWay_map());			
			
			//패키지 추가.
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.package_insert, bind.toArray());
			
			//생성키 반환.
			Statement stmt = conn.createStatement();
			ResultSet rst = stmt.executeQuery(PRODUCT.getSequenceId);
			if(rst.next()){
				idSeq = rst.getInt(1);
			}
			
			//패키지가격 추가.
			pkpDto.setPackage_seq(idSeq);
			setPackagePriceInsert(pkpDto);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 패키지 - 수정
	 * @param pkDto
	 */
	public void setPackageUpdate(PackageDto pkDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();	
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(pkDto.getMenu_seq());
			bind.add(pkDto.getPackage_name1());
			bind.add(pkDto.getPackage_name2());
			bind.add(pkDto.getRegion_seq());
			bind.add(pkDto.getSaledate_start());
			bind.add(pkDto.getSaledate_end());
			bind.add(pkDto.getPackage_type());
			bind.add(pkDto.getImg_main());
			bind.add(pkDto.getImg_sub());
			bind.add(pkDto.getImg_sub1());
			bind.add(pkDto.getImg_sub2());
			bind.add(pkDto.getImg_sub3());
			bind.add(pkDto.getImg_sub4());
			bind.add(pkDto.getAddress1());
			bind.add(pkDto.getAddress2());
			bind.add(pkDto.getPoint_x());
			bind.add(pkDto.getPoint_x());
			bind.add(pkDto.getView_yn());
			bind.add(pkDto.getPackage_guide());
			bind.add(pkDto.getUse_guide());
			bind.add(pkDto.getGolflink_guide());
			bind.add(pkDto.getUse_rule());
			bind.add(pkDto.getWay_map());	
			bind.add(pkDto.getPackage_seq());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.package_update, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 패키지 - 삭제
	 * @param idSeq
	 */
	public void setPackageDelete(int idSeq){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.package_delete, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}	
	}
	
	/**
	 * 패키지가격 - 가져오기.
	 * @param idSeq
	 * @return
	 */
	public List<PackagePriceDto> getPackagePriceSelect(int idSeq){
		Connection conn = null;
		List<PackagePriceDto> list = null;
		
		try{
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			
			ResultSetHandler rsh = new BeanListHandler(PackagePriceDto.class);
			
			QueryRunner qr = new QueryRunner();
			
			list = (List<PackagePriceDto>)qr.query(conn, PRODUCT.package_price_select, rsh, bind.toArray());	
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return list;
	}
	
	/**
	 * 패키지가격 - 추가
	 * @param ppDto
	 */
	public void setPackagePriceInsert(PackagePriceDto ppDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();	
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(ppDto.getPackage_seq());
			bind.add(ppDto.getPeak_n_mon());
			bind.add(ppDto.getPeak_n_tue());
			bind.add(ppDto.getPeak_n_wed());
			bind.add(ppDto.getPeak_n_thu());
			bind.add(ppDto.getPeak_n_fri());
			bind.add(ppDto.getPeak_n_sat());
			bind.add(ppDto.getPeak_n_sun());
			bind.add(ppDto.getPeak_s_mon());
			bind.add(ppDto.getPeak_s_tue());
			bind.add(ppDto.getPeak_s_wed());
			bind.add(ppDto.getPeak_s_thu());
			bind.add(ppDto.getPeak_s_fri());
			bind.add(ppDto.getPeak_s_sat());
			bind.add(ppDto.getPeak_s_sun());
			bind.add(ppDto.getOff_n_mon());
			bind.add(ppDto.getOff_n_tue());
			bind.add(ppDto.getOff_n_wed());
			bind.add(ppDto.getOff_n_thu());
			bind.add(ppDto.getOff_n_fri());
			bind.add(ppDto.getOff_n_sat());
			bind.add(ppDto.getOff_n_sun());
			bind.add(ppDto.getOff_s_mon());
			bind.add(ppDto.getOff_s_tue());
			bind.add(ppDto.getOff_s_wed());
			bind.add(ppDto.getOff_s_thu());
			bind.add(ppDto.getOff_s_fri());
			bind.add(ppDto.getOff_s_sat());
			bind.add(ppDto.getOff_s_sun());			
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.package_price_insert, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 패키지가격 - 수정
	 * @param ppDto
	 */
	public void setPackagePriceUpdate(PackagePriceDto ppDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();	
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(ppDto.getPeak_n_mon());
			bind.add(ppDto.getPeak_n_tue());
			bind.add(ppDto.getPeak_n_wed());
			bind.add(ppDto.getPeak_n_thu());
			bind.add(ppDto.getPeak_n_fri());
			bind.add(ppDto.getPeak_n_sat());
			bind.add(ppDto.getPeak_n_sun());
			bind.add(ppDto.getPeak_s_mon());
			bind.add(ppDto.getPeak_s_tue());
			bind.add(ppDto.getPeak_s_wed());
			bind.add(ppDto.getPeak_s_thu());
			bind.add(ppDto.getPeak_s_fri());
			bind.add(ppDto.getPeak_s_sat());
			bind.add(ppDto.getPeak_s_sun());
			bind.add(ppDto.getOff_n_mon());
			bind.add(ppDto.getOff_n_tue());
			bind.add(ppDto.getOff_n_wed());
			bind.add(ppDto.getOff_n_thu());
			bind.add(ppDto.getOff_n_fri());
			bind.add(ppDto.getOff_n_sat());
			bind.add(ppDto.getOff_n_sun());
			bind.add(ppDto.getOff_s_mon());
			bind.add(ppDto.getOff_s_tue());
			bind.add(ppDto.getOff_s_wed());
			bind.add(ppDto.getOff_s_thu());
			bind.add(ppDto.getOff_s_fri());
			bind.add(ppDto.getOff_s_sat());
			bind.add(ppDto.getOff_s_sun());		
			bind.add(ppDto.getPackage_seq());	
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.package_price_update, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 패키지가격 - 삭제
	 * @param ppDto
	 */
	public void setPackagePriceDelete(PackagePriceDto ppDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();	
			
			ArrayList<Object> bind = new ArrayList<Object>();	
			bind.add(ppDto.getPackage_seq());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, PRODUCT.package_price_delete, bind.toArray());			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 패키지위약 - 가져오기.
	 * @param glSeq
	 * @return
	 */
	public List<PackagePromiseDto> getPackagePromiseSelect(int glSeq){
		List<PackagePromiseDto> list = null;
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glSeq);
			
			ResultSetHandler rsh = new BeanListHandler(PackagePromiseDto.class);
			
			QueryRunner qr = new QueryRunner();
			
			list = (List<PackagePromiseDto>)qr.query(conn, PRODUCT.package_promise_select, rsh, bind.toArray());	
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return list;
	}
	
	/**
	 * 패키지위약 - 추가
	 * @param glpDto
	 */
	public void setPackagePromiseInsert(PackagePromiseDto glpDto){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glpDto.getPackage_seq());
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
			
			qr.update(conn, PRODUCT.package_promise_insert, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 패키지위약 - 수정
	 * @param glpDto
	 */
	public void setPackagePromiseUpdate(PackagePromiseDto glpDto){
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
			bind.add(glpDto.getPackage_seq());
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.package_promise_update, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 패키지위약 - 삭제
	 * @param idSeq
	 */
	public void setPackagePromiseDelete(int idSeq){
		Connection conn = null;
		
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(idSeq);
			
			QueryRunner qr = new QueryRunner();
			
			qr.update(conn, PRODUCT.package_promise_delete, bind.toArray());
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}		
	}
}
