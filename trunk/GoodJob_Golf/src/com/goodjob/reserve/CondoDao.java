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

public class CondoDao {
	public List<CondoDto> getCondoSelect(String strWhere){
		List<CondoDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			QueryRunner qr = new QueryRunner();
			ResultSetHandler rsh = new BeanListHandler(CondoDto.class);
			
			list = (List<CondoDto>)qr.query(conn , String.format(PRODUCT.golflink_select_full, strWhere), rsh , bind.toArray());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
}
