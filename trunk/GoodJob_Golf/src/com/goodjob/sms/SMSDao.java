/**
 * 
 */
package com.goodjob.sms;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.dom4j.tree.BaseElement;

import com.goodjob.board.BoardDto;
import com.goodjob.db.DBManager;
import com.goodjob.sql.BBS;
import com.goodjob.sql.SMS;
import com.goodjob.util.Utils;

/**
 * @author gundallove@gmail.com
 *
 */
public class SMSDao {
	
	private String charsetType = "UTF-8"; //EUC-KR 또는 UTF-8
	
	private final int port = 80;
	private final String sms_url = "http://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
	private final String strId = "savekorea2400";		// SMS아이디
	private final String strAuthKey = "90c3ee898f3fa17524d98bb0ab1bccda";	//인증키
	
	public boolean send(Map<String,String> params) {
		
		//헤더 전송
	    BufferedWriter wr = null;
	    //결과값 얻기
	    BufferedReader rd = null;
	    
	    boolean isResult = false;
		try{
			/*--------------------- 필수 값 -------------------*/
		    String user_id 		= base64Encode(strId); 
		    String secure 		= base64Encode(strAuthKey);
		    String msg 			= base64Encode(StringUtils.defaultString(params.get("msg"), ""));
		    String rphone 		= base64Encode(StringUtils.defaultString(params.get("rphone"), ""));
		    
		    String sphone 		= StringUtils.defaultString(params.get("sphone"), "");
		    String[] phoneArr = sphone.split("-");
		    phoneArr[0] = base64Encode(phoneArr[0]);
		    phoneArr[1] = base64Encode(phoneArr[1]);
		    phoneArr[2] = base64Encode(phoneArr[2]);
		    
		    String rdate 		= base64Encode(StringUtils.defaultString(params.get("rdate"), ""));
		    String rtime 		= base64Encode(StringUtils.defaultString(params.get("rtime"), ""));
		    /*--------------------- 필수 값 -------------------*/
		    
		    
		    
		    String mode 		= base64Encode("1");
		    String testflag 	= base64Encode(StringUtils.defaultString(params.get("testflag"), ""));
		    String destination 	= base64Encode(StringUtils.defaultString(params.get("destination"), ""));
		    String repeatFlag 	= base64Encode(StringUtils.defaultString(params.get("repeatFlag"), ""));
		    String repeatNum 	= base64Encode(StringUtils.defaultString(params.get("repeatNum"), ""));
		    String repeatTime 	= base64Encode(StringUtils.defaultString(params.get("repeatTime"), ""));
		    
		    String[] host_info = sms_url.split("/");
		    String host = host_info[2];
		    String path = "/" + host_info[3];
	
		    // 데이터 맵핑 변수 정의
		    String arrKey[] = {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
		                       ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime"};
		    
		    String valKey[]= {user_id,secure,msg,rphone,phoneArr[0],phoneArr[1],phoneArr[2],rdate,rtime,mode
		    				,testflag,destination,repeatFlag,repeatNum,repeatTime};
		    
	    
		    String boundary = "";
		    Random random = new Random(); 
		    String rndKey = random.nextInt(32000)+"";
		    MessageDigest md = MessageDigest.getInstance("MD5");    
		    byte[] bytData = rndKey.getBytes();
		    md.update(bytData);
		    
		    byte[] digest = md.digest();
		    for(int i =0;i<digest.length;i++)
		    {
		        boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
		    }
		    boundary = "---------------------"+boundary.substring(0,10);
	
		    // 본문 생성
		    StringBuffer data = new StringBuffer();
		    for (int i=0;i<arrKey.length; i++)
		    {  
		        data.append("--"+boundary+"\r\n");
		        data.append("Content-Disposition: form-data; name=\""+arrKey[i]+"\"\r\n");
		        data.append("\r\n"+valKey[i]+"\r\n");
		        data.append("--"+boundary+"\r\n");
		    }
		    
		    InetAddress addr = InetAddress.getByName(host);
		    Socket socket = new Socket(host, port);
		    
		    // 헤더 전송
		    wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
		    wr.write("POST "+path+" HTTP/1.0\r\n");
		    wr.write("Content-Length: "+data.length()+"\r\n");
		    wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
		    wr.write("\r\n");
		   
		    // 데이터 전송
		    wr.write(data.toString());
		    wr.flush();
		   
		    // 결과값 얻기
		    rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
		    String line;
		    StringBuffer temp = new StringBuffer();
		    ArrayList<String> tmpArr = new ArrayList<String>(); 
		    while ((line = rd.readLine()) != null) {
		        tmpArr.add(line);
		        temp.append(line + "\n");
		    }
	
		    System.out.println(temp.toString());
		    
		    
		    String tmpMsg = tmpArr.get(tmpArr.size()-1);
		    String[] rMsg = tmpMsg.split(",");
		    String result= rMsg[0]; //발송결과
		    
		    System.out.println("result : "+ result);
		    
		    if("success".equals(result)){
		    	//발송 성공시 로그저장
		    	this.log(params);
		    	isResult = true;
		    }
		    
	    } catch(Exception e){
	    	e.printStackTrace();
	    }
	    finally{
	    	try{wr.close();}catch(Exception e){}
	    	try{rd.close();}catch(Exception e){}
	    }
	    return isResult;
	}
	
	public void log(Map<String,String> params){
		
		Connection conn = null;
		try {
			conn = DBManager.getConnection();
			ArrayList<Object> bind = new ArrayList<Object>();
			
			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, "" , bind.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 
	 * @param params
	 * @return
	 */
	public List<SMSDto> list(Map<String,String> params){
		
		
		
		List<SMSDto> list = null;
		Connection conn = null;
		
		String field = StringUtils.defaultIfEmpty((String)params.get("field"), "");
		String keyword = StringUtils.defaultIfEmpty((String)params.get("keyword"), "");
		int npage = NumberUtils.toInt((String)params.get("npage"), 1);
		
		try {
			conn = DBManager.getConnection();

			ArrayList<Object> bind = new ArrayList<Object>();
			
			ResultSetHandler rsh = new BeanListHandler(SMSDto.class);
			QueryRunner qr = new QueryRunner();
			
			//검색조건
			String where = "";
			if("id".equals(field)){
				where = " WHERE mem_id = ? " ;
				bind.add(keyword);
			}
			
			//페이징
			bind.add(((npage-1)* SMS.per_page));
			bind.add((npage*SMS.per_page));
			
			list = (List<SMSDto>) qr.query(conn , String.format(SMS.list, where), rsh , bind.toArray());
			
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
	public void auth(Map<String,Object> params){
		
		Connection conn = null;
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(params.get("auth_no"));
			bind.add(params.get("tel_no"));
			
			QueryRunner queryRunner = new QueryRunner();
			queryRunner.update(conn, SMS.auth , bind.toArray());

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * 인증체크
	 * @param params
	 * @return 0 : 인증 성공  , 1 : 일치하는 인증값 없음 , 2 : 인증번호 시간 초과 
	 */
	public int check(Map<String,Object> params){
		
		int check = 0;
		Connection conn = null;
		Map<String,Object> result = null;
		try {
			conn = DBManager.getConnection();
			
			ArrayList<Object> bind = new ArrayList<Object>();
			bind.add(params.get("auth_no"));
			bind.add(params.get("tel_no"));
			
			QueryRunner queryRunner = new QueryRunner();
			ResultSetHandler rsh = new MapHandler();
			
			result = (Map)queryRunner.query(conn, SMS.check , rsh , bind.toArray());
			
			if(result == null){
				check = 1;
			}
			else{
				int diff = NumberUtils.toInt(ObjectUtils.toString(result.get("diff")));
				//sms 발송후 5분
				if(diff >= 300){
					check = 2;
				}
			}
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		return check;
	}
	
	 /**
	 * BASE64 Encoder
	 * @param str
	 * @return
	 */
	public String base64Encode(String str)  throws java.io.IOException {
		sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
		byte[] strByte = str.getBytes();
	    String result = encoder.encode(strByte);
	    return result ;
	}

	/**
	 * BASE64 Decoder
	 * @param str
	 * @return
	 */
	public String base64Decode(String str) throws java.io.IOException {
	    sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
	    byte[] strByte = decoder.decodeBuffer(str);
	    String result = new String(strByte);
	    return result ;
	}
	
	public static void main(String[] a){
		
		SMSDao dao = new SMSDao();
		
		/*
		 String msg 			= base64Encode(StringUtils.defaultString(params.get("msg"), ""));
		    String rphone 		= base64Encode(StringUtils.defaultString(params.get("rphone"), ""));
		    String sphone 		= base64Encode(StringUtils.defaultString(params.get("sphone"), ""));
		    String rdate 		= base64Encode(StringUtils.defaultString(params.get("rdate"), ""));
		    String rtime 		= base64Encode(StringUtils.defaultString(params.get("rtime"), ""));
		 */
		Map<String,String> params = new HashMap<String, String>();
		params.put("msg","SMS 테스트~~~");
		params.put("rphone","010-8638-3389");
		params.put("sphone","010-8638-3389");
		//params.put("rdate",Utils.getDate("yyyyMMdd"));
		//params.put("rtime",Utils.getDate("HHmm")+"00");
		
		dao.send(params);
		
	}
}
