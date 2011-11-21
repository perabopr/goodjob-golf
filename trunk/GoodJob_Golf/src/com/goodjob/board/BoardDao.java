/**
 * 
 */
package com.goodjob.board;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.lang.StringUtils;

import com.goodjob.db.DBManager;

/**
 * @author Administrator
 * 
 */
public class BoardDao {

	public List<BoardDto> getList() {

		List<BoardDto> list = null;
		Connection conn = null;
		try {
			conn = DBManager.getConnection();

			ArrayList params = new ArrayList();
			params.add("1%");

			ResultSetHandler rsh = new BeanListHandler(BoardDto.class);
			QueryRunner qr = new QueryRunner();
			list = (List<BoardDto>) qr
					.query(conn,
							"SELECT boardTitle, boardContent, userNick FROM board_test_t WHERE userIp like ?",rsh, params);

			for (int i = 0; i < list.size(); i++) {
				BoardDto board = (BoardDto) list.get(i);
				System.out.println(board.getSeq());
				System.out.println(board.getName());
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;

	}

	public int getCount() {
		Connection conn = null;
		Map<String, Integer> map = null;
		try {

			conn = DBManager.getConnection();

			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map) qr.query(conn, "SELECT count(*) cnt FROM board_test_t",rsh);

			System.out.println(map.get("cnt"));

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return map.get("cnt");
	}

	/**
	 * 
	 * @param dto
	 */
	public void setUpdate(BoardDto dto) {

		Connection conn = null;
		Map<String, Integer> map = null;
		try {

			String updateQuery = "UPDATE board_common_t SET badIp=?, badId=?, badNick=?, badContent=?, inputPerMin=?, tryLogin=?";

			conn = DBManager.getConnection();

			ArrayList params = new ArrayList();
			params.add(dto.getSeq());
			params.add(StringUtils.defaultString(dto.getName(), ""));

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, updateQuery, params);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}

	public void setInsert() {
		
	}
}
