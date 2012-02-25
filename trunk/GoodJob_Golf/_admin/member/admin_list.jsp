<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.member.*"%>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.sql.MEMBER"%>
<%
	
	AdminDao aDao = new AdminDao();
	
	List<AdminDto> aList = aDao.getAdminList();
	
%>
<html>
<head>
<link rel="stylesheet" href="/_admin/style.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript">
	
	function admin_add(){

		var id = $('#aid').val();
		var pwd = $('#pwd').val();
		var name = $('#name').val();
		var type = $('#type').val();
		
		$.ajax({
			type: "POST",
			url: "/_admin/member/admin_update.jsp",
			data: "mode=insert&id="+id+"&pwd="+pwd+"&name="+name+"&type="+type,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("등록");
					location.href="./admin_list.jsp";
				}
				else{
					alert("오류 발생!");
				}
		}});
	}

	function admin_update(seq){

		var id = document.getElementsByName("admin_id")[seq].value;
		var pwd = document.getElementsByName("admin_pwd")[seq].value;
		var name = document.getElementsByName("admin_name")[seq].value;

		$.ajax({
			type: "POST",
			url: "/_admin/member/admin_update.jsp",
			data: "mode=update&id="+id+"&pwd="+pwd+"&name="+name+"&type="+type,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("수정");
					location.href="./admin_list.jsp";
				}
				else{
					alert("오류 발생!");
				}
		}});
	}

	function admin_del(admin_id){
		
		$.ajax({
			type: "POST",
			url: "/_admin/member/admin_update.jsp",
			data: "mode=del&id="+admin_id,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("삭제");
					location.href="./admin_list.jsp";
				}
				else{
					alert("오류 발생!");
				}
		}});
	}
</script>
<title></title>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 어드민 ★</td>
  </tr>
  <tr>
    <td align="center" width="600">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" width="800">
    
    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr height="25">
          <td bgcolor="#e6e7e8" align="center" width="200"><span class=normal_b>아이디</span></td>
          <td width="200" align="center" bgcolor="#E6E7E8"><span class=normal_b>비밀번호</span></td>
          <td bgcolor="#e6e7e8" align="center" width="200"><span class=normal_b>이름</td>
          <td bgcolor="#e6e7e8" align="center" width="200"><span class=normal_b>관리자 구분</td>
        </tr>

        <tr>
          <td bgcolor="white" align="center" height="25"><input type="text" style="height:27px;" name="aid" id="aid" value=""/></td>
          <td bgcolor="white" align="center" height="25"><input type="text" style="height:27px;" name="pwd" id="pwd" value=""/></td>
          <td bgcolor="white" align="center" height="25"><input type="text" style="height:27px;" name="name" id="name" value=""/></td>
          <td bgcolor="white" align="center" height="25">
          <select name="type" id="type">
          <option value="0">관리자</option>
          <option value="1">게스트</option>
          </select>
		  </td>
        </tr>

		<tr>
          <td bgcolor="white" colspan="4" align="center" height="25">
          <input type="button" value=" 등 록 " onclick="admin_add();"/>
          </td>
        </tr>
      </table>
      <div style="height:50px;"></div>
    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr height="25">
          <td bgcolor="#e6e7e8" align="center" width="200"><span class=normal_b>아이디</span></td>
          <td width="200" align="center" bgcolor="#E6E7E8"><span class=normal_b>비밀번호</span></td>
          <td bgcolor="#e6e7e8" align="center" width="200"><span class=normal_b>이름</td>
          <td bgcolor="#e6e7e8" align="center" width="200"><span class=normal_b>기타</td>
        </tr>
<%
	int mSize = aList.size();
	AdminDto aDto;
	for(int i = 0 ; i < mSize ; i++){ 
		aDto = aList.get(i);
%>
        <tr>
          <td bgcolor="white" align="center" height="25"><input type="text" style="height:27px;" name="admin_id" id="admin_id" value="<%=aDto.getAdmin_id()%>"/></td>
          <td bgcolor="white" align="center" height="25"><input type="text" style="height:27px;" name="admin_pwd" id="admin_pwd" value="<%=aDto.getAdmin_pwd()%>"/></td>
          <td bgcolor="white" align="center" height="25"><input type="text" style="height:27px;" name="admin_name" id="admin_name" value="<%=aDto.getAdmin_name()%>"/></td>
          <td bgcolor="white" align="center" height="25">
          <input type="button" value=" 수 정 " onclick="admin_update(<%=i%>);"/>&nbsp;
          <input type="button" value=" 삭 제 " onclick="admin_del('<%=aDto.getAdmin_id()%>');"/>
          </td>
        </tr>
<%
	}
%>
      </table>
     </td>
  </tr>
</table>
</body>
</html>