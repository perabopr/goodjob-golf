<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.sql.BBS"%>
<%@include file="/include/loginCheck.jsp" %>
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
<%@ include file="/include/header.jsp" %>
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
                                                          <td background="../../images/board/img_main_title_bg.gif" height="31"><p>&nbsp;</p></td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="666">
                                                              <tr>
                                                                <td align="center" height="27" width="65"><img src="../../images/board/img_board_title_no.gif" align="absmiddle" width="22" height="15" border="0"></td>
                                                                <td align="center" width="10"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td align="center" width="591"><p><img src="../../images/board/img_board_title_subject.gif" width="23" height="15" border="0" align="absmiddle"></p></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="3" bgcolor="#C8D290" width="666"></td>
                                                              </tr>
                                                            </table>
                                                            
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		BoardDto dto;
		for(int i = 0 ; i < size ; i++){
			
			dto = bbsList.get(i);
			
%>
                                                             <table border="0" cellpadding="0" cellspacing="0" width="669">
                                                              <tr>
                                                                <td align="center" height="30" width="65"><%=dto.getSeq()%></td>
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
                                                          <td height="30"></td>
                                                        </tr>
                                                        <form name="frm" method="post">
              											<input type="hidden" name="npage" value="<%=npage%>"/>
                                                        <tr>
                                                          <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="230">
                                                              
                                                              <tr>
											                      <td><select id="field" name="field" size="1">
											                          <option value="subject"<%=("subject".equals(field)?" selected":"")%>>제 목</option>
											                          <option value="content"<%=("content".equals(field)?" selected":"")%>>내 용</option>
											                        </select></td>
											                      <td><input id="keyword" name="keyword" value="<%=keyword%>" type="text" size="18" class="input_01"></td>
											                      <td><a href="javascript:on_search();"><img src="/images/board/bt_search.gif" border="0" width="50" height="19"></a></td>
											                    </tr>                                         
                                                            </table></td>
                                                        </tr>
                                                        </form>
                                                        <tr>
                                                          <td height="40" align="center"><%=strPage%></td>
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
