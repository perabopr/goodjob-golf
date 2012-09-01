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
	BoardDao dao = new BoardDao();
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , BBS.per_page );
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage",npage);
	params.put("field",field);
	params.put("keyword",keyword);
	
	List<BoardDto> bbsList = dao.getList("tb_faq_bbs" , params);
	
	int totalCount = dao.getTotalCount("tb_faq_bbs" , params);
	
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
	frm.action="faq_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="faq_list.jsp"
	frm.submit();
}

var faq_seq = "";
function show_faq(val){
	$('#faq_'+val).show();
	if(val != faq_seq)
		$('#faq_'+faq_seq).hide();
	faq_seq = val;
}
//-->
</script>
<table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="713"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">FAQ</td>
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
                <td align="center" width="591"><img src="../images/board/img_board_title_subject.gif" width="23" height="15" border="0" align="absmiddle"></td>
              </tr>
              <tr>
                <td height="1" colspan="3" bgcolor="#C8D290" width="666"></td>
              </tr>
            </table>
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		BoardDto dto;
		int count = totalCount - ((NumberUtils.toInt(npage)-1)* BBS.per_page);
		for(int i = 0 ; i < size ; i++){
			
			dto = bbsList.get(i);
			
%>
                                                             <table border="0" cellpadding="0" cellspacing="0" width="669">
                                                              <tr>
                                                                <td align="center" height="30" width="65"><%=count--%></td>
                                                                <td align="center" width="10"></td>
                                                                <td width="594"><a href="javascript:show_faq(<%=dto.getSeq()%>);" class=b_list><%=dto.getSubject()%></a></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="3" bgcolor="#E5E5E5" width="669"></td>
                                                              </tr>
                                                             </table>
                                                            <div id="faq_<%=dto.getSeq()%>" style="display:none;">
                                                            <table border="0" cellpadding="0" cellspacing="0" width="669">
                                                              <tr>
                                                                <td align="center" height="30" width="75">&nbsp;</td>
                                                                <td align="center" width="30" valign="top"  style="padding-top:8px;"><img src="/images/board/img_qna_arrow.gif" width="15" height="14" border="0"></td>
                                                                <td width="564" style="padding-top:10px;padding-bottom:10px;" class=b_list><%=StringUtils.trimToEmpty(dto.getContent())%></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="3" bgcolor="#E5E5E5" width="669"></td>
                                                              </tr>
                                                            </table>
                                                            </div>
<%
		}
	}
%>
           </td>
        </tr>
        <tr>
         <form name="frm" method="post">
		<input type="hidden" name="npage" value="<%=npage%>"/>
          <td align="center" style="padding-top: 30px;padding-bottom: 50px;">
          <table border="0" cellpadding="0" cellspacing="0" width="230">
                                                              
			<tr>
           <td><select id="field" name="field" size="1">
               <option value="subject"<%=("subject".equals(field)?" selected":"")%>>제 목</option>
               <option value="content"<%=("content".equals(field)?" selected":"")%>>내 용</option>
             </select></td>
           <td><input id="keyword" name="keyword" value="<%=keyword%>" type="text" size="18" class="input_01"></td>
           <td><a href="javascript:on_search();"><img src="/images/board/bt_search.gif" border="0" width="50" height="19"></a></td>
         </tr></form>
		</table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- 하단 footer  -->
<%@ include file="/include/footer_nhcard.jsp" %>
<!-- 하단 footer  -->