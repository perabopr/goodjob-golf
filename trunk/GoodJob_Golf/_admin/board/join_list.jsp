<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.util.PageNavigater"%>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.sql.BBS"%>
<%
	//통합 게시판 
	BoardDao dao = new BoardDao();
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	
	String region = StringUtils.trimToEmpty(request.getParameter("region"));
	String sex = StringUtils.trimToEmpty(request.getParameter("sex"));
	String age = StringUtils.trimToEmpty(request.getParameter("age"));
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , BBS.per_page );
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage",npage);
	params.put("region",region);
	params.put("sex",sex);
	params.put("age",age);
	params.put("keyword",keyword);
	params.put("per_page",BBS.per_page+"");
	
	List<JoinBoardDto> bbsList = dao.getJoinList(params);
	
	int totalCount = dao.getJoinTotalCount(params);
	
	String strPage = paging.getPaging(totalCount, false);
	
	//RegionDao regionDao = new RegionDao();
	//List<RegionDto> arrRegions = regionDao.getRegionList("1");
	
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/_admin/css/style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript">
	
function on_search() {

	var frm = document.frm;
	if(!$('#keyword').val()) {
		alert('검색어를 입력하시기 바랍니다.');
		$('#keyword').focus();
		return;
	} 
	frm.action="faq_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="join_list.jsp"
	frm.submit();
}

function go_view(val){
	var frm = document.frm;
	frm.join_no.value=val;
	frm.action="join_view.jsp"
	frm.submit();
}
//-->
</script>
</head>
<body bgcolor="white">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ JOIN 커뮤니티 ★</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
<form name="frm" method="post">
<input type="hidden" name="npage" value="<%=npage%>"/>
<input type="hidden" name="join_no" value=""/>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="669">
        <tr>
          <td background="/images/board/img_main_title_bg2.gif" height="50" align="center"><img align="absmiddle" src="/_admin/images/board/img_join_text.gif" width="130" height="19" border="0">
            <select name="region" size="1">
              <option value="">선택하세요</option>
              <option value="1"<%=("1".equals(region)?" selected":"")%>>수도권</option>
              <option value="2"<%=("2".equals(region)?" selected":"")%>>강원권</option>
              <option value="3"<%=("3".equals(region)?" selected":"")%>>충청권</option>
              <option value="4"<%=("4".equals(region)?" selected":"")%>>전라권</option>
              <option value="5"<%=("5".equals(region)?" selected":"")%>>경상권</option>
              <option value="6"<%=("6".equals(region)?" selected":"")%>>제주권</option>
            </select>
            <select name="sex" size="1">
              <option value="">성별선택</option>
              <option value="M"<%=("M".equals(sex)?" selected":"")%>>남성</option>
              <option value="F"<%=("F".equals(sex)?" selected":"")%>>여성</option>
            </select>
            <select name="age" size="1">
             <option value="">연령선택</option>
             <option value="20"<%=("20".equals(age)?" selected":"")%>>20대</option>
             <option value="30"<%=("30".equals(age)?" selected":"")%>>30대</option>
             <option value="40"<%=("40".equals(age)?" selected":"")%>>40대</option>
             <option value="50"<%=("50".equals(age)?" selected":"")%>>50대</option>
             <option value="60"<%=("60".equals(age)?" selected":"")%>>60대</option>
            </select>
            <input class="input_01" type="text" size="20" name="day">
            <input name="imagefield" type="image" src="/_admin/images/board/bt_search.gif" border="0" width="43" height="19" align="absmiddle"></td>
        </tr>
</form>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="666">
              <tr>
                <td align="center" height="27" width="36"><img src="/images/board/img_board_title_no.gif" align="absmiddle" width="22" height="15" border="0"></td>
                <td align="center" width="10"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td align="center" width="52"><img align="absmiddle" src="/_admin/images/board/img_board_title_day.gif" width="31" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="52" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_in.gif" width="31" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="173" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_field.gif" width="31" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="46" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_booking.gif" width="31" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="47" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_in2.gif" width="41" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="40" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_age2.gif" width="43" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="39" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_regist.gif" width="21" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td align="center" width="38"><img align="absmiddle" src="/_admin/images/board/img_board_title_hit.gif" width="21" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td align="center" width="53"><img align="absmiddle" src="/_admin/images/board/img_board_title_process.gif" width="41" height="15" border="0"></td>
              </tr>
              <tr>
                <td height="1" colspan="19" bgcolor="#C8D290" width="666"></td>
              </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="669">
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		JoinBoardDto jDto;
		for(int i = 0 ; i < size ; i++){
			
			jDto = bbsList.get(i);
			
%>		  
				<tr>
                     <td align="center" height="30" width="41" class=normal_s><%=jDto.getJoin_no()%></td>
                	<td align="center" width="62" class=normal_s><%=jDto.getReg_dt()%></td>
                	<td width="62" align="center" class=normal_s><%=jDto.getJoin_name()%></td>
                <td width="183" align="center"><a href="javascript:go_view(<%=jDto.getJoin_no()%>);" class=board_list><%=jDto.getGolflink_name()%></a></td>
                <td width="57" align="center" class=normal_s><%=StringUtils.trimToEmpty(jDto.getRounding_dt()).substring(0,8)%></td>
                <td width="56" align="center" class=normal_s><%=jDto.getJoin_person()%>명</td>
                <td width="51" align="center" class=normal_s><%=jDto.getAge()%>대</td>
                <td width="49" align="center" class=normal_s><%=jDto.getApply_count()%>건</td>
                <td align="center" width="48" class=normal_s><%=jDto.getReadcount()%></td>
                <td align="center" width="60" class=blue_s><%=("I".equals(StringUtils.trimToEmpty(jDto.getJoin_status())) ? "진행중" : "완료")%></td>
                </tr>
                <tr>
                	<td height="1" colspan="10" bgcolor="#E5E5E5"></td>
              	</tr>
<%
		}
	}
%>
            </table></td>
        </tr>
        <tr>
          <td height="50" align="right" style="padding-right:20px;"><a href="join_write.jsp"><img src="/_admin/images/board/btn_write.gif" width="71" height="24" border="0" alt="글쓰기"></a></td>
        </tr>
        <tr>
          <td align="center"><p><%=strPage%></p></td>
        </tr>
        <tr>
          <td align="center"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td></td>
  </tr>
</table>
</body>
</html>