<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	BoardDao dao = new BoardDao();
	 
	String seq = StringUtils.trimToEmpty(request.getParameter("seq"));
	String thread = StringUtils.trimToEmpty(request.getParameter("thread"));
	String npage = StringUtils.trimToEmpty(request.getParameter("npage"));
	
	BoardDto dto = dao.getView("tb_faq_bbs" , NumberUtils.toInt(seq,0));
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->
<script language="javascript" type="text/javascript">
	function board_del(seq){

		$.ajax({
			type: "POST",
			url: "/_admin/board/board_delete_ajax.jsp",
			data: "tname=faq&seq="+seq,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("글이 정상적으로 삭제 되었습니다.");
					location.href="./faq_list.jsp";
				}
				else{
					alert("글삭제시 오류 발생!");
				}
		}});
}
</script>
					<!--############### 중앙 컨텐츠 영역 #################-->
					<table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/">HOME</a> &gt; <span class=location_b>자주묻는 질문(FAQ)</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">자주묻는 질문(FAQ)</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                          <td background="../../images/board/img_main_title_bg.gif" height="31">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" width="114"><img src="../../images/board/img_subject.gif" width="29" height="18" border="0" align="absmiddle"></td>
                                                                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td width="30">&nbsp;</td>
                                                                <td width="524" class=normal_b><%=StringUtils.trimToEmpty(dto.getSubject())%></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" width="114"><img src="../../images/board/img_date.gif" width="29" height="18" border="0" align="absmiddle"></td>
                                                                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td width="30">&nbsp;</td>
                                                                <td width="524"><%=StringUtils.trimToEmpty(dto.getReg_dt())%></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" valign="top" width="114"><img src="../../images/board/img_contents.gif" width="29" height="18" border="0" align="absmiddle"></td>
                                                                <td align="center" valign="top" bgcolor="#D1D3D4" width="1"></td>
                                                                <td valign="top" width="30">&nbsp;</td>
                                                                <td width="524" height="350" valign="top"><%=StringUtils.trimToEmpty(dto.getContent())%></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td height="50"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td width="88">&nbsp;</td>
                                                                <td width="88">&nbsp;</td>
                                                                <td width="418">&nbsp;</td>
                                                                <td width="75" align="right"><a href="faq_list.jsp?npage=<%=npage%>"><img src="../../images/board/btn_list.gif" width="71" height="24" border="0"></a></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
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
