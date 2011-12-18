<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.util.Utils" %>
<%!
	String getRegion(String str){
	 	if("1".equals(str)) return "수도권";
		else if("2".equals(str)) return "강원권";
		else if("3".equals(str)) return "충청권";
		else if("4".equals(str)) return "전라권";
		else if("5".equals(str)) return "경상권";
		else return "제주권";
	}	
%>
<%
	BoardDao dao = new BoardDao();

	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	String region = StringUtils.trimToEmpty(request.getParameter("region"));
	String sex = StringUtils.trimToEmpty(request.getParameter("sex"));
	String age = StringUtils.trimToEmpty(request.getParameter("age"));

	String join_no = StringUtils.trimToEmpty(request.getParameter("join_no"));
	String mode = StringUtils.trimToEmpty(request.getParameter("mode"));
	
	JoinBoardDto jDto = dao.getJoinView(NumberUtils.toInt(join_no,0));
	
	List<JoinBoardDto> cmtList = dao.getJoinCommentList(jDto.getJoin_no());

	Map<String,String> params = new HashMap<String,String>();
	params.put("npage","1");
	params.put("region",region);
	params.put("sex",sex);
	params.put("age",age);
	params.put("keyword",keyword);
	params.put("join_no",join_no);
	params.put("per_page","2");
	
	List<JoinBoardDto> bbsList = dao.getJoinList(params);
	
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/_admin/css/style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript">

	function join_end(no){

		<%if("E".equals(jDto.getJoin_status())){%>
		alert("이미 완료된 게시물 입니다.");
		return;
		<%}%>
		$.ajax({
			type: "POST",
			url: "/_admin/board/join_end.jsp",
			data: "join_no="+no,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("완료처리가 되었습니다.");
					document.location.reload();
				}
				else{
					alert("완료처리중 오류가 발생 했습니다. 잠시후 다시 시도해 주세요!");
				}
		}});
	}

	function comment_submit(){
		
		if(!$('#comment').val()) {
   			alert('댓글을 입력해 주세요.');
			$('#comment').focus();
			return;
		}
		var frm = document.cmtFrm;
		frm.target =  "ifr_hidden"; 
		frm.action = "join_comment_reg.jsp";
		frm.submit();
	}

	function go_list(){
		var frm = document.listFrm;
		frm.action = "join_list.jsp";
		frm.submit();
	}
	
	function board_del(join_no){

		$.ajax({
			type: "POST",
			url: "/_admin/board/board_delete_ajax.jsp",
			data: "tname=join&join_no="+join_no,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("글이 정상적으로 삭제 되었습니다.");
					location.href="./join_list.jsp";
				}
				else{
					alert("글삭제시 오류 발생!");
				}
		}});
	}
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
<form name="listFrm" method="post">
<input type="hidden" name="npage" value="<%=npage%>"/>
<input type="hidden" name="keyword" value="<%=keyword%>"/>
<input type="hidden" name="region" value="<%=region%>"/>
<input type="hidden" name="sex" value="<%=sex%>"/>
<input type="hidden" name="age" value="<%=age%>"/>
</form>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="669">
        <tr>
          <td background="/_admin/images/board/img_main_title_bg.gif" height="31" align="right">본 게시물은 <span class="blue">진행중</span>입니다 또는 본게시물은 <span class="orange">완료</span>되었습니다</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="109"><img align="absmiddle" src="/_admin/images/board/img_board_title_writer.gif" width="33" height="15" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="26">&nbsp;</td>
                <td width="150" class=blue><%=jDto.getJoin_name()%></td>
                <td width="109" align="center"><img src="/_admin/images/board/img_board_title_phone.gif" width="31" height="15" border="0"></td>
                <td width="1" bgcolor="#D1D3D4"></td>
                <td width="25">&nbsp;</td>
                <td width="246" class="normal_b"><%=jDto.getTel1()%>-<%=jDto.getTel2()%>-<%=jDto.getTel3()%></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="109" height="30"><img src="/_admin/images/board/img_board_title_area.gif" width="31" height="15" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="25">&nbsp;</td>
                <td width="151" class="normal_b"><%=getRegion(jDto.getRegion())%></td>
                <td width="109" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_cc.gif" width="42" height="15" border="0"></td>
                <td width="1" bgcolor="#D1D3D4"></td>
                <td width="25">&nbsp;</td>
                <td width="246"  class="blue"><%=jDto.getGolflink_name()%></td>
              </tr>
              <tr>
                <td width="109" height="30" align="center"><img src="/_admin/images/board/img_board_title_sex.gif" width="43" height="15" border="0"></td>
                <td width="1" height="22" align="center" bgcolor="#D1D3D4"></td>
                <td width="25" height="22">&nbsp;</td>
                <td width="151" height="22"  class="normal_b">
                <%
                	if("F".equals(jDto.getSex())) out.println("여성");
                	else if("M".equals(jDto.getSex())) out.println("남성");
                	else if("N".equals(jDto.getSex())) out.println("구분없음");
                %>
                </td>
                <td width="109" height="22" align="center"><img src="/_admin/images/board/img_board_title_age.gif" width="43" height="15" border="0"></td>
                <td width="1" height="22" bgcolor="#D1D3D4"></td>
                <td width="25" height="22">&nbsp;</td>
                <td width="246" height="22"  class="normal_b">
                <%
                	if(jDto.getAge()==0) out.println("구분없음");
                	else out.println(jDto.getAge()+"대");
                %>
                </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="109" height="30"><img src="/_admin/images/board/img_board_title_people.gif" width="43" height="15" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="25">&nbsp;</td>
                <td width="151"><span class=orange><%=jDto.getJoin_person()%> </span>명</td>
                <td width="109" align="center"><img src="/_admin/images/board/img_board_title_round.gif" width="52" height="15" border="0"></td>
                <td width="1" bgcolor="#D1D3D4"></td>
                <td width="25">&nbsp;</td>
                <td width="246" class="normal_b">
                <%
                	String[] rounding_dt = StringUtils.trimToEmpty(jDto.getRounding_dt()).split("/");
                	out.println(rounding_dt[1]+"월 "+rounding_dt[2]+"일 "+rounding_dt[3]+"시" + rounding_dt[4]+"분");
                %>
                </td>
              </tr>
              <tr>
                <td width="109" height="30" align="center"><img src="/_admin/images/board/img_board_title_price.gif" width="43" height="15" border="0"></td>
                <td width="1" height="22" align="center" bgcolor="#D1D3D4"></td>
                <td width="25" height="10">&nbsp;</td>
                <td width="532" height="30" colspan="5">그린피 : <span class=orange><%=Utils.numberFormat(NumberUtils.toInt(jDto.getPrice_info1()))%>원</span> / 카트비 : <span class=orange><%=Utils.numberFormat(NumberUtils.toInt(jDto.getPrice_info2()))%>원</span> / 캐디피 : <span class=orange><%=Utils.numberFormat(NumberUtils.toInt(jDto.getPrice_info3()))%>원</span></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" valign="top" width="109"><img src="/_admin/images/board/img_board_title_write.gif" width="43" height="15" border="0"></td>
                <td align="center" valign="top" bgcolor="#D1D3D4" width="1"></td>
                <td valign="top" width="25">&nbsp;</td>
                <td width="532" valign="top" height="150">
                <%=StringUtils.replace(jDto.getContent(),"\n","<br/>")%>
                </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="50" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td width="88"><a href="join_write.jsp?mode=modify&join_no=<%=jDto.getJoin_no()%>"><img src="/_admin/images/board/btn_edit.gif" width="71" height="24" border="0"></a></td>
                <td width="89"><a href="javascript:join_end(<%=jDto.getJoin_no()%>);"><img src="/_admin/images/board/btn_end.gif" width="71" height="24" border="0"></a></td>
                <td width="391"><a href="javascript:board_del(<%=jDto.getJoin_no()%>);"><img align="texttop" src="/_admin/images/board/btn_del.gif" width="71" height="24" border="0"></a></td>
                <td width="101" align="right"><a href="javascript:go_list();"><img src="/_admin/images/board/btn_list.gif" width="71" height="24" border="0" alt="목록"></a></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="666">
              <tr>
                <td height="2" width="666" colspan="7" bgcolor="#C8D290"></td>
              </tr>
              <tr>
                <td width="50" height="27" align="center"><img src="/_admin/images/board/img_board_title_no.gif" align="absmiddle" width="22" height="15" border="0"></td>
                <td width="10" height="27" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="410" height="27" align="center"><img align="absmiddle" src="/_admin/images/board/img_contents.gif" width="29" height="18" border="0"></td>
                <td width="10" height="27" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="80" height="27" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_writer.gif" width="33" height="15" border="0"></td>
                <td width="10" height="27" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="96" height="27" align="center"><p><img src="/_admin/images/board/img_board_title_date.gif" width="21" height="15" border="0"></p></td>
              </tr>
              <tr>
                <td height="1" colspan="7" bgcolor="#C8D290" width="666"></td>
              </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="666">

