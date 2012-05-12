<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.reserve.dto.RegionDto"%>
<%@ page import="com.goodjob.reserve.PackageDao"%>
<%@page import="com.goodjob.reserve.CondoReserveDao"%>
<%@page import="com.goodjob.reserve.dto.*"%>
<%@page import="com.goodjob.conf.Config"%>
<%@page import="com.goodjob.util.Utils"%>
<%
	int region = NumberUtils.toInt(request.getParameter("region"),1);

	int condo_seq = NumberUtils.toInt(request.getParameter("condo_seq"),1);
	
	String menu = StringUtils.trimToEmpty(request.getParameter("menu"));
	
	//어드민쪽 DAO랑 사용자쪽 DAO가 틀려요 근데 왜 안되는지 몰겠네여;
	PackageDao pkDao = new PackageDao();
	List<RegionDto> arrRegions = pkDao.getRegionList("1");
	
	CondoReserveDao cdDao = new CondoReserveDao();
	
	CondoDto cdDto = cdDao.getCondo(condo_seq);
	
	List<CondoGalleryDto> galleryList = cdDao.getCondoGallerySelect(condo_seq);
	
	List<CondoRoomDto> roomList = cdDao.getCondoRoomSelect(condo_seq);
	
	String img_dir = Config.get("reserve_img");
	
	String now_date = Utils.getDate("yyyy-MM-dd");
%>
<script language="javascript" type="text/javascript">

	function reserve_condo(){
		
		if(!$("#in_date").val() || !$("#out_date").val()){
			alert("이용 일자를 입력하세요!");
			return ;		
		}
		
		if(!$("input[name=condoroom_seq][checked]").val()){
			alert("객실을 선택 하세요.");
			$("#condoroom_seq").focus();
			return ;		
		}
		
		if(!$("#room_num").val()){
			alert("객실수량을 선택 하세요.");
			$("#room_num").focus();
			return ;
		}

		if(!$("#per_num").val()){
			alert("이용인원을 입력 입력하세요!");
			return ;		
		}

		if(!$('#mobile1').val()) {
			alert('핸드폰 앞자리를 선택해 주세요.');
			$('#mobile1').focus();
			return;
		}

   		if(!$('#mobile2').val()) {
			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile2').focus();
			return;
		}

   		if(!$('#mobile3').val()) {
   			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile3').focus();
			return;
		}
		
		document.frm.submit();
	}

	$(function() {
		$( "#in_date" ).datepicker({
			dateFormat:'yy-mm-dd',
			onSelect : function(dateText, inst){
				
				var nowDate = ("<%=now_date%>").replace('-','').replace('-','');
				var arrDate = dateText.split("-");
				arrDate = arrDate[0] + arrDate[1] + arrDate[2];
				
				if(nowDate > arrDate){
					alert("오늘보다 이전날짜를 선택할 수 없습니다.");
					$( "#in_date" ).val("<%=now_date%>");
					return;
				}
				calDateRange($("#in_date").val(),$("#out_date").val());
			}
		});
	});

	$(function() {
		$( "#out_date" ).datepicker({
			dateFormat:'yy-mm-dd',
			onSelect : function(dateText, inst){
				var nowDate = ("<%=now_date%>").replace('-','').replace('-','');
				var arrDate = dateText.split("-");
				arrDate = arrDate[0] + arrDate[1] + arrDate[2];
				if(nowDate > arrDate){
					alert("오늘보다 이전날짜를 선택할 수 없습니다.");
					$( "#out_date" ).val("<%=now_date%>");
					return;
				}

				if($("#out_date").val() < $("#in_date").val()){
					alert("시작날짜보다 이전날짜를 선택할 수 없습니다.");
					$( "#out_date" ).val("");
					return;
				}
				
				if($("#out_date").val() == $("#in_date").val()){
					alert("시작날짜와 같은날짜를 선택할 수 없습니다.\n하루 숙박이시면 시작날짜(입실일) 이후 퇴실일을 선택하시기 바랍니다.");
					$( "#out_date" ).val("");
					return;
				}

				calDateRange($("#in_date").val(),$("#out_date").val());
			}
		});
	});
	
	function calDateRange(val1, val2){
	        var FORMAT = "-";
	        // FORMAT을 포함한 길이 체크
	        if (val1.length != 10 || val2.length != 10)
	            return 0;

	        // FORMAT이 있는지 체크
	        if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)
	            return 0;

	        // 년도, 월, 일로 분리
	        var start_dt = val1.split(FORMAT);
	        var end_dt = val2.split(FORMAT);

	        // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
	        // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
	        start_dt[1] = (Number(start_dt[1]) - 1) + "";
	        end_dt[1] = (Number(end_dt[1]) - 1) + "";

	        var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
	        var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);

	        var day = ((to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24)+1;
	        var night = day - 1;
	        var night_day = (night==0?"":night+"박 ")+day+"일";
	        $("#room_num").val(day);
	        $("#room_show").val(night_day);
	        
	    }
	function DisplayMenu(index) {
       for (i=1; i<=4; i++)
       if (index == i) {
        thisMenu = eval("menu" + index + ".style");
        thisMenu.display = "";
       	if(index == 4){
       		$("#ifrmMap").attr("src", "/forGolfbooking/ifrm_map.jsp?x=<%=cdDto.getPoint_x()%>&y=<%=cdDto.getPoint_y()%>");
       	}
       } 
       else {
        otherMenu = eval("menu" + i + ".style"); 
        otherMenu.display = "none"; 
       }
      }

	$(function(){
		$("#chkRealName").click(function(){		
			if(this.checked){
				document.getElementById("reserve_name").readOnly = true;
				$("#reserve_name").val("<%=user_Name%>");
				$("#mobile1").focus();
			}else{
				document.getElementById("reserve_name").readOnly = false;
				$("#reserve_name").val("");
			}
		});
	});

	function sel_phone1(){
		$("#mobile2").focus();
	}

	function sel_phone2(){
		var ph_num = $("#mobile2").val();
		if(ph_num.length >= 4){
			$("#mobile3").focus();
		}
	}
	
