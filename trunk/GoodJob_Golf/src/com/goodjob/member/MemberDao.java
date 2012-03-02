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
import org.apache.commons.lang.ObjectUtils;
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
				where = " where date_format(reg_dt,'%Y-%m-%d') = ? " ;
				bind.add(keyword);
			}
			else if("secession".equals(field)){
				where = " where secession = 'Y'" ;
			}
			else if("recomm".equals(field)){
				where = " where recommend like concat('%',?,'%') " ;
				bind.add(keyword);
			}
			
			//페이징
			bind.add(((npage-1)* MEMBER.per_page));
			bind.add(MEMBER.per_page);
			
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
			else if("mobile".equals(field) && keyword.length() > 0){
				where = " where mem_mtel = ? " ;
				bind.add(keyword);
			}
			else if("sms_yn".equals(field) && keyword.length() > 0){
				where = " where sms_yn = ? " ;
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
			
			map = (Map<String, Long>) qr.query(conn , MessageFormat.format(MEMBER.mem_total,where) , rsh , bind.toArray());
			
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
			bind.add(mDto.getRecommend());
			
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
			String pwd = StringUtils.trimToEmpty(mDto.getMem_pwd());
			
			QueryRunner qr = new QueryRunner();
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mDto.getMem_pwd());
			bind.add(mDto.getMem_mtel());
			bind.add(mDto.getSms_yn());
			bind.add(mDto.getEmail_yn());
			bind.add(mDto.getMem_id());
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
	public boolean memberSecession(String mem_id , String secession){
		Connection conn = null;
		boolean isUpdate = false;
		try {
			conn = DBManager.getConnection();
			String[] bind = {secession , mem_id};
			
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
		String mem_id = "";
		try {
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(mem_name);
			bind.add(mobile);
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map)qr.query(conn , MEMBER.id_find , rsh , bind.toArray());
			
			if(map != null) mem_id = map.get("mem_id");
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return mem_id;
	}

	/**
	 * 비번 찾기
	 * @return
	 */
	public String pwdFind(String mem_name , String mem_id){
		
		Map<String,String> map = null;
		Connection conn = null;
		String mem_pwd = "";
		try {
			
			String[] bind = {mem_name , mem_id};
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map)qr.query(conn , MEMBER.pwd_find , rsh , bind);
			
			if(map != null) mem_pwd = map.get("mem_pwd");
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return mem_pwd;
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
			long cnt = NumberUtils.toInt(map.get("cnt")+"");
			if(cnt > 0) isDuplicate = true;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return isDuplicate;
	}
	
	public boolean isMTel(String mem_mtel){
		
		boolean isDuplicate = false;
		
		Connection conn = null;
		
		try {
			conn = DBManager.getConnection();
			String[] bind = {mem_mtel};
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			Map<String,Long> map = (Map)qr.query(conn , MEMBER.dup_mtel , rsh , bind);
			long cnt = NumberUtils.toInt(map.get("cnt")+"");
			if(cnt > 0) isDuplicate = true;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return isDuplicate;
	}

	/**
	 * 추천아이디
	 * @param mem_id
	 * @return
	 */
	public String getRecommend(String mem_id){
		
		Map<String,String> map = null;
		Connection conn = null;
		String mem_pwd = "";
		try {
			
			String[] bind = {mem_id};
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			map = (Map)qr.query(conn , MEMBER.recommend , rsh , bind);
			
			if(map != null) mem_pwd = map.get("recommend");
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return mem_pwd;
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
	
	public MemberDto history(String mem_id){
		
		MemberDto mDto = null;
		Connection conn = null;
		
		try {
			
			String[] bind = {mem_id};
			conn = DBManager.getConnection();
			
			ResultSetHandler rsh = new BeanHandler(MemberDto.class);
			QueryRunner qr = new QueryRunner();
			
			mDto = (MemberDto)qr.query(conn , MEMBER.history_count , rsh , bind);
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return mDto;
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
			
			//검색조건
			String where = "";
			String having = "";
			if("name".equals(field) && keyword.length() > 0){
				where = " where a.mem_name LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("id".equals(field) && keyword.length() > 0){
				where = " where a.mem_id LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("mobile".equals(field) && keyword.length() > 0){
				where = " where a.mem_mtel LIKE concat('%',?,'%') " ;
				bind.add(keyword);
			}
			else if("reserve".equals(field) && keyword.length() > 0){
				having = " having count(reserve_uid) = ? " ;
				bind.add(keyword);
			}
			else if("sms_yn".equals(field) && keyword.length() > 0){
				where = " where a.sms_yn = ? " ;
				bind.add(keyword);
			}
			//페이징
			bind.add(((npage-1)* per_page));
			bind.add(per_page);
			
			//System.out.println(MessageFormat.format(MEMBER.mem_sub_list,where,having));
			
			list = (List<MemberDto>) qr.query(conn , MessageFormat.format(MEMBER.mem_sub_list,where,having) , rsh , bind.toArray());
			
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
		
		int total = 0;
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			ResultSetHandler rsh = new MapHandler();
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("reserve".equals(field) && keyword.length() > 0){
				bind.add(keyword);
				map = (Map<String, Long>) qr.query(conn , MEMBER.mem_sub_total2 , rsh , bind.toArray());
				total = NumberUtils.toInt(map.get("total")+"");
			}
			else{
				
				if("name".equals(field) && keyword.length() > 0){
					where = " where a.mem_name like concat('%',?,'%') " ;
					bind.add(keyword);
				}
				else if("id".equals(field) && keyword.length() > 0){
					where = " where a.mem_id like concat('%',?,'%') " ;
					bind.add(keyword);
				}
				else if("mobile".equals(field) && keyword.length() > 0){
					where = " where a.mem_mtel like concat('%',?,'%') " ;
					bind.add(keyword);
				}
				else if("sms_yn".equals(field) && keyword.length() > 0){
					where = " where a.sms_yn = ? " ;
					bind.add(keyword);
				}
				
				map = (Map<String, Long>) qr.query(conn , MessageFormat.format(MEMBER.mem_sub_total,where) , rsh , bind.toArray());
				if(map == null)
					total = 0;
				else
					total = NumberUtils.toInt(map.get("total")+"");
			}
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}

		return total;
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
	
	/**
	 * 인증
	 * @param params
	 */
	public boolean auth(Map<String,String> params){
		
		boolean isSend = false;
		Connection conn = null;
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(params.get("email"));
			bind.add(params.get("auth_no"));
			
			QueryRunner qr = new QueryRunner();
			qr.update(conn, MEMBER.auth , bind.toArray());
			
			isSend = true;

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return isSend;
	}
	
	/**
	 * 인증체크
	 * @param params
	 * @return 0 : 인증 성공  , 1 : 일치하는 인증값 없음 , 2 : 인증번호 시간 초과 
	 */
	public int authCheck(Map<String,String> params){
		
		int check = 0;
		Connection conn = null;
		Map<String,Object> result = null;
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(params.get("auth_no"));
			bind.add(params.get("email"));
			
			QueryRunner qr = new QueryRunner();
			ResultSetHandler rsh = new MapHandler();
			
			result = (Map)qr.query(conn, MEMBER.check , rsh , bind.toArray());
			
			if(result == null){
				check = 1;
			}
			else{
				int diff = NumberUtils.toInt(ObjectUtils.toString(result.get("diff")));
				//sms 발송후 10분
				if(diff > 1000){
					check = 2;
				}
				else{
					qr.update(conn, MEMBER.auth_update ,params.get("email"));
				}
			}
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return check;
	}
}
