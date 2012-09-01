<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ 
page import="org.apache.commons.lang.StringUtils"%><%@ 
page import="org.apache.commons.lang.math.NumberUtils"%><%@ 
page import="java.util.*" %><%@ 
page import="com.goodjob.board.*" %><%@ 
page import="com.goodjob.sql.BBS"%><%@
page import="com.goodjob.util.Utils"%><%
	//통합 게시판 
	BoardDao bDao = new BoardDao();
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage","1");
	params.put("per_page","5");
	
	List<BoardDto> bbsList = bDao.getList("tb_notice_bbs" , params);
	
%>
<table border="0" cellpadding="0" cellspacing="0" width="330">
     <tr>
       <td align="center">
       	<table cellpadding="0" cellspacing="0" width="330">
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		BoardDto dto;
		for(int i = 0 ; i < size ; i++){
			
			dto = bbsList.get(i);
			
%>
           <tr>
             <td width="260" height="25"><a href="./notice_view.jsp?seq=<%=dto.getSeq()%>"><%=Utils.getCutstring(dto.getSubject(),25," ...")%></a> 
             <%if(dto.getReg_term()<=3){ %>
             <img align="absmiddle" src="../images/board/icon_new.gif" width="10" height="9" border="0">
             <%}%>
             </td>
             <td width=70" align="right" class=board_date><%=StringUtils.trimToEmpty(dto.getReg_dt()).replaceAll("-",".")%></td>
           </tr>
           <tr>
             <td colspan="2"><img src="../img_nhcard/img_main/img_board_dot.gif" width="330" height="1" border="0"></td>
           </tr>
<%
		}
	}
%>
         </table>
       </td>
     </tr>
   </table>