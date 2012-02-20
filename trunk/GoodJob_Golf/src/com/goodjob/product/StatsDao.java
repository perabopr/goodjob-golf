package com.goodjob.product;

import java.sql.Connection;
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

import com.goodjob.product.dto.StatsDto;
import com.goodjob.db.DBManager;
import com.goodjob.reserve.dto.CondoDto;
import com.goodjob.sql.PRODUCT;
import com.goodjob.sql.RESERVE;
import com.goodjob.sql.STATS;

public class StatsDao {

	public List<StatsDto> getStats_menu(StatsDto statsdto){
		List<StatsDto> list = null;
		Connection conn = null;
		
		String strWhere = "";
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			
			if(statsdto.getReservedate_start().length() > 0){
				strWhere += " AND date_format(A.reserve_day, '%Y-%m-%d') >= ?";
				bind.add(statsdto.getReservedate_start());
			}
			if(statsdto.getReservedate_end().length() > 0){
				strWhere += " AND date_format(A.reserve_day, '%Y-%m-%d') <= ?";
				bind.add(statsdto.getReservedate_end());
			}
			if(statsdto.getMenu_seq() > 0){
				strWhere += " AND A.menu_seq = ?";
				bind.add(statsdto.getMenu_seq());
			}
			if(statsdto.getRegion_seq() > 0){
				strWhere += " AND B.region_seq = ?";
				bind.add(statsdto.getRegion_seq());
			}
			if(statsdto.getPer_num() > 0){
				strWhere += " AND A.per_num = ?";
				bind.add(statsdto.getPer_num());
			}
			if(statsdto.getMenu_seq() == 1 || statsdto.getMenu_seq() == 2){
				if(statsdto.getReserve_prdt_name().length() > 0){
					strWhere += " AND A.golflink_name LIKE concat('%',?,'%')";
					bind.add(statsdto.getReserve_prdt_name());
				}
			}else if(statsdto.getMenu_seq() == 3 || statsdto.getMenu_seq() == 4){
				if(statsdto.getReserve_prdt_name().length() > 0){
					strWhere += " AND (A.package_name1 LIKE concat('%',?,'%') OR A.package_name2 LIKE concat('%',?,'%'))";
					bind.add(statsdto.getReserve_prdt_name());
					bind.add(statsdto.getReserve_prdt_name());
				}
			}else if(statsdto.getMenu_seq() == 5){
				if(statsdto.getReserve_prdt_name().length() > 0){
					strWhere += " AND A.condo_name LIKE concat('%',?,'%')";
					bind.add(statsdto.getReserve_prdt_name());
				}
			}
			if(statsdto.getPriceS().length() > 0){
				strWhere += " AND A.product_price >= ?";
				bind.add(statsdto.getPriceS());				
			}
			if(statsdto.getPriceE().length() > 0){
				strWhere += " AND A.product_price <= ?";
				bind.add(statsdto.getPriceE());				
			}
			if(statsdto.getReserve_name().length() > 0){
				strWhere += " AND A.reserve_name LIKE concat('%',?,'%')";
				bind.add(statsdto.getReserve_name());
			}
			
			ResultSetHandler rsh = new BeanListHandler(StatsDto.class);
			QueryRunner qr = new QueryRunner();
			

			if(statsdto.getMenu_seq() == 1 || statsdto.getMenu_seq() == 2){
				list = (List<StatsDto>) qr.query(conn , MessageFormat.format(STATS.golf_stats, strWhere), rsh , bind.toArray());
			}else if(statsdto.getMenu_seq() == 3 || statsdto.getMenu_seq() == 4){
				list = (List<StatsDto>) qr.query(conn , MessageFormat.format(STATS.package_stats, strWhere), rsh , bind.toArray());
			}else if(statsdto.getMenu_seq() == 5){
				list = (List<StatsDto>) qr.query(conn , MessageFormat.format(STATS.condo_stats, strWhere), rsh , bind.toArray());
			}
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	
		return list;
	}
	
