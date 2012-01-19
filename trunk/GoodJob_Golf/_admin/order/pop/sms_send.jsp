<%@page import="com.goodjob.order.dto.CondoDto"%>
<%@page import="com.goodjob.order.CondoDao"%>
<%@page import="com.goodjob.order.dto.PackageDto"%>
<%@page import="com.goodjob.order.PackageDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.order.dto.GolfLinkDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.order.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.sms.SMSDao"%>
<%
String reservename = "";
String reservephone = "";
 
int menu = NumberUtils.toInt(request.getParameter("menu"),0);
int seq = NumberUtils.toInt(request.getParameter("seq"),0);
String msgtxt = new String((request.getParameter("msgtxt")).getBytes("8859_1"), "EUC-KR") ;
String msgtime = request.getParameter("msgtime").replace("-",".");
msgtime = msgtime.substring(5);

if(menu == 1 || menu == 2){
	GolfLinkDao glList = new GolfLinkDao();
	List<GolfLinkDto> list = glList.getGolfLinkReserve(seq);
	if(list != null && list.size() == 1){
		reservename = list.get(0).getReserve_name();
		reservephone = list.get(0).getReserve_phone();
	}
	else{
		out.print("<script>alert('잘못된 값입니다.');self.close();</script>");
		return;
	}
}

if(menu == 3){
	PackageDao pkList = new PackageDao();
	List<PackageDto> list = pkList.getPackageReserve(seq);
	if(list != null && list.size() == 1){
		reservename = list.get(0).getReserve_name();
		reservephone = list.get(0).getReserve_phone();
	}
	else{
		out.print("<script>alert('잘못된 값입니다.');self.close();</script>");
		return;
	}
}

if(menu == 5){
	CondoDao cdList = new CondoDao();
	List<CondoDto> list = cdList.getCondoReserve(seq);
	if(list != null && list.size() == 1){
		reservename = list.get(0).getReserve_name();
		reservephone = list.get(0).getReserve_phone();
	}
	else{
		out.print("<script>alert('잘못된 값입니다.');self.close();</script>");
		return;
	}
}

SMSDao sDao = new SMSDao();
%>
<html>
<head>
<link rel="stylesheet" href="/_admin/style.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript">

	var count = 80;
	function isMaxlength(field){
	
		var maxLimit = 80;
		temp_str = field.value;
		count = maxLimit - getByte_length(temp_str);
		if(count < 0){
			alert(maxLimit + "Bytes를 초과할 수 없습니다.");
			temp_str = temp_str.substring(0, temp_str.length-(count * -1 /2));
			field.value = temp_str;
			count = maxLimit - getByte_length(temp_str);
			field.focus();
		}

		$('#msg_byte').html(getByte_length(temp_str));
	}

	function getByte_length(str){
		var resultSize = 0;
		if(str == null){
			return 0;
		}
		
		for(var i=0; i<str.length; i++){
			var c = escape(str.charAt(i));
			if(c.length == 1){
				resultSize ++;
			}else if(c.indexOf("%u") != -1){
				resultSize += 2;
			}else if(c.indexOf("%") != -1){
				resultSize += c.length/3;
			}
		}
		return resultSize;
	}

	var menu = new Array(5);
	menu[0] = "[<%=msgtxt%>] <%=msgtime%> 예약되셨습니다.(굿잡골프)";
	menu[1] = "[<%=msgtxt%>] <%=msgtime%> 예약. 입금 확인되셨습니다.(굿잡골프)";
	menu[2] = "[<%=msgtxt%>] <%=msgtime%> (굿잡골프)	";
	menu[3] = "[<%=msgtxt%>] <%=msgtime%> 예약취소 되셨습니다.(굿잡골프)";
	menu[4] = "[<%=msgtxt%>] <%=msgtime%> 로 변경처리 되셨습니다.(굿잡골프)";
			
	function changeText(txtMsg){
		$("#message").val(menu[txtMsg]);
	}

	function go_send(){

		if(confirm("SMS 발송할까요?")){
			var frm = document.smsFrm;
			frm.target =  "ifr_hidden"; 
			frm.action = "sms_send_ok.jsp";
			frm.submit();
		}	
	}
