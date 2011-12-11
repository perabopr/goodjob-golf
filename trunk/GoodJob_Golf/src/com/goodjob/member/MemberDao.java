/**
 * 
 */
package com.goodjob.member;

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
import com.goodjob.sql.MEMBER;

/**
 * @author dubero
 *
 */
public class MemberDao {

	/**
	 * 회원 리스트
	 * @param params
	 * @return
	 */
	public List<MemberDto> getMemberList(Map<String,String> params){
		
		List<MemberDto> list = null;
		Connection conn = null;
		
		int npage = NumberUtils.toInt(params.get("npage"), 1);
		String field = StringUtils.defaultIfEmpty(params.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(params.get("keyword"), "");
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			ResultSetHandler rsh = new BeanListHandler(MemberDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("name".equals(field)){
				where = "WHERE MEM_NAME LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("id".equals(field)){
				where = "WHERE MEM_ID LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("type".equals(field)){
				where = "WHERE MEM_TYPE = ? " ;
				bind.add(keyword);
			}
			else if("reg_dt".equals(field)){
				where = "WHERE date_format(reg_dt,'%Y%m%d') = ? " ;
				bind.add(keyword);
			}
			
			//페이징
			bind.add(((npage-1)* MEMBER.per_page));
			bind.add((npage*MEMBER.per_page));
			
			list = (List<MemberDto>) qr.query(conn , String.format(MEMBER.list,where) , rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	/**
	 * 회원 상세
	 * @param mem_no
	 * @return
	 */
	public MemberDto getMember(String mem_id){
		
		MemberDto mDto = null;
		Connection conn = null;
		
		try {
			
			String[] bind = {mem_id};
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new BeanHandler(MemberDto.class);
			QueryRunner qr = new QueryRunner();
			
			mDto = (MemberDto)qr.query(conn , MEMBER.view , rsh , bind);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return mDto;
	}
	
	/**
	 * 회원 가입
	 * @param mDto
	 */
	public boolean memberRegist(MemberDto mDto){
		
		boolean isSuccess = false;
		Connection conn = null;
		
		try {
			
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(0);
			bind.add(mDto.getMem_id());
			bind.add(mDto.getMem_name());
			bind.add(mDto.getMem_pwd());
			bind.add(mDto.getMem_mtel());
			bind.add(mDto.getSms_yn());
			bind.add(mDto.getEmail_yn());
			bind.add(mDto.getRecommend());
			
			QueryRunner qr = new QueryRunner();
			int result = qr.update(conn , MEMBER.insert , bind.toArray());
			
			if(result != 0)
				isSuccess = true;
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return isSuccess;
	}
	
	/**
	 * 회원 수정
	 * @param mDto
	 */
	public void MemberUpdate(MemberDto mDto){
		Connection conn = null;
		
		try {
			
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mDto.getMem_name());
			bind.add(mDto.getMem_pwd());
			bind.add(mDto.getMem_mtel());
			bind.add(mDto.getSms_yn());
			bind.add(mDto.getEmail_yn());
			bind.add(mDto.getRecommend());
			bind.add(mDto.getMem_id());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn , MEMBER.update , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 회원 수정
	 * @param mDto
	 */
	public void MemberType(String mem_id , String type){
		Connection conn = null;
		
		try {
			
			conn = DBManager.getConnection();
			
			ArrayList<String> bind = new ArrayList<String>();
			bind.add(type);
			bind.add(mem_id);
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn , MEMBER.update , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 회원 탈퇴
	 * @param mem_id
	 */
	public void MemberSeccesstion(String mem_id){
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			String[] bind = {mem_id};
			QueryRunner qr = new QueryRunner();
			qr.update(conn , MEMBER.secession , bind);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 아이디 찾기
	 * @return
	 */
	public MemberDto idFind(){
		
		return null;
	}

	/**
	 * 비번 찾기
	 * @return
	 */
	public MemberDto pwdFind(){
		
		return null;
	}
	
	/**
	 * 아이디 중복
	 * @param mem_id
	 * @return
	 */
	public boolean isDuplicate(String mem_id){
		
		boolean isDuplicate = false;
		
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			String[] bind = {mem_id};
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			Map<String,Long> map = (Map)qr.query(conn , MEMBER.dup_id , rsh , bind);
			long cnt = map.get("cnt");
			if(cnt > 0) isDuplicate = true;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return isDuplicate;
	}
	
	public MemberDto logon(String mem_id , String mem_pwd){
		
		MemberDto mDto = null;
		Connection conn = null;
		
		try {
			
			String[] bind = {mem_pwd,mem_id};
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new BeanHandler(MemberDto.class);
			QueryRunner qr = new QueryRunner();
			
			mDto = (MemberDto)qr.query(conn , MEMBER.logon , rsh , bind);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return mDto;
	}
}
