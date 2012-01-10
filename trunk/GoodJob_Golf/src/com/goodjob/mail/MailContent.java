/**
 * 
 */
package com.goodjob.mail;

/**
 * @author Administrator
 *
 */
public class MailContent {

	public static String join(){
		
		StringBuilder builder = new StringBuilder();
		builder.append("<TABLE border=0 cellSpacing=0 cellPadding=0 width=700 align=center>\n");
		builder.append("<TBODY>\n");
		builder.append("<TR>\n");
		builder.append("<TD width=700>&nbsp;</TD></TR>\n");
		builder.append("<TR>\n");
		builder.append("<TD height=94 background=\"http://www.goodjobgolf.com/images/common/img_mail_top.gif\">&nbsp;</TD></TR>");
		builder.append("<TR>\n");
		builder.append("<TD align=middle>\n");
		builder.append("<TABLE border=0 cellSpacing=0 cellPadding=0 width=650>\n");
		builder.append("<TBODY>\n");
		builder.append("<TR>\n");
		builder.append("<TD height=200 background=http://www.goodjobgolf.com/images/common/img_mail_join.gif width=650></TD></TR></TBODY></TABLE></TD></TR>\n");
		builder.append("<TR>\n");
		builder.append("<TD><SPAN style=\"BACKGROUND-COLOR: #ffffff; COLOR: #ff6c00\"><STRONG><SPAN style=\"FONT-SIZE: 9pt\">{0}</SPAN></STRONG></SPAN>\n");
		builder.append("<SPAN style=\"BACKGROUND-COLOR: #ffffff; COLOR: #ff6c00; FONT-SIZE: 9pt\"> </SPAN><SPAN style=\"FONT-SIZE: 9pt\">회원님께서는</SPAN>\n");
		builder.append("<STRONG><SPAN style=\"COLOR: #ff6c00; FONT-SIZE: 9pt\">{1}</SPAN></STRONG>\n");
		builder.append("<SPAN style=\"FONT-SIZE: 9pt\">에 회원가입을 하셨으며, 회원가입시 그 이후 메일 수신을 동의하였기에 발송되었습니다.</SPAN><BR><BR></TD></TR>\n");
		builder.append("<TR>\n");
		builder.append("<TD bgColor=white height=170 background=http://www.goodjobgolf.com/images/common/img_mail_copyright.gif></TD></TR></TBODY></TABLE>\n");

		return builder.toString();
	}
	
	public static String memid(){
		StringBuilder builder = new StringBuilder();
		builder.append("<html>\n");
		builder.append("<head>\n");
		builder.append("<meta http-equiv='content-type' content='text/html; charset=euc-kr'>\n");
		builder.append("<title>Welcome to GoodJobGolf</title>\n");
		builder.append("<link rel='stylesheet' href='http://www.goodjobgolf.com/css/common.css' type='text/css'>\n");
		builder.append("</head>\n");
		builder.append("<body>\n");
		builder.append("<table border='0' cellpadding='0' cellspacing='0' width='700' align='center'>\n");
		builder.append("<tr>\n");
		builder.append("<td width='700'>&nbsp;</td>\n");
		builder.append("</tr>\n");
		builder.append("<tr>\n");
		builder.append("<td height='94' background='http://www.goodjobgolf.com/images/common/img_mail_top.gif'>&nbsp;</td>\n");
		builder.append("</tr>\n");
		builder.append("<tr>\n");
		builder.append("<td align='center'><table border='0' cellpadding='0' cellspacing='0' width='650'>\n");
		builder.append("<tr>\n");
		builder.append("<td width='650' height='250'><span class=normal>안녕하세요, 회원님<br>\n");
		builder.append("<br>\n");
		builder.append("고객님의 아이디는<span> <span class=orange>{0}</span> <span class=normal>임을 알려드립니다.<br>\n");
		builder.append("<br>\n");
		builder.append("앞으로 고객님께 더욱 만족스러운 서비스와 커다란 즐거움을 제공할 수 있도록 항상 노력하는 Goodjobgolf가 <br>\n");
		builder.append("되겠습니다.\n");
		builder.append("감사합니다. <br>\n");
		builder.append("<br>\n");
		builder.append("기타 궁금하신 사항은 고객센터로 문의하여 주시기 바랍니다.</span> <br>\n");
		builder.append("<br>\n");
		builder.append("<span class=normal_b>Goodjobgolf 전화상담 이용안내</span> <br>\n");
		builder.append("<br>\n");
		builder.append("<span class=normal>고객센터 : 02-6670-0202 <br>\n");
		builder.append("상담시간 : 평일 09:00 ~ 18:00 , 토요일 09:00 ~ 12:00 <br>\n");
		builder.append("E-mail : webmaster@goodjobgolf.com</span></td>\n");
		builder.append("</tr>\n");
		builder.append("</table></td>\n");
		builder.append("</tr>\n");
		builder.append("<tr>\n");
		builder.append("<td bgcolor='#58595B' height='170' style='padding-left:8px;padding-right:5px;'>\n");
		builder.append("<span style='font:12px 돋움,dotum; color:#FFFFFF; text-decoration:none;'>\n");
		builder.append("메일 수신을 원치 않으시면 로그인 후 회원정보로 가셔서 변경하시기 바랍니다.<br>\n");
		builder.append("(If you do not wish to continue receiving updates from us please log-in and change your E-mailing condition 'yes' to 'no'.)<br>\n");
		builder.append("* 본 메일은 발신전용입니다. 문의가 있으신 분은</span> <span class=yellow>webmaster@goodjobgolf.com</span> <span class=white_m>으로 문의 메일을 보내주십시오.<br>\n");
		builder.append("<br>\n");
		builder.append("사업자등록번호 : 114-81-92021 &nbsp;통신판매업신고번호 : 제 2004-295호 &nbsp;Tel :02-6670-0202 &nbsp;&nbsp;Fax : 02-6670-0210<br>\n");
		builder.append("(우) 153-789 서울특별시 금천구 가산동 470-5 에이스테크노타워 10차 509호 (주)세이브코리아 &nbsp;대표이사 정재경</span></td>\n");
		builder.append("</tr>\n");
		builder.append("</table>\n");
		builder.append("</body>\n");
		builder.append("</html>\n");
		
		return builder.toString();
	}
	
