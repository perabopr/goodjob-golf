<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.sql.BBS"%>
<%
	//통합 게시판 
	BoardDao bDao = new BoardDao();
	
	int per_page = 10;
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , per_page );
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("per_page",per_page+"");
	params.put("npage",npage);
	params.put("field",field);
	params.put("keyword",keyword);
	params.put("site_seq","3");
	
	List<BoardDto> bbsList = bDao.getList("tb_notice_bbs" , params);
	
	int totalCount = bDao.getTotalCount("tb_notice_bbs" , params);
	
	String strPage = paging.getPaging(totalCount, false);
%>
<!-- 상단 영역 -->
<%@ include file="/include/header_nhcard.jsp" %>
<!-- 상단 영역 -->
<!-- 상단 영역 -->
<script language="javascript" type="text/javascript">
	
function on_search() {

	var frm = document.frm;
	if(!$('#keyword').val()) {
		alert('검색어를 입력하시기 바랍니다.');
		$('#keyword').focus();
		return;
	} 
	frm.action="notice_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="notice_list.jsp"
	frm.submit();
}
//-->
</script>
<table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="713"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">공지사항</td>
          <td width="50%" height="25" bgcolor="#DCDDDE" style="padding-top:4px; padding-right: 10px;" align="right"><a href="default.jsp"><img align="absmiddle" src="../img_nhcard/common/btn_home.gif" width="60" height="19" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="669">
        <tr>
          <td background="../images/board/img_main_title_bg.gif" height="31"><p>&nbsp;</p></td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="666">
              <tr>
                <td align="center" height="27" width="65"><img src="../images/board/img_board_title_no.gif" align="absmiddle" width="22" height="15" border="0"></td>
                <td align="center" width="10"><img src="../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td align="center" width="450"><img src="../images/board/img_board_title_subject.gif" width="23" height="15" border="0" align="absmiddle"></td>
                <td align="center" width="10"><img src="../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td align="center" width="131"><img src="../images/board/img_board_title_date.gif" width="21" height="15" border="0" align="absmiddle"></td>
              </tr>
              <tr>
                <td height="1" colspan="5" bgcolor="#C8D290" width="666"></td>
              </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="669">
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		BoardDto dto;
		int count = totalCount - ((NumberUtils.toInt(npage)-1)* per_page);
		for(int i = 0 ; i < size ; i++){
			
			dto = bbsList.get(i);
			
%>
               <tr>
                 <td align="center" height="30" width="65"><%=count--%></td>
                 <td align="center" width="10"></td>
                 <td width="450"><a href="./notice_view.jsp?seq=<%=dto.getSeq()%>" class=b_list><%=dto.getSubject()%></a>
                 <%if(dto.getReg_term()<=3){ %>
                 <img align="absmiddle" src="../images/board/icon_new.gif" width="10" height="9" border="0">
                 <%}%>
                 </td>
                 <td align="center" width="11"></td>
                 <td align="center" width="133"><%=dto.getReg_dt()%></td>
               </tr>
               <tr>
                 <td height="1" colspan="5" bgcolor="#E5E5E5" width="669"></td>
               </tr>
<%
		}
	}
%>            
            </table></td>
        </tr>
        <form name="frm" method="post">
		<input type="hidden" name="npage" value="<%=npage%>"/>
         <tr>
           <td height="30"></td>
         </tr>
         <tr>
           <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="668">
               <tr>
                 <td width="420"><p><%=strPage%></p></td>
                          <td align="right" width="248"><table border="0" cellpadding="0" cellspacing="0" width="230">
                              <tr>
                                <td>
                                  <select id="field" name="field" size="1">
									<option value="subject"<%=("subject".equals(field)?" selected":"")%>>제 목</option>
									<option value="content"<%=("content".equals(field)?" selected":"")%>>내 용</option>
									</select>
                                    </td>
                                  <td><input class="input_01" type="text" size="18" id="keyword" name="keyword" value="<%=keyword%>"></td>
                       <td><a href="javascript:on_search();"><img src="/images/board/bt_search.gif" border="0" width="50" height="19"></a></td>
                     </tr>
                   </table></td>
               </tr>
             </table></td>
         </tr>
         </form>
        <tr>
          <td height="250" align="center"></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- 하단 footer  -->
<%@ include file="/include/footer_nhcard.jsp" %>
<!-- 하단 footer  -->