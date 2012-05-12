<%@page import="com.goodjob.util.Utils"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@page import="com.goodjob.sql.BBS"%>
<%
	//통합 게시판 
	BoardDao bDao = new BoardDao();
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage","1");
	params.put("per_page","5");
	
	List<BoardDto> bbsList = bDao.getList("tb_notice_bbs" , params);
	
%>
<table width="341" cellpadding="0" cellspacing="0">
     <tr>
       <td width="340" align="center" background="images/common/img_board_list_bg.gif" height="35"><table cellpadding="0" cellspacing="0" width="95%">
           <tr>
             <td width="69"><img src="images/common/img_notice_title.gif" width="69" height="19" alt="공지사항"></td>
             <td width="254" align="right"><a href="/board/notice_list.jsp"><img src="images/common/btn_more.gif" width="38" height="11"></a></td>
           </tr>
         </table></td>
     </tr>
     <tr>
       <td align="center">
       	<table cellpadding="0" cellspacing="0" width="325">
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		BoardDto dto;
		for(int i = 0 ; i < size ; i++){
			
			dto = bbsList.get(i);
			
%>
           <tr>
             <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
             <td width="262"><a href="/board/notice_view.jsp?seq=<%=dto.getSeq()%>" class=board_list><%=dto.getSubject()%></a> 
             <%if(dto.getReg_term()<=3){ %>
             <img align="absmiddle" src="../../images/board/icon_new.gif" width="10" height="9" border="0">
             <%}%>
             </td>
             <td width="63" align="right"><span class=board_date><%=StringUtils.trimToEmpty(dto.getReg_dt()).replaceAll("-",".")%></span></td>
           </tr>
           <tr>
             <td colspan="3" width="325"><img src="images/common/img_board_dot.gif" width="325" height="1"></td>
           </tr>
<%
		}
	}
%>
         </table>
       </td>
     </tr>
   </table>