	public static String password(){
		StringBuilder builder = new StringBuilder();
		builder.append("<TABLE border=0 cellSpacing=0 cellPadding=0 width=700 align=center>\n");
		builder.append("<TBODY>\n");
		builder.append("<TR>\n");
		builder.append("<TD width=700></TD></TR>\n");
		builder.append("<TR>\n");
		builder.append("<TD height=94 background=\"http://www.goodjobgolf.com/images/common/img_mail_top.gif\"></TD></TR>\n");
		builder.append("<TR>\n");
		builder.append("<TD align=middle>\n");
		builder.append("<TABLE border=0 cellSpacing=0 cellPadding=0 width=650>\n");
		builder.append("<TBODY>\n");
		builder.append("<TR>\n");
		builder.append("<TD height=250 width=650>\n");
		builder.append("<P><font size=\"2\"><SPAN style=\"FONT-FAMILY: dotum; FONT-SIZE: 9pt\">안녕하세요,회원님<br/><br/>고객님의 비밀번호는 <SPAN style=\"COLOR: #ff6c00\"><STRONG>{0}</STRONG></SPAN> 임을 알려드립니다.</SPAN><BR><BR><SPAN style=\"FONT-FAMILY: dotum; FONT-SIZE: 9pt\">앞으로 고객님께 더욱 만족스러운 서비스와 커다란 즐거움을 제공할 수 있도록 항상 노력하는 Goodjobgolf가 </SPAN><BR><SPAN style=\"FONT-FAMILY: dotum; FONT-SIZE: 9pt\">되겠습니다. 감사합니다.</SPAN><BR><BR><SPAN style=\"FONT-FAMILY: dotum; FONT-SIZE: 9pt\">기타 궁금하신 사항은 고객센터로 문의하여 주시기 바랍니다.</SPAN><BR><BR><STRONG><SPAN style=\"FONT-FAMILY: dotum; FONT-SIZE: 9pt\">Goodjobgolf 전화상담 이용안내</SPAN><BR></STRONG><BR><SPAN style=\"FONT-FAMILY: dotum; FONT-SIZE: 9pt\">고객센터 : 02-670-0202</SPAN><BR><SPAN style=\"FONT-FAMILY: dotum; FONT-SIZE: 9pt\">상담시간 : 평일 09:00 ~ 18:00 , 토요일 09:00 ~ 12:00 </SPAN><BR><SPAN style=\"FONT-FAMILY: dotum; FONT-SIZE: 9pt\">E-mail : webmaster@goodjobgolf.com</SPAN></P></font></TD></TR></TBODY></TABLE></TD></TR>\n");
		builder.append("<TR>\n");
		builder.append("<TD style=\"PADDING-LEFT: 8px; PADDING-RIGHT: 5px\" bgColor=white height=170 background=\"http://www.goodjobgolf.com/images/common/img_mail_copyright.gif\">\n");
		builder.append("<P></P></TD></TR></TBODY></TABLE>\n");
		
		return builder.toString();
	}
	
	public static String auth(){
		
		StringBuilder builder = new StringBuilder();
		builder.append("<html>\n");
		builder.append("<head>\n");
		builder.append("<meta http-equiv='content-type' content='text/html; charset=euc-kr'>\n");
		builder.append("<title>Welcome to GoodJobGolf</title>\n");
		builder.append("<link rel='stylesheet' href='http://www.goodjobgolf.com/css/common.css' type='text/css'>\n");
		builder.append("<link rel='stylesheet' href='http://www.goodjobgolf.com/css/style.css' type='text/css'>\n");
		builder.append("</head>\n");
		builder.append("<body>\n");
		builder.append("<table border='0' cellpadding='0' cellspacing='0' width='700' align='center'>\n");
		builder.append("<tr>\n");
		builder.append("<td width='700'>&nbsp;</td>\n");
		builder.append("</tr>\n");
		builder.append("<tr>\n");
		builder.append("<td height='94' background='http://www.goodjobgolf.com/images/common/img_mail_top.gif'>&nbsp;</td>\n");
		builder.append("</tr>\n");
		builder.append("<tr>\n");
		builder.append("<td align='center'><table border='0' cellpadding='0' cellspacing='0' width='650'>\n");
		builder.append("<tr>\n");
		builder.append("<td width='650' height='200' background='http://www.goodjobgolf.com/images/common/img_mail_join.gif'>\n");
		builder.append("</td>\n");
		builder.append("</tr>\n");
		builder.append("</table></td>\n");
		builder.append("</tr>\n");
		builder.append("<tr>\n");
		builder.append("<td bgcolor='#58595B' height='70' style='padding-left:8px;padding-right:5px;'><font color='#FFFFFF'>인증 번호 : </font><font color='#FFF450'>%s</font>\n");
		builder.append("</td>\n");
		builder.append("</tr>\n");
		builder.append("</table>\n");
		builder.append("</body>\n");
		builder.append("</html>\n");
		
		return builder.toString();
	}
}
