<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.member.*"%>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.sql.MEMBER"%>
<%
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"), "1");
	String field = StringUtils.defaultIfEmpty(request.getParameter("field"), "");
	String keyword = StringUtils.defaultIfEmpty(request.getParameter("keyword"), "");

	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , MEMBER.per_page );
	
	MemberDao mDao = new MemberDao();
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage",npage);
	params.put("field",field);
	params.put("keyword",keyword);
	
	List<MemberDto> mList = mDao.getMemberList(params);
	
	int totalCount = mDao.getTotalMember(params);
	
	String strPage = paging.getPaging(totalCount, false);

%>
<html>
<head>
<link rel="stylesheet" href="/_admin/style.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<title></title>
<script language="javascript">
<!-- 
	function NewWindow(mypage, myname, w, h, scroll) { 
		var winl = (screen.width - w) / 2; 
		var wint = (screen.height - h) / 2; 
		winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' 
		win = window.open(mypage, myname, winprops) 
		if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } 
	} 

	function mem_type_update(index , id){

		var mem_type = document.getElementsByName("mem_type");

		var i = mem_type[index].options.selectedIndex;
		var selValue = mem_type[index].options[i].value;

		if(confirm("회원가입상태를 변경할까요?")){
			$.ajax({
				type: "POST",
				url: "/_admin/member/mem_update.jsp",
				data: "mem_type="+selValue+"&mem_id="+id,
				success: function(msg){
					if($.trim(msg) == '0'){
						alert("회원가입상태를 변경했습니다.");
						document.location.reload();
					}
					else{
						alert("회원가입상태 변경 실패!");
					}
			}});
		}
	}


	function on_search() {

		var frm = document.frm;
		/*
		if(!$('#keyword').val()) {
			alert('검색어를 입력하시기 바랍니다.');
			$('#keyword').focus();
			return;
		}*/
		frm.action="mem_list.jsp"
		frm.submit();
	}

	function goPage(val){
		var frm = document.frm;
		frm.npage.value=val;
		frm.action="mem_list.jsp"
		frm.submit();
	}

	function secession(mem_id , mem_name){
		if(confirm(mem_name + "회원 탈퇴 처리하시겠습니까?")){
			$.ajax({
				type: "POST",
				url: "/_admin/member/mem_update.jsp",
				data: "type=S&mem_id="+mem_id,
				success: function(msg){
					if($.trim(msg) == '0'){
						alert("회원 탈퇴 처리 완료");
						document.location.reload();
					}
					else{
						alert("회원 탈퇴 처리 실패!");
					}
			}});
		}
	}
	
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 회원가입현황 ★</td>
  </tr>
  <tr>
    <td align="center" width="1852">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" width="1852"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr>
          <td bgcolor="#e6e7e8" height="25" align="center" width="235"><span class=normal_b>회원가입일</span></td>
          <td bgcolor="#e6e7e8" align="center" width="241"><span class=normal_b>회원명</span></td>
          <td bgcolor="#e6e7e8" align="center" width="429"><span class=normal_b>아이디</span></td>
          <td width="280" align="center" bgcolor="#E6E7E8"><span class=normal_b>연락처</span></td>
          <td bgcolor="#e6e7e8" align="center" width="358"><span class=normal_b>회원가입상태</td>
          <td bgcolor="#e6e7e8" align="center" width="278"><span class=normal_b>기타기능</span></td>
        </tr>
<%
	int mSize = mList.size();

	MemberDto mDto;
	for(int i = 0 ; i < mSize ; i++){ 
		mDto = mList.get(i);
%>
        <tr>
          <td bgcolor="white" align="center" height="25"><%=mDto.getReg_dt()%></td>
          <td bgcolor="white">
          <%if("Y".equals(mDto.getSecession())){%>
          <div style="padding-left:20px;color:#CC0000;font-weight:bold;"><%=mDto.getMem_name()%> [탈퇴]</div>
          <%} else if("H".equals(mDto.getSecession())){%>
          <div style="padding-left:20px;color:#0066CC;font-weight:bold;"><%=mDto.getMem_name()%> [탈퇴요청]</div>
          <%}else{%>
          <div style="padding-left:20px;font-weight:bold;"><%=mDto.getMem_name()%></div>
          <%}%>
          </td>
          <td align="center" bgcolor="white"><%=mDto.getMem_id()%></td>
          <td align="center" bgcolor="white"><%=mDto.getMem_mtel()%></td>
          <td align="center" bgcolor="white">
          	<select id="mem_type" name="mem_type" size="1">
              <option value="F"<%if("F".equals(mDto.getMem_type())) out.println(" selected");%>>무료회원</option>
              <option value="1"<%if("1".equals(mDto.getMem_type())) out.println(" selected");%>>유료회원(1년)</option>
              <option value="2"<%if("2".equals(mDto.getMem_type())) out.println(" selected");%>>유료회원(2년)</option>
            </select>
            <a href=""></a><a href="javascript:mem_type_update(<%=i%>,'<%=mDto.getMem_id()%>');"><img align="absmiddle" src="/_admin/images/common/btn_save2.gif" onclick="" width="32" height="16" border="0"></a></td>
          <td align="center" bgcolor="white">
          <a href="mem_detail.jsp?mem_id=<%=mDto.getMem_id()%>" onClick="NewWindow(this.href,'name','760','600','yes');return false;">
          <img align="absmiddle" src="/_admin/images/common/btn_detail.gif" width="75" height="22" border="0"></a>
          &nbsp;
          <input type="button" value="회원탈퇴" class="input_box" onclick="secession('<%=mDto.getMem_id()%>','<%=mDto.getMem_name()%>');"/>
          </td>
        </tr>
<%
	}
%>
      </table></td>
  </tr>
<form name="frm" method="post">
<input type="hidden" name="npage" value=""/>
  <tr>
    <td align="center" style="padding-top:50px;padding-bottom:40px;"><table border="0" cellpadding="0" cellspacing="0" width="50%">
        <tr>
          <td align="center"><p><span class=normal_b><%=strPage%></span>
</p></td>
        </tr>
        <tr>
          <td height="4" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="4" align="center">
          <select name="field" size="1">
              <option value="">선택하세요</option>
              <option value="reg_dt"<%=("reg_dt".equals(field)?" selected":"")%>>가입일</option>
              <option value="name"<%=("name".equals(field)?" selected":"")%>>회원명</option>
              <option value="id"<%=("id".equals(field)?" selected":"")%>>아이디</option>
              <option value="type"<%=("type".equals(field)?" selected":"")%>>회원가입상태</option>
              <option value="secession"<%=("secession".equals(field)?" selected":"")%>>탈퇴요청</option>
            </select>
            <input id="keyword" name="keyword" value="<%=keyword%>" type="text" size="30" class="input_box">
           <a href="javascript:on_search();"><img src="../images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle"></a></td>
        </tr>
      </table></td>
  </tr>
</form>
</table>
</body>
</html>