//-->
</script>
<table border="0" cellpadding="0" cellspacing="0" width="751">
      <tr>
        <td><table border="0" cellpadding="0" cellspacing="0" width="751">
            <tr>
              <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                  <tr>
                    <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="704">
                        <tr>
                          <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>콘도예약</span></td>
                        </tr>
                        <tr>
                          <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">콘도예약</td>
                        </tr>
                        <tr>
                          <td><p>&nbsp;</p></td>
                        </tr>

<form name="frm" method="post" action="rule.jsp">
<input type="hidden" name="menu" value="<%=menu%>"/>
<input type="hidden" name="condo_seq" value="<%=condo_seq%>"/>
<input type="hidden" name="condo_name" value="<%=cdDto.getCondo_name()%>"/>

                        <tr>
                          <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="707">
                              <tr>
                                <td width="290" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="274" bgcolor="white">
                                    <tr>
                                      <td bgcolor="white"><table border="0" cellpadding="2" cellspacing="1" width="274" bgcolor="silver">
                                          <tr>
                                            <td bgcolor="white" width="270">
                                            <%if(cdDto.getImg_main()==null){%>
                                            <img src="/images/common/img_thumb_ready.jpg" name="img1" width="270" height="202" border="0">
                                            <%}else{%>
                                            <img src="<%=img_dir%><%=cdDto.getImg_main()%>" name="img1" width="270" height="202" border="0">
                                            <%}%>
                                            </td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                  </table></td>
                                <td width="417" valign="top"><table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td class=cc_name valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                          <tr>
                                            <td class="cc_name"><%=cdDto.getCondo_name()%></td>
                                          </tr>
                                          <tr>
                                            <td height="10"></td>
                                          </tr>
                                          <tr>
                                            <td height="4"><table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                  <td height="30" width="60" class=normal_b>위치 </td>
                                                  <td width="10">:</td>
                                                  <td width="347"><%=cdDto.getAddress1()%> <%=cdDto.getAddress2()%></td>
                                                </tr>
                                                <tr>
                                                  <td height="30" class="normal_b" width="60">할인기간</td>
                                                  <td height="23">:</td>
                                                  <td height="23"><%=cdDto.getSaledate_start()%> ~ <%=cdDto.getSaledate_end()%></td>
                                                </tr>
                                                <tr>
                                                  <td height="30" class=normal_b width="60">정상가</td>
                                                  <td>:</td>
                                                  <td>
				<%
						if(roomList != null && !roomList.isEmpty()){
							
							int size = roomList.size();
							CondoRoomDto roomDto; 
							for(int i = 0 ; i < size ; i++){
								
								roomDto = roomList.get(i);
				%>
								<span class=blue style="width:200px;height:15px;"><%=roomDto.getRoomtype()%>&nbsp;주중:<%=Utils.numberFormat(roomDto.getPrice_n1())%>원 ~.</span><span style="width:5px;height:20px;text-align:center;"></span><span class=blue style="height:15px;">주말:<%=Utils.numberFormat(roomDto.getPrice_n2())%>원 ~.</span><br/>
				<%
							}
						}
				%>                                                  	
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td height="30" class=normal_b width="60">할인가</td>
                                                  <td>:</td>
                                                  <td>
				<%
						if(roomList != null && !roomList.isEmpty()){
							
							int size = roomList.size();
							CondoRoomDto roomDto; 
							for(int i = 0 ; i < size ; i++){
								
								roomDto = roomList.get(i);
				%>
								<span class=orange style="width:200px;height:15px;"><%=roomDto.getRoomtype()%>&nbsp;주중:<%=Utils.numberFormat(roomDto.getPrice_s1())%>원 ~.</span><span style="width:5px;height:20px;text-align:center;"></span><span class=orange style="height:15px;">주말:<%=Utils.numberFormat(roomDto.getPrice_s2())%>원 ~.</span><br/>
				<%
							}
						}
				%>                                                  
                                                  </td>
                                                </tr>
                                              </table></td>
                                          </tr>
                                          <tr>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td>※ 자세한 콘도정보는 아래 <span class=normal_b>콘도안내</span> 메뉴를 참조하시기 바랍니다</td>
                                          </tr>
                                          <tr>
                                            <td></td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                  </table></td>
                              </tr>
                              <tr>
                                <td colspan="2" valign="top" width="707"></td>
                              </tr>

                              <tr>
                                <td colspan="2" width="707">&nbsp;</td>
                              </tr>
                              <tr>
                                <td colspan="2" align="center" width="707"><table align="center" border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#D1D3D4">
                                    <tr>
                                      <td bgcolor="#AED247" colspan="4" width="701"></td>
                                    </tr>
                                    <tr>
                                      <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" width="130" height="25">이용일자</td>
                                      <td colspan="3" bgcolor="white" style="padding-left:10px;" width="550"><input class="mem_input" value="" onclick="blur();" type="text" size="14" id="in_date" name="in_date" readonly>
                                        <img align="absmiddle" src="/images/common/img_calendar.gif" width="15" height="16" border="0"> ~
                                        <input class="mem_input" value="" type="text" size="14" id="out_date" name="out_date" onclick="blur();">
                                        <img align="absmiddle" src="/images/common/img_calendar.gif" width="15" height="16" border="0"></td>
                                    </tr>
                                    <tr>
                                      <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">객실선택</td>
                                      <td colspan="3" bgcolor="white" style="padding-left:10px;padding-bottom:5px;" class=red_ss>
		<%
				if(roomList != null && !roomList.isEmpty()){
					
					int size = roomList.size();
					CondoRoomDto roomDto;
					for(int i = 0 ; i < size ; i++){
						
						roomDto = roomList.get(i);
						
						//if(roomDto.getReserve_room_seq()==0){
		%>
                                      <input type="radio" id="condoroom_seq" name="condoroom_seq" value="<%=roomDto.getCondoroom_seq()%>">&nbsp;<%=roomDto.getRoomtype()%> <br>
                                      <input type="hidden" name="roomtype" value="<%=roomDto.getRoomtype()%>"/>
		<%
						//}
					}
				}
		%>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" width="130">숙박일</td>
                                      <td bgcolor="white" class="red_ss" style="padding-left:10px;" width="164">
                                      <input class="mem_input" type="text" maxlength="2" size="8" id="room_show" name="room_show"/>
                                      <input class="mem_input" type="hidden" maxlength="2" id="room_num" name="room_num"/></td>
                                      <td width="117" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" align="right">이용인원</td>
                                      <td width="243" bgcolor="white" style="padding-left:10px;"><input class="mem_input" type="text" maxlength="2" size="5" id="per_num" name="per_num">인 </td>
                                    </tr>
                                    <tr>
                                      <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">핸드폰</td>
                                      <td colspan="3" bgcolor="white" style="padding-left:10px;padding-bottom:5px;">
                                      <select id="mobile1" name="mobile1" size="1" onChange="sel_phone1();">
                                          <option value="">선택</option>
                                          <option value="010">010</option>
                                          <option value="011">011</option>
                                          <option value="016">016</option>
                                          <option value="017">017</option>
                                          <option value="018">018</option>
                                          <option value="019">019</option>
                                        </select>
                                        -
                                        <input class="mem_input" type="text" size="8" id="mobile2" name="mobile2" onKeydown="sel_phone2();" maxlength="4">
                                        -
                                        <input class="mem_input" type="text" size="8" id="mobile3" name="mobile3" maxlength="4"></td>
                                    </tr>
                                    <tr>
                                      <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">실제이용자</td>
                                      <td colspan="3" bgcolor="white" style="padding-left:10px;"><p>
                                        <input class="mem_input" type="text" size="15" id="reserve_name"name="reserve_name" value="">
                                        &nbsp;
                                        <INPUT name="chkRealName" id="chkRealName" type=checkbox>
                                        <span class=mem_notice>실제이용자가 예약자와 동일한 경우 체크</span></p></td>
                                      </td>
                                      
                                    </tr>
                                    <!--tr>
                                      <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">이용요금</td>
                                      <td colspan="3" bgcolor="white" style="padding-left:10px;" class="red">150,000원</td>
                                    </tr>-->
                                    <tr>
                                      <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">요청사항</td>
                                      <td bgcolor="white" style="padding-left:10px;" colspan="3">
                                      <textarea class="box_02" rows="4" cols="85" name="reserve_memo"></textarea></td>
                                    </tr>
                                    <tr>
                                      <td bgcolor="#AED247" colspan="4" width="701"></td>
                                    </tr>
                                  </table></td>
                              </tr>
                              <tr>
                                <td colspan="2" align="center" style="padding-top:20px;padding-bottom:30px;" width="707"><a href="javascript:reserve_condo();"><img align="absmiddle" src="/images/condo/btn_condo_regist.gif" width="150" height="39" border="0"></a></td>
                              </tr>