	public List<StatsDto> getStats_menu1(StatsDto statsdto){
		List<StatsDto> list = null;
		Connection conn = null;
		
		String strWhere = "";
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			
			if(statsdto.getReservedate_start().length() > 0){
				strWhere += " AND date_format(A.reserve_day, '%Y-%m-%d') >= ?";
				bind.add(statsdto.getReservedate_start());
			}
			if(statsdto.getReservedate_end().length() > 0){
				strWhere += " AND date_format(A.reserve_day, '%Y-%m-%d') <= ?";
				bind.add(statsdto.getReservedate_end());
			}
			if(statsdto.getMenu_seq() > 0){
				strWhere += " AND A.menu_seq = ?";
				bind.add(statsdto.getMenu_seq());
			}
			if(statsdto.getRegion_seq() > 0){
				strWhere += " AND B.region_seq = ?";
				bind.add(statsdto.getRegion_seq());
			}
			if(statsdto.getPer_num() > 0){
				strWhere += " AND A.per_num = ?";
				bind.add(statsdto.getPer_num());
			}
			if(statsdto.getReserve_prdt_name().length() > 0){
				strWhere += " AND A.golflink_name LIKE concat('%',?,'%')";
				bind.add(statsdto.getReserve_prdt_name());
			}
			if(statsdto.getPriceS().length() > 0){
				strWhere += " AND A.product_price >= ?";
				bind.add(statsdto.getPriceS());				
			}
			if(statsdto.getPriceE().length() > 0){
				strWhere += " AND A.product_price <= ?";
				bind.add(statsdto.getPriceE());				
			}
			if(statsdto.getReserve_name().length() > 0){
				strWhere += " AND A.reserve_name LIKE concat('%',?,'%')";
				bind.add(statsdto.getReserve_name());
			}
			
			ResultSetHandler rsh = new BeanListHandler(StatsDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<StatsDto>) qr.query(conn , MessageFormat.format(STATS.golf_stats, strWhere), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	
		return list;
	}

	public List<StatsDto> getStats_menu2(StatsDto statsdto){
		List<StatsDto> list = null;
		Connection conn = null;
		
		String strWhere = "";
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			
			if(statsdto.getReservedate_start().length() > 0){
				strWhere += " AND date_format(A.reserve_day, '%Y-%m-%d') >= ?";
				bind.add(statsdto.getReservedate_start());
			}
			if(statsdto.getReservedate_end().length() > 0){
				strWhere += " AND date_format(A.reserve_day, '%Y-%m-%d') <= ?";
				bind.add(statsdto.getReservedate_end());
			}
			if(statsdto.getMenu_seq() > 0){
				strWhere += " AND A.menu_seq = ?";
				bind.add(statsdto.getMenu_seq());
			}
			if(statsdto.getRegion_seq() > 0){
				strWhere += " AND B.region_seq = ?";
				bind.add(statsdto.getRegion_seq());
			}
			if(statsdto.getPer_num() > 0){
				strWhere += " AND A.per_num = ?";
				bind.add(statsdto.getPer_num());
			}
			if(statsdto.getReserve_prdt_name().length() > 0){
				strWhere += " AND A.golflink_name LIKE concat('%',?,'%')";
				bind.add(statsdto.getReserve_prdt_name());
			}
			if(statsdto.getReserve_name().length() > 0){
				strWhere += " AND A.reserve_name LIKE concat('%',?,'%')";
				bind.add(statsdto.getReserve_name());
			}
			
			ResultSetHandler rsh = new BeanListHandler(StatsDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<StatsDto>) qr.query(conn , MessageFormat.format(STATS.golf_stats, strWhere), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	
		return list;
	}

	public List<StatsDto> getStats_menu5(StatsDto statsdto){
		List<StatsDto> list = null;
		Connection conn = null;
		
		String strWhere = "";
		try{
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			
			if(statsdto.getReservedate_start().length() > 0){
				strWhere += " AND date_format(A.reserve_day, '%Y-%m-%d') >= ?";
				bind.add(statsdto.getReservedate_start());
			}
			if(statsdto.getReservedate_end().length() > 0){
				strWhere += " AND date_format(A.reserve_day, '%Y-%m-%d') <= ?";
				bind.add(statsdto.getReservedate_end());
			}
			if(statsdto.getMenu_seq() > 0){
				strWhere += " AND A.menu_seq = ?";
				bind.add(statsdto.getMenu_seq());
			}
			if(statsdto.getRegion_seq() > 0){
				strWhere += " AND B.region_seq = ?";
				bind.add(statsdto.getRegion_seq());
			}
			if(statsdto.getPer_num() > 0){
				strWhere += " AND A.per_num = ?";
				bind.add(statsdto.getPer_num());
			}
			if(statsdto.getReserve_prdt_name().length() > 0){
				strWhere += " AND A.condo_name LIKE concat('%',?,'%')";
				bind.add(statsdto.getReserve_prdt_name());
			}
			if(statsdto.getReserve_name().length() > 0){
				strWhere += " AND A.reserve_name LIKE concat('%',?,'%')";
				bind.add(statsdto.getReserve_name());
			}
			
			ResultSetHandler rsh = new BeanListHandler(StatsDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<StatsDto>) qr.query(conn , MessageFormat.format(STATS.condo_stats, strWhere), rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	
		return list;
	}
}
