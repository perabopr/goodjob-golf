<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css"> 
#menu2 {
	display:none
}
</style>
<script language="JavaScript">
		<!--
			function toggleMenu(currMenu) {
				if (document.all) {
					thisMenu = eval("document.all.menu2[" + (currMenu-1) + "].style");
					if (thisMenu.display == "block") {
						thisMenu.display = "none";
					} else {
						for(i=0;i<document.all.menu2.length;i++) {
							otherMenu = eval("document.all.menu2[" + i + "].style");
							otherMenu.display = "none";
						}
						thisMenu.display = "block";
					}
					return false;
				} else {
					return true;
				}
			}
		//-->
		</script>
</head>
<body bgcolor="#666666" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="/_admin/images/common/admin_bg.jpg">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="180">
  <tr>
    <td width="145" align="center"><img src="/_admin/images/common/goodjobgolf_logo.gif" width="180" height="80" border="0"></td>
  </tr>
  <tr>
    <td width="145" align="center">&nbsp;</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td width="180" valign="top">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="20" height="25" align="center"><img src="/_admin/images/common/menu_bullet.gif" width="4" height="4" align="absmiddle"></td>
                                <td width="160" ONCLICK="return toggleMenu(1)" STYLE="cursor:hand"><b><font color="white">메인관리</font></b></td>
                            </tr>
                        </table-->
                        <table id="menu2" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="20" height="22">&nbsp;</td>
                                <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="#" class=left_menu>상품등록</a></td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="20" height="25" align="center"><img src="/_admin/images/common/menu_bullet.gif" width="4" height="4" align="absmiddle"></td>
                                <td width="160" ONCLICK="return toggleMenu(2)" STYLE="cursor:hand"><b><font color="white">상품관리</font></b></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="menu2" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="22">&nbsp;</td>
                                <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="product/real_list.jsp?menu=1" class=left_menu>실시간예약</a></td>
                            </tr>
                            <tr>
                                <td height="22">&nbsp;</td>
                                <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="product/pre_list.jsp?menu=2" class=left_menu>사전예약</a></td>
                            </tr>
                            <tr>
                                <td height="22">&nbsp;</td>
                                <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="product/package_list.jsp?menu=3" class=left_menu>국내패키지</a></td>
                            </tr>
                            <tr>
                                <td height="22">&nbsp;</td>
                                <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="product/package_foreign_list.jsp?menu=3" class=left_menu>해외패키지</a></td>
                            </tr>
                            <tr>
                                <td height="22">&nbsp;</td>
                                <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="product/condo_list.jsp?menu=4" class=left_menu>콘도</a></td>
                            </tr>
                            <tr>
                                <td height="22">&nbsp;</td>
                                <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="#" class=left_menu>소셜커머스</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="20" height="25" align="center"><img src="/_admin/images/common/menu_bullet.gif" width="4" height="4" align="absmiddle"></td>
                    <td width="160" ONCLICK="return toggleMenu(3)" STYLE="cursor:hand"><b><font color="white">예약관리</font></b></td>
                </tr>
            </table>
            <table id="menu2" width="100%" border="0" cellpadding="0" cellspacing="0">            	
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="order/total_search.jsp" class=left_menu>통합검색</a></td>
                </tr>
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="order/real_list.jsp" class=left_menu>실시간예약</a></td>
                </tr>
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="order/pre_list.jsp" class=left_menu>사전예약</a></td>
                </tr>
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="order/package_list.jsp"" class=left_menu>국내패키지</a></td>
                </tr>
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="order/package_foreign_list.jsp"" class=left_menu>해외패키지</a></td>
                </tr>
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="order/condo_list.jsp" class=left_menu>콘도</a></td>
                </tr>
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160" height="22"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="#" class=left_menu>소셜커머스</a></td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="20" height="25" align="center"><img src="/_admin/images/common/menu_bullet.gif" width="4" height="4" align="absmiddle"></td>
                    <td width="160" ONCLICK="return toggleMenu(4)" STYLE="cursor:hand"><b><font color="white">회원관리</font></b></td>
                </tr>
            </table>
            <table id="menu2" width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="/_admin/member/mem_list.jsp" class=left_menu>회원가입현황</a></td>
                </tr>
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="/_admin/member/sms_list.jsp" class=left_menu>SMS 보내기</a></td>
                </tr>
                <tr>
                    <td height="22">&nbsp;</td>
                    <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="/_admin/member/mail_list.jsp" class=left_menu>E-Mail 보내기</a></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="20" height="25" align="center"><img src="/_admin/images/common/menu_bullet.gif" width="4" height="4" align="absmiddle"></td>
                                <td width="160" ONCLICK="toggleMenu(5)" STYLE="cursor:hand"><font color="white"><b>통계관리</b></font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="menu2" name="menu2" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="20" height="25">&nbsp;</td>
                                <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="#" class=left_menu>신규회원분석</a></td>
                            </tr>
                            <tr>
                                <td height="25">&nbsp;</td>
                                <td><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a href="#" target="main" class=left_menu>방문자분석</a></td>
                            </tr>
                            <tr>
                                <td height="25">&nbsp;</td>
                                <td><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a href="#" target="main" class=left_menu>결제수단분석</a></td>
                            </tr>
                            <tr>
                                <td height="25">&nbsp;</td>
                                <td><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a href="#" target="main" class=left_menu>인기골프장분석</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="20" height="25" align="center"><img src="/_admin/images/common/menu_bullet.gif" width="4" height="4" align="absmiddle"></td>
                                <td width="160" ONCLICK="toggleMenu(6)" STYLE="cursor:hand"><font color="white"><b>게시판관리</b></font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="menu2" name="menu2" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="25" width="20">&nbsp;</td>
                                <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="/_admin/board/notice_list.jsp" class=left_menu>공지사항</a></td>
                            </tr>
                            <tr>
                                <td height="25" width="20">&nbsp;</td>
                                <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="/_admin/board/faq_list.jsp" class=left_menu>FAQ</a></td>
                            </tr>
                            <tr>
                                <td height="25" width="20">&nbsp;</td>
                                <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="/_admin/board/join_list.jsp" class=left_menu>JOIN 커뮤니티</a></td>
                            </tr>
                            <tr>
                                <td height="25" width="20">&nbsp;</td>
                                <td width="160"><img align="absmiddle" src="/_admin/images/common/left_menu_bullet.gif" width="6" height="7" border="0"> <a target="main" href="/_admin/board/partnership_list.jsp" class=left_menu>제휴 및 관고문의</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
