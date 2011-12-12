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
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import com.goodjob.db.DBManager;
import com.goodjob.sql.BBS;

/**
 * @author Administrator
 * 
 */
public class BoardDao {

	public List<BoardDto> getList(String tableName , Map<String,String> data) {

		List<BoardDto> list = null;
		Connection conn = null;
		
		String field = StringUtils.defaultIfEmpty(data.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
		int npage = NumberUtils.toInt(data.get("npage"), 1);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			
			ResultSetHandler rsh = new BeanListHandler(BoardDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("name".equals(field)){
				where = "WHERE name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("subject".equals(field)){
				where = "WHERE subject LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("content".equals(field)){
				where = "WHERE content LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			//페이징
			params.add(((npage-1)* BBS.per_page));
			params.add((npage*BBS.per_page));
			
			list = (List<BoardDto>) qr.query(conn , String.format(BBS.list, tableName, where), rsh , params.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;

	}

	/**
	 * 글 총수
	 * @param tableName
	 * @param field
	 * @param keyword
	 * @return
	 */
	public int getTotalCount(String tableName , Map<String,String> data) {
		Connection conn = null;
		Map<String, Long> map = null;
		try {
			
			String field = StringUtils.defaultIfEmpty(data.get("field"), "");
			String keyword = StringUtils.defaultIfEmpty(data.get("keyword"), "");
			int npage = NumberUtils.toInt(data.get("npage"), 1);
			
			ArrayList<Object> params = new ArrayList<Object>();
			
			conn = DBManager.getConnection();

			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("name".equals(field)){
				where = "WHERE name LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("subject".equals(field)){
				where = "WHERE subject LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			else if("content".equals(field)){
				where = "WHERE content LIKE concat('%',?,'%') " ;
				params.add(keyword);
			}
			
			map = (Map<String, Long>)qr.query(conn, String.format(BBS.totalcnt, tableName , where) , rsh , params.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("cnt")+"");
	}

	/**
	 * 게시판 상세
	 * @param tableName
	 * @param seq
	 * @return
	 */
	public BoardDto getView(String tableName , int seq){
		
		BoardDto dto = null;
		Connection conn = null;
		try {
			
			if(seq > 0 ){
				ArrayList<Integer> params = new ArrayList<Integer>();
				params.add(seq);
				
				conn = DBManager.getConnection();
				ResultSetHandler rsh = new BeanHandler(BoardDto.class);
				QueryRunner qr = new QueryRunner();
				dto = (BoardDto) qr.query(conn, String.format(BBS.view,tableName) , rsh , params.toArray());
			}
			else{
				dto = new BoardDto();
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return dto;
	}
	
	public void setReadcount(String tableName , int seq){
		BoardDto dto = null;
		Connection conn = null;
		try {
			
			ArrayList<Integer> params = new ArrayList<Integer>();
			params.add(seq);
			
			conn = DBManager.getConnection();
			ResultSetHandler rsh = new BeanHandler(BoardDto.class);
			QueryRunner qr = new QueryRunner();
			
			int result = qr.update(conn, String.format(BBS.readcount,tableName) , seq);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public Long getMaxSeq(String tableName){
		
		BoardDto dto = null;
		Connection conn = null;
		Map<String,Long> map = null;
		try {
			
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map) qr.query(conn, String.format(BBS.max,tableName) , rsh);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return map.get("seq");
	}
	
	/**
	 * 업데이트
	 * @param dto
	 */
	public void setUpdate(String tableName , BoardDto dto) {

		Connection conn = null;
		Map<String, Integer> map = null;
		try {

			conn = DBManager.getConnection();

			ArrayList<Object> params = new ArrayList<Object>();
			params.add(dto.getName());
			params.add(dto.getEmail());
			params.add(dto.getSubject());
			params.add(dto.getContent());
			params.add(dto.getIshtml());
			params.add(dto.getSeq());

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, String.format(BBS.update,tableName) , params);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}

	/**
	 * 글 등록
	 * @param tableName
	 * @param dto
	 */
	public void setInsert(String tableName , BoardDto dto) {
		
		Connection conn = null;
		try {

			conn = DBManager.getConnection();
			
			Long seq = this.getMaxSeq(tableName);
			
			ArrayList<Object> params = new ArrayList<Object>();
			params.add(seq);
			params.add(dto.getMem_id());
			params.add(dto.getName());
			params.add(dto.getEmail());
			params.add(dto.getSubject());
			params.add(dto.getContent());
			params.add(dto.getPassword());
			params.add("%Y-%m-%d");
			params.add(dto.getFilename());
			params.add("A");			//position
			params.add(seq);
			params.add(dto.getIshtml());
			params.add(dto.getWriteip());
			params.add(dto.getNotice());

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, String.format(BBS.insert,tableName) , params.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
	}
	
	/**
	 * 글 삭제
	 * @param tableName
	 * @param seq
	 */
	public void setDelete(String tableName , int seq){
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, String.format(BBS.delete,tableName) , seq);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public String Position(String pos, String org_pos)
    {
        if(org_pos == null || "".equals(org_pos))
            org_pos = "A";
        int n = pos.length();
        int m = org_pos.length();
        if(n == m)
        {
            pos = (new StringBuilder(String.valueOf(pos))).append("A").toString();
        } else
        {
            char t_pos = pos.charAt(n - 1);
            int ascii = t_pos + 1;
            t_pos = (char)ascii;
            pos = (new StringBuilder(String.valueOf(pos))).append(t_pos).toString();
        }
        return pos;
    }
}
