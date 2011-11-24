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
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import com.goodjob.board.BoardDto;
import com.goodjob.db.DBManager;
import com.goodjob.sql.BBS;
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
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			ResultSetHandler rsh = new BeanListHandler(MemberDto.class);
			QueryRunner qr = new QueryRunner();
			
			//페이징
			bind.add(((npage-1)* BBS.per_page));
			bind.add((npage*BBS.per_page));
			
			list = (List<MemberDto>) qr.query(conn , MEMBER.list, rsh , bind.toArray());
			
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
	public MemberDto getMember(int mem_no){
		
		MemberDto mDto = null;
		Connection conn = null;
		
		try {
			
			Integer[] bind = {mem_no};
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
	public void MemberRegist(MemberDto mDto){
		
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
			qr.update(conn , MEMBER.insert , bind.toArray());
			
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
		
		return true;
	}
}
