<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@include file="/include/loginCheck.jsp" %>
<%
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->

<script type="text/javascript">
	function couponreg(){
		var cp = $("#couponCode").val();
		if(cp.replace(" ","").length == 0){
			alert("상품권번호를 입력해 주시기 바랍니다");
			return;
		}
			
		$.ajax({
		  url: "/member/ajax_couponCheck.jsp?couponcode="+cp,
		  cache: false,
		  async: false,
		  success: function(html){
			var evalData = eval("("+html+")");
			if(evalData.CouponCode.length == 1){
				var msgStr = "";
				if(evalData.CouponCode[0].rv == "0"){
					alert("정확한 상품권 번호를 입력해 주시기 바랍니다.");
				}else if(evalData.CouponCode[0].rv == "1"){
					alert("등록 되었습니다.");
					$("#couponCode").val('');
				}else if(evalData.CouponCode[0].rv == "2"){
					alert("이미 등록된 쿠폰입니다.");
				}else if(evalData.CouponCode[0].rv == "3"){
					alert("유효기간이 지난 상품권번호입니다.”");
				}
			}
		  }
		});
	}
</script>
<!--############### 중앙 컨텐츠 영역 #################-->
<table border="0" cellpadding="0" cellspacing="0" width="751">
<tr>
<td>
	<table border="0" cellpadding="0" cellspacing="0" width="751">
	<tr>
	<td width="751">
		<table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
    	<tr>
		<td align="center" bgcolor="white" width="745" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="95%">
	        <tr>
	        <td align="right" class="location" height="30" width="95%"><a href="/main.jsp">HOME</a> &gt; <span class=location_b>상품권등록</span></td>
	        </tr>
	        <tr>
			<td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">상품권등록</td>
			</tr>
			<tr>
			<td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
				<td width="94%" align="center">
					<table align="center" border="0" cellpadding="0" cellspacing="0" width="640" height="163">
					<tr>
					<td width="640"><img src="../../images/mem_join/img_coupon_title.gif" width="640" height="108" border="0"></td>
					</tr>
					<tr>
					<td align="center" style="padding-top:40px;padding-bottom:240px;">
						<table border="0" cellpadding="3" cellspacing="3" width="450" bgcolor="#D1D3D4">
						<tr>
						<td align="center" bgcolor="white" height="100">
							<table border="0" cellpadding="0" cellspacing="0" width="401">
							<tr>
							<td width="100"><img src="../../images/mem_join/img_coupon_no.gif" width="86" height="29" border="0"></td>
							<td width="178"><input class="input_01" type="text" size="30" id="couponCode" name="couponCode"></td>
							<td width="122" align="center"><img src="../../images/mem_join/btn_coupon_regist.gif" width="70" height="22" border="0" onclick="couponreg();"></td>
							</tr>
							</table>
						</td>
						</tr>
						</table>
					</td>
					</tr>
					</table>
				</td>
				</tr>
				</table>
			</td>
			</tr>
			</table>
		</td>
		</tr>
		</table>
	</td>
	</tr>
    </table>
</td>
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