</form>
                              <tr>
                                <td colspan="2" width="707" align="center"><table border="0" width="704" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td width="426"></td>
                                    </tr>
                                    <tr>
                                      <td valign="top"><div id="menu1" style="display:block;">
                                          <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                              <td><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                  <tr>
                                                    <td onClick="DisplayMenu(1)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_on_01.gif" width="173" height="25" alt="콘도안내"></td>
                                                    <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_02.gif" width="173" height="25" alt="상세정보"></td>
                                                    <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_03.gif" width="173" height="25" alt="사진갤러리"></td>
                                                    <td onClick="DisplayMenu(4)" style="cursor:hand" width="176"><p><img src="/images/condo/btn_tab_off_04.gif" width="173" height="25" alt="오시는길"></p></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                            <tr>
                                              <td height="10"></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="white" align="center"><table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                  <tr>
                                                    <td><%=cdDto.getCondo_info()%></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table>
                                        </div>
                                        <div id="menu2" style="display:none;">
                                          <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                              <td background="/renewal/images/inc/img_board_bg.gif"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                  <tr>
                                                    <td onClick="DisplayMenu(1)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_01.gif" width="173" height="25" alt="콘도안내"></td>
                                                    <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_on_02.gif" width="173" height="25" alt="상세정보"></td>
                                                    <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_03.gif" width="173" height="25" alt="사진갤러리"></td>
                                                    <td onClick="DisplayMenu(4)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_04.gif" width="173" height="25" alt="오시는길"></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                            <tr>
                                              <td height="10"></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="white"><%=cdDto.getDetail_info()%></td>
                                            </tr>
                                          </table>
                                        </div>
                                        <div id="menu3" style="display:none;">
                                          <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                              <td background="/renewal/images/inc/img_board_bg.gif"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                  <tr>
                                                    <td onClick="DisplayMenu(1)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_01.gif" width="173" height="25" alt="콘도안내"></td>
                                                    <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_02.gif" width="173" height="25" alt="상세정보"></td>
                                                    <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_on_03.gif" width="173" height="25" alt="사진갤러리"></td>
                                                    <td onClick="DisplayMenu(4)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_04.gif" width="173" height="25" alt="오시는길"></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                            <tr>
                                              <td height="10"></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="white" align="center">
