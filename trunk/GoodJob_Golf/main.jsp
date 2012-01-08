<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%
	
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->
<!--############### 중앙 컨텐츠 영역 #################-->

<table border="0" cellpadding="0" cellspacing="0" width="751">
  <tr>
    <td><table border="0" cellpadding="0" cellspacing="0" width="751">
        <tr>
          <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
              <tr>
                <td align="center" bgcolor="white" width="745" style="padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="730">
                    <tr>
                      <td bgcolor="white" align="center" colspan="3" height="235">
					  <script>
                     flashObject("/images/swf/main_visual.swf","","730","235")
					 </script></td>
                    </tr>
                    <tr>
                      <td bgcolor="white" colspan="3" height="10"></td>
                    </tr>
                    <tr>
                      <td width="360" align="center" bgcolor="white"><a href="/forGolfbooking/reserve.jsp?menu=1"><img src="images/common/btn_realtime_visual.jpg" width="360" height="170" border="0"></a></td>
                      <td width="10" bgcolor="white">&nbsp;</td>
                      <td width="360" align="center" bgcolor="white"><a href="/forGolfbooking/reserve.jsp?menu=2"><img src="images/common/btn_before_visual.jpg" width="360" height="170" border="0"></a></td>
                    </tr>
                    <tr>
                      <td colspan="3" bgcolor="white" height="10"></td>
                    </tr>
                    <tr>
                      <td width="360" align="center" bgcolor="white"><a href="forGolfbooking/reserve.jsp?menu=3"><img src="images/common/btn_package_visual.jpg" width="360" height="170" border="0"></a></td>
                      <td width="10" bgcolor="white">&nbsp;</td>
                      <td width="360" align="center" bgcolor="white"><a href="forGolfbooking/reserve.jsp?menu=5"><img src="images/common/btn_condo_visual.jpg" width="360" height="170" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><table border="0" cellpadding="0" cellspacing="0" width="751">
        <tr>
          <td width="343" valign="top"><!-- 공지사항 -->
            <jsp:include page="/board/main_notice_list.jsp" flush="true"/></td>
          <td width="15">&nbsp;</td>
          <td width="393" valign="top"><!-- 조인 커뮤니티 -->
            <jsp:include page="/board/main_join_list.jsp" flush="true"/></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- 하단  회사 소개 부분  -->
<%@ include file="/include/copyright.jsp" %>
<!-- 하단  회사 소개 부분  -->
<!--############### 중앙 컨텐츠 영역 #################-->
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