<%
	if(cmtList != null && !cmtList.isEmpty()){
		
		JoinBoardDto cmtDto = null;
		
		int size = cmtList.size();
		int list_no = size;
		for(int i = 0 ; i < size ; i++){
			
			cmtDto = cmtList.get(i);
%>
              <tr>
                <td align="center" height="27" width="50"><%=(list_no--)%></td>
                <td align="center" width="10"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="410"><%=cmtDto.getComment()%></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="80" align="center"><%=cmtDto.getCmt_name()%></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="96" align="center"><%=cmtDto.getReg_dt()%></td>
              </tr>
              <tr>
                <td height="1" colspan="7" bgcolor="#C8D290" width="666"></td>
              </tr>
<%
		}
	}
%>
            </table></td>
        </tr>
        <tr>
          <td height="40"></td>
        </tr>
        <tr>
          <td style="padding-left:133px;">골프장 JOIN커뮤니티에 참여를 원하시는 회원분께서는 댓글을 남겨주시기 바랍니다.</td>
        </tr>
        <form name="cmtFrm" method="post">
        <input type="hidden" name="join_no" value="<%=jDto.getJoin_no()%>"/>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="107"><img src="/_admin/images/board/img_board_reply.gif" width="60" height="30" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="25">&nbsp;</td>
                <td width="470" class=blue><textarea id="comment" name="comment" rows="4" cols="73" class="box03"></textarea></td>
                <td width="66" class="blue" align="right"><a href="javascript:comment_submit();"><img src="/_admin/images/board/btn_confirm.gif" width="60" height="60" border="0"></a></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="40"></td>
        </tr>
        </form>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="666">
              <tr>
                <td height="2" width="666" colspan="19" bgcolor="#C8D290"></td>
              </tr>
              <tr>
                <td width="36" align="center" height="27"><img src="/_admin/images/board/img_board_title_no.gif" align="absmiddle" width="22" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="52" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_day.gif" width="31" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="52" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_in.gif" width="31" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="173" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_field.gif" width="31" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="46" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_booking.gif" width="31" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="47" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_in2.gif" width="41" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="40" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_age2.gif" width="40" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="39" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_regist.gif" width="21" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="38" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_hit.gif" width="21" height="15" border="0"></td>
                <td width="10" align="center"><img src="/images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                <td width="53" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_process.gif" width="41" height="15" border="0"></td>
              </tr>
              <tr>
                <td height="1" colspan="19" bgcolor="#C8D290" width="666"></td>
              </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="669">
  <%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
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
          <td height="50">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td></td>
  </tr>
</table>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe> 
</body>
</html>