<%

		if(galleryList != null && !galleryList.isEmpty()){
			
			int size = galleryList.size();
			String[]  gallery_img = new String[4];
			
			for(int i = 0 ; i < 4; i++){
				gallery_img[i] = galleryList.get(i).getCondo_img();
			}
%>
                                             	 	<table border="0" width="669" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                          <td width="325" valign="top">
                                                          <img src="<%=img_dir%><%=StringUtils.trimToEmpty(gallery_img[0])%>" width="313" height="150"/>
                                                          </td>
                                                          <td width="19">&nbsp;</td>
                                                           <td width="325" valign="top">
                                                          <img src="<%=img_dir%><%=StringUtils.trimToEmpty(gallery_img[1])%>" width="313" height="150"/>
                                                          </td>
                                                        </tr>
                                                    </table>
                                                    
                                                    <table border="0" width="669" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                           <td width="325" valign="top">
                                                          <img src="<%=img_dir%><%=StringUtils.trimToEmpty(gallery_img[2])%>" width="313" height="150"/>
                                                          </td>
                                                          <td width="19">&nbsp;</td>
                                                           <td width="325" valign="top">
                                                          <img src="<%=img_dir%><%=StringUtils.trimToEmpty(gallery_img[3])%>" width="313" height="150"/>
                                                          </td>
                                                        </tr>
                                                    </table>
<%
		}
%>
												</td>
                                            </tr>
                                          </table>
                                        </div>
                                        <div id="menu4" style="display:none;">
                                          <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                              <td background="/renewal/images/inc/img_board_bg.gif"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                  <tr>
                                                    <td onClick="DisplayMenu(1)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_01.gif" width="173" height="25" alt="콘도안내"></td>
                                                    <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_02.gif" width="173" height="25" alt="상세정보"></td>
                                                    <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_off_03.gif" width="173" height="25" alt="사진갤러리"></td>
                                                    <td onClick="DisplayMenu(4)" style="cursor:hand" width="176"><img src="/images/condo/btn_tab_on_04.gif" width="173" height="25" alt="오시는길"></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                            <tr>
                                              <td height="10"></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="white" align="center"><iframe id="ifrmMap" src="" width=602 height=402 frameborder="0" border="0" marginheight="0" marginwidth="0" scrolling="no" noresize></iframe></td>
                                            </tr>
                                          </table>
                                        </div></td>
                                    </tr>
                                  </table></td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                </table></td>
            </tr>
          </table></td>
      </tr>      
    </table>