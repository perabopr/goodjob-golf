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
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.lang.math.NumberUtils;

import com.goodjob.coupon.CouponDao;
import com.goodjob.coupon.dto.CouponDto;
import com.goodjob.db.DBManager;
import com.goodjob.reserve.dto.GolfLinkDto;
import com.goodjob.reserve.dto.GolfLinkPriceDto;
import com.goodjob.reserve.dto.GolfLinkPromiseDto;
import com.goodjob.reserve.dto.GolfLinkReserveDto;
import com.goodjob.reserve.dto.ProductDto;
import com.goodjob.reserve.dto.ProductReserveDto;
import com.goodjob.sql.PRODUCT;
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
			
			//String strNowDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
			
			ArrayList<Object> bind = new ArrayList<Object>();
			//bind.add(strNowDate);
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
	
	public int getGolfProductListCnt(int product_seq){
		Map<String, Long> map = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> params = new ArrayList<Object>();	
			params.add(product_seq);
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			map = (Map<String, Long>)qr.query(conn, RESERVE.getProductSub_count, rsh , params.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("cnt")+"");
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
	
	public List<ProductReserveDto> getGolfProduct(int productsubSeq){
		List<ProductReserveDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(productsubSeq);
			ResultSetHandler rsh = new BeanListHandler(ProductReserveDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<ProductReserveDto>) qr.query(conn , RESERVE.getProductReserve2, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public void setGolfReserve(GolfLinkReserveDto glrDto, CouponDto cpDto){
		int idSeq = 0;
		Connection conn = null;
		List<ProductReserveDto> list = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glrDto.getProductsub_seq());
			
			QueryRunner qr = new QueryRunner();
			ResultSetHandler rsh = new BeanListHandler(ProductReserveDto.class);
			list = (List<ProductReserveDto>)qr.query(conn , RESERVE.getProductReserve2, rsh, bind.toArray());
			
			// 상품이 예약가능할때만...
			if(list.size() > 0 && list.get(0).getProduct_status().equals("0")){				
				bind = new ArrayList<Object>();
				bind.add(glrDto.getReserve_name());
				bind.add(glrDto.getReserve_uid());
				bind.add(glrDto.getPer_num());
				bind.add(glrDto.getReserve_phone());
				
				if(glrDto.getSite_seq() == 2)
					bind.add(list.get(0).getNH_price() * Integer.parseInt(glrDto.getPer_num()) - glrDto.getCoupon_price() - list.get(0).getReal_nh_price()*Integer.parseInt(glrDto.getPer_num()));
				else 
					bind.add(list.get(0).getNH_price() * Integer.parseInt(glrDto.getPer_num()) - glrDto.getCoupon_price());
				bind.add(glrDto.getCoupon_price());
				bind.add(glrDto.getProcess_status());
				bind.add(glrDto.getCard_bill_num());
				bind.add(glrDto.getSite_seq());
				bind.add(glrDto.getProductsub_seq());
				
				//예약
				qr.update(conn, RESERVE.setGolfLinkReserve_insert, bind.toArray());
				
				//생성키 반환.
				Statement stmt = conn.createStatement();
				ResultSet rst = stmt.executeQuery(PRODUCT.getSequenceId);
				if(rst.next()){
					idSeq = rst.getInt(1);
				}
				
				//상품상세 "예약중"상태로 변경.
				bind = new ArrayList<Object>();
				bind.add("1");
				bind.add(glrDto.getProductsub_seq());
				qr.update(conn, RESERVE.setProductSub_update, bind.toArray());
				
				//쿠폰적용
				if(cpDto.getCoupon_seq() > 0){
					CouponDao cpDao = new CouponDao();
					cpDto.setReserve_seq(idSeq);
					cpDao.setCouponUse(cpDto);					
				}
			}
			
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public void setGolfReserve2(GolfLinkReserveDto glrDto, CouponDto cpDto){
		int idSeq = 0;
		Connection conn = null;
		List<ProductReserveDto> list = null;
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glrDto.getProductsub_seq());
			
			QueryRunner qr = new QueryRunner();
			ResultSetHandler rsh = new BeanListHandler(ProductReserveDto.class);
			list = (List<ProductReserveDto>)qr.query(conn , RESERVE.getProductReserve3, rsh, bind.toArray());
			
			// 상품이 예약가능할때만...
			if(list.size() > 0){				
				bind = new ArrayList<Object>();
				if(glrDto.getReserve_day().length() > 0){
					bind.add(glrDto.getReserve_day());
				}
				bind.add(glrDto.getReserve_name());
				bind.add(glrDto.getReserve_uid());
				bind.add(glrDto.getPer_num());
				bind.add(glrDto.getReserve_phone());
				bind.add(list.get(0).getNH_price() * Integer.parseInt(glrDto.getPer_num()) - glrDto.getCoupon_price());
				bind.add(glrDto.getCoupon_price());
				bind.add(glrDto.getProcess_status());
				bind.add(glrDto.getCard_bill_num());
				bind.add(glrDto.getSite_seq());
				bind.add(glrDto.getProductsub_seq());
				
				//예약
				if(glrDto.getReserve_day().length() > 0){
					qr.update(conn, RESERVE.setGolfLinkReserve_insert2, bind.toArray());
				}else{
					qr.update(conn, RESERVE.setGolfLinkReserve_insert, bind.toArray());
				}
				
				//생성키 반환.
				Statement stmt = conn.createStatement();
				ResultSet rst = stmt.executeQuery(PRODUCT.getSequenceId);
				if(rst.next()){
					idSeq = rst.getInt(1);
				}
				
				//상품상세 "예약중"상태로 변경.
				bind = new ArrayList<Object>();
				bind.add("1");
				bind.add(glrDto.getProductsub_seq());
				qr.update(conn, RESERVE.setProductSub_update, bind.toArray());
				
				//쿠폰적용
				if(cpDto.getCoupon_seq() > 0){
					CouponDao cpDao = new CouponDao();
					cpDto.setReserve_seq(idSeq);
					cpDao.setCouponUse(cpDto);					
				}
			}
			
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public List<ProductDto> getProduct(int glSeq){
		List<ProductDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(glSeq);
			ResultSetHandler rsh = new BeanListHandler(ProductDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<ProductDto>) qr.query(conn , RESERVE.getProduct_select, rsh, bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return list;		
	}
}
