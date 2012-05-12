<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%
	//통합 게시판 
	BoardDao dao = new BoardDao();
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage","1");
	params.put("per_page","5");
	
	List<JoinBoardDto> bbsList = dao.getJoinList(params);
	
%>
<table width="395" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" background="images/common/img_board_list_bg.gif" height="35"><table cellpadding="0" cellspacing="0" width="95%">
        <tr>
          <td width="70"><img src="images/common/img_join_title.gif" width="79" height="19" alt="이용후기"></td>
          <td width="306" align="right"><a href="/board/join_List.jsp"><img src="images/common/btn_more.gif" width="38" height="11"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center">
    
      <table cellpadding="0" cellspacing="0" width="377">
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		JoinBoardDto jDto;
		for(int i = 0 ; i < size ; i++){
			
			jDto = bbsList.get(i);
			
%>		  
        <tr>
           <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
           <td width="262"><a href="/board/join_view.jsp?join_seq=<%=jDto.getJoin_seq()%>" class=board_list><%=jDto.getGolflink_name()%></a> 
           <%if(jDto.getReg_term()<=3){ %>
            <img align="absmiddle" src="../../images/board/icon_new.gif" width="10" height="9" border="0">
            <%}%>
           </td>
           <td width="63" align="right"><span class=board_date><%=StringUtils.trimToEmpty(jDto.getReg_dt()).replaceAll("/",".")%></span></td>
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