</script>
<title></title>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="700">
  <tr>
    <td width="630" class=title>★ SMS 발송 ★</td>
    <td width="70" align="center"><a href="javascript:self.close();"><img src="/_admin/images/common/btn_close2.gif" width="18" height="19" border="0"></a></td>
  </tr>
  <tr>
    <td align="center" colspan="2" width="700">&nbsp;</td>
  </tr>
<form name="smsFrm" method="post">
  <tr>
    <td colspan="2"><table border="0" cellpadding="0" cellspacing="0" width="700">
        <tr>
          <td width="220" valign="top" align="center"><table border="0" cellpadding="0" cellspacing="0" width="155">
              <tr>
                <td width="155" align="center"><table border="0" cellpadding="0" cellspacing="0" width="155">
                    <tr>
                      <td width="155" align="center"><img src="/_admin/images/common/img_hp_top.gif" width="155" height="38" border="0"></td>
                    </tr>
                    <tr>
                      <td align="center" width="250" bgcolor="#58595B">
                      <textarea id="message" name="message" maxlength="20" rows="8" cols="16" class="box03" onkeydown="isMaxlength(this.form.message);"></textarea></td>
                    </tr>
                    <tr>
                      <td align="center" bgcolor="#58595B"><table border="0" cellpadding="0" cellspacing="0" width="155">
                          <tr>
                            <td width="21"><img src="/_admin/images/common/img_hp_left.gif" width="21" height="48" border="0"></td>
                            <td width="117" align="center">
                            <a href="javascript:go_send();"><img src="/_admin/images/common/btn_hp_send.gif" width="55" height="21" border="0"></a></td>
                            <td width="17" align="right"><img src="/_admin/images/common/img_hp_right.gif" width="17" height="48" border="0"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td align="center" height="25"><span id="msg_byte">0</span> / 80 Bytes</td>
              </tr>
            </table></td>
          <td width="480" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td><%=reservename %>&nbsp;
                	<input type="hidden" id="menu" name="menu" value="<%=menu %>" >
                	<input type="hidden" id="seq" name="seq" value="<%=seq %>" >
				</td>
              </tr>
              <tr>
                <td><table border="0" cellpadding="2" cellspacing="1" width="95%" bgcolor="silver">
                    <tr>
                      <td height="25" align="right" bgcolor="#E6E7E8" style="padding-right:10px;" width="147"><span class=normal_b>남은 SMS 포인트</span></td>
                      <td height="25" bgcolor="white" style="padding-left:10px;" width="306"><span class=blue><%=sDao.getRemainCount()%> </span>건</td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#E6E7E8" height="25" style="padding-right:10px;"><span class=normal_b>보내는사람</span></td>
                      <td bgcolor="white" style="padding-left:10px;"><input name="sphone" type="text" value="02-6670-0202" size="20" class="input_box"></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#E6E7E8" height="25" style="padding-right:10px;"><span class=normal_b>받는사람</span></td>
                      <td bgcolor="white" style="padding-left:10px;"><input name="rphone" type="text" size="20" value="<%=reservephone %>" class="input_box">
                      </td>
                    </tr>
                  </table></td>
              </tr>
</form>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
              <td>
              <input type="radio" name="rdb_message" value="예약완료" onclick="changeText(0);">예약완료</br>
              <input type="radio" name="rdb_message" value="입금완료" onclick="changeText(1);">입금완료</br>
              <input type="radio" name="rdb_message" value="부킹(입실,투어)하루전" onclick="changeText(2);">부킹(입실,투어)하루전</br>
              <input type="radio" name="rdb_message" value="예약취소" onclick="changeText(3);">예약취소</br>
              <input type="radio" name="rdb_message" value="예약변경" onclick="changeText(4);">예약변경</br>
              </td>
              </tr>
            </table>
            <p>&nbsp;</p></td>
        </tr>
      </table></td>
  </tr>
</table>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe> 
</body>
</html>