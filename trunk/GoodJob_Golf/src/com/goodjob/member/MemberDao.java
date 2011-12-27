/**
 * 
 */
package com.goodjob.member;

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
			if("name".equals(field) && keyword.length() > 0){
				where = " where mem_name LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("id".equals(field) && keyword.length() > 0){
				where = " where mem_id like concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("type".equals(field) && keyword.length() > 0){
				where = " where mem_type = ? " ;
				bind.add(keyword);
			}
			else if("reg_dt".equals(field) && keyword.length() > 0){
				where = " where date_format(reg_dt,'%Y%m%d') = ? " ;
				bind.add(keyword);
			}
			else if("secession".equals(field)){
				where = " where secession = 'H'" ;
			}
			
			//페이징
			bind.add(((npage-1)* MEMBER.per_page));
			bind.add((npage*MEMBER.per_page));
			
			list = (List<MemberDto>) qr.query(conn , MessageFormat.format(MEMBER.list,where) , rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public int getTotalMember(Map<String,String> params){
		
		Connection conn = null;
		Map<String, Long> map = null;
		
		String field = StringUtils.defaultIfEmpty(params.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(params.get("keyword"), "");
		
		try {
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			
			//검색조건
			String where = "";
			if("name".equals(field) && keyword.length() > 0){
				where = " where mem_name like concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("id".equals(field) && keyword.length() > 0){
				where = " where mem_id like concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("type".equals(field) && keyword.length() > 0){
				where = " where mem_type = ? " ;
				bind.add(keyword);
			}
			else if("reg_dt".equals(field) && keyword.length() > 0){
				where = " where date_format(reg_dt,'%Y%m%d') = ? " ;
				bind.add(keyword);
			}
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			map = (Map<String, Long>) qr.query(conn , MessageFormat.format(MEMBER.mem_total,where) , rsh);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("total")+"");
	}
	
	public int getTotalMember(){
		
		Connection conn = null;
		Map<String, Long> map = null;
		
		try {
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			map = (Map<String, Long>) qr.query(conn , MessageFormat.format(MEMBER.mem_total,"") , rsh);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("total")+"");
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
			bind.add(mDto.getMem_id());
			bind.add(mDto.getMem_name());
			bind.add(mDto.getMem_pwd());
			bind.add(mDto.getMem_jumin());
			bind.add(mDto.getMem_mtel());
			bind.add(mDto.getSms_yn());
			bind.add(mDto.getEmail_yn());
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn , MEMBER.insert , bind.toArray());
			
			isSuccess = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return isSuccess;
	}
	
	/**
	 * 회원 수정
	 * @param mDto
	 */
	public void memberUpdate(MemberDto mDto){
		Connection conn = null;
		
		try {
			
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mDto.getMem_pwd());
			bind.add(mDto.getMem_mtel());
			bind.add(mDto.getSms_yn());
			bind.add(mDto.getEmail_yn());
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
	public boolean memberTypeUpdate(String mem_id , String type){
		Connection conn = null;
		boolean isUpdate = false;
		try {
			
			conn = DBManager.getConnection();
			
			ArrayList<String> bind = new ArrayList<String>();
			bind.add(type);
			bind.add(mem_id);
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn , MEMBER.type_update , bind.toArray());
			
			isUpdate = true;
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return isUpdate;
	}
	
	public boolean memberMemoUpdate(String mem_id , String memo){
		Connection conn = null;
		boolean isUpdate = false;
		try {
			
			conn = DBManager.getConnection();
			
			ArrayList<String> bind = new ArrayList<String>();
			bind.add(memo);
			bind.add(mem_id);
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn , MEMBER.memo_update , bind.toArray());
			
			isUpdate = true;
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return isUpdate;
	}
	
	/**
	 * 회원 탈퇴
	 * @param mem_id
	 */
	public boolean memberSeccesstion(String mem_id){
		Connection conn = null;
		boolean isUpdate = false;
		try {
			conn = DBManager.getConnection();
			String[] bind = {mem_id};
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn , MEMBER.secession , bind);
			
			isUpdate = true;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return isUpdate;
	}
	
	/**
	 * 회원 탈퇴
	 * @param mem_id
	 */
	public boolean userSeccesstion(String mem_id , String memo){
		Connection conn = null;
		boolean isUpdate = false;
		try {
			conn = DBManager.getConnection();
			String[] bind = {memo,mem_id};
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn , MEMBER.user_secession , bind);
			
			isUpdate = true;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return isUpdate;
	}
	
	/**
	 * 아이디 찾기
	 * @return
	 */
	public String idFind(String mem_name , String mobile){
		
		Connection conn = null;
		Map<String,String> map = null;
		try {
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mem_name);
			bind.add(mobile);
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map)qr.query(conn , MEMBER.id_find , rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return map.get("mem_id");
	}

	/**
	 * 비번 찾기
	 * @return
	 */
	public String pwdFind(String mem_id , String mobile){
		
		Map<String,String> map = null;
		Connection conn = null;
		
		try {
			
			String[] bind = {mem_id , mobile};
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map)qr.query(conn , MEMBER.pwd_find , rsh , bind);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return map.get("mem_pwd");
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
			
			Map<String,Object> map = (Map)qr.query(conn , MEMBER.dup_id , rsh , bind);
			
			int cnt = NumberUtils.toInt(map.get("cnt")+"");
			
			if(cnt > 0) isDuplicate = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return isDuplicate;
	}
	
	public boolean isJumin(String mem_jumin){
		
		boolean isDuplicate = false;
		
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			String[] bind = {mem_jumin};
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			Map<String,Long> map = (Map)qr.query(conn , MEMBER.dup_jumin , rsh , bind);
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
			
			String[] bind = {mem_id};
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
	
	public void logonHist(String mem_id , String log_type){
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			String[] bind = {mem_id , log_type};
			QueryRunner qr = new QueryRunner();
			qr.update(conn , MEMBER.logon_hist , bind);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * SMS 회원 리스트
	 * @param params
	 * @return
	 */
	public List<MemberDto> getMemSubList(Map<String,String> params){
		
		List<MemberDto> list = null;
		Connection conn = null;
		
		int npage = NumberUtils.toInt(params.get("npage"), 1);
		String field = StringUtils.trimToEmpty(params.get("field"));
		String keyword = StringUtils.trimToEmpty(params.get("keyword"));
		String region = StringUtils.trimToEmpty(params.get("region"));
		String reserve = StringUtils.trimToEmpty(params.get("keyword"));
		
		int per_page = NumberUtils.toInt(StringUtils.defaultIfEmpty(params.get("per_page"), MEMBER.per_page+""));
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			ResultSetHandler rsh = new BeanListHandler(MemberDto.class);
			QueryRunner qr = new QueryRunner();
			
			String where1 = "";
			
			//검색조건
			String where2 = "";
			if("name".equals(field) && keyword.length() > 0){
				where2 = " where mem_name LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("id".equals(field) && keyword.length() > 0){
				where2 = " where mem_id LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("mobile".equals(field) && keyword.length() > 0){
				where2 = " where mem_mtel LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			
			//페이징
			bind.add(((npage-1)* per_page));
			bind.add((npage*per_page));
			
			list = (List<MemberDto>) qr.query(conn , MessageFormat.format(MEMBER.mem_sub_list,where1,where2) , rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
	
	public int getMemSubTotal(Map<String,String> params){
		
		Connection conn = null;
		Map<String, Long> map = null;
		
		String field = StringUtils.defaultIfEmpty(params.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty(params.get("keyword"), "");
		
		
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where2 = "";
			if("name".equals(field) && keyword.length() > 0){
				where2 = " where mem_name like concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("id".equals(field) && keyword.length() > 0){
				where2 = " where mem_id like concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("mobile".equals(field) && keyword.length() > 0){
				where2 = " where mem_mtel like concat('%',?,'%') " ;
				bind.add(keyword);
			}
			
			map = (Map<String, Long>) qr.query(conn , MessageFormat.format(MEMBER.mem_total,where2) , rsh , bind.toArray());
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return NumberUtils.toInt(map.get("total")+"");
	}
	
	public List<MemberDto> getMemTelList(String memSeq){
		
		List<MemberDto> list = null;
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new BeanListHandler(MemberDto.class);
			QueryRunner qr = new QueryRunner();
			
			list = (List<MemberDto>) qr.query(conn , String.format(MEMBER.info_to_seq,memSeq) , rsh);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return list;
	}
}
