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
	
	public static String pwChange(){
		StringBuilder builder = new StringBuilder();
		builder.append("<TABLE border=0 cellSpacing=0 cellPadding=0 width=700 align=center>\n");
		builder.append("<TBODY>\n");
		builder.append("<TR>\n");
		builder.append("<TD width=700>&nbsp;</TD></TR>\n");
		builder.append("<TR>\n");
		builder.append("<TD height=94 background=http://www.goodjobgolf.com/images/common/img_mail_top.gif>&nbsp;</TD></TR>\n");
		builder.append("<TR>\n");
		builder.append("<TD align=middle>\n");
		builder.append("<TABLE border=0 cellSpacing=0 cellPadding=0 width=650>\n");
		builder.append("<TBODY>\n");
		builder.append("<TR>\n");
		builder.append("<TD height=300 width=650 align=left>\n");
		builder.append("<P><SPAN style=\"FONT-SIZE: 9pt\"></SPAN>&nbsp;</P>\n");
		builder.append("<P><SPAN style=\"FONT-FAMILY: 돋움,dotum; FONT-SIZE: 9pt\">안녕하세요, 회원님<BR>고객님의 비밀번호가 변경되었음을 알려드립니다. 만약 도용에 의한 비밀번호 변경인 경우 고객센터로 즉시 문의하여 <BR>주시기 바랍니다.</SPAN><BR><BR>\n");
		builder.append("<SPAN style=\"FONT-FAMILY: 돋움,dotum; FONT-SIZE: 9pt\">아이디 : </SPAN><SPAN class=orange><STRONG><FONT color=#f96f0a>\n");
		builder.append("<SPAN style=\"FONT-FAMILY: 돋움,dotum; FONT-SIZE: 9pt\"> {0} </SPAN></FONT></STRONG></SPAN>\n");
		builder.append("<SPAN style=\"FONT-FAMILY: 돋움,dotum; FONT-SIZE: 9pt\"> </SPAN><BR><BR>\n");
		builder.append("<SPAN style=\"FONT-FAMILY: 돋움,dotum; FONT-SIZE: 9pt\" >비밀번호 변경일 : {1} <BR><BR></SPAN>\n");
		builder.append("<SPAN style=\"FONT-FAMILY: 돋움,dotum; FONT-SIZE: 9pt\" >앞으로 고객님께 더욱 만족스러운 서비스와 커다란 즐거움을 제공할 수 있도록 항상 노력하는 Goodjobgolf가 <BR>되겠습니다.<BR>감사합니다. </SPAN><BR><BR><STRONG><SPAN_b><SPAN style=\"FONT-FAMILY: 돋움,dotum; FONT-SIZE: 9pt\">Goodjobgolf 전화상담 이용안내</SPAN></SPAN><SPAN style=\"FONT-FAMILY: 돋움,dotum; FONT-SIZE: 9pt\"> </SPAN><BR><BR></STRONG><SPAN style=\"FONT-FAMILY: 돋움,dotum; FONT-SIZE: 9pt\">고객센터 : 02-6670-0202<BR>상담시간 : 평일 09:00 ~ 18:00 , 토요일 09:00 ~ 12:00 <BR>E-mail : webmaster@goodjobgolf.com</SPAN><SPAN style=\"FONT-FAMILY: 돋움,dotum\">&nbsp;</SPAN></P></TD></TR></TBODY></TABLE></TD></TR>\n");
		builder.append("<TR>\n");
		builder.append("<TD style=\"PADDING-LEFT: 8px; PADDING-RIGHT: 5px\" bgColor=white height=170 background=http://www.goodjobgolf.com/images/common/img_mail_copyright.gif></TD></TR></TBODY></TABLE>\n");
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
		builder.append("<TR>\n");
		builder.append("<TD style=\"PADDING-LEFT: 8px; PADDING-RIGHT: 5px\" bgColor=white height=170 background=\"http://www.goodjobgolf.com/images/common/img_mail_copyright.gif\">\n");
		builder.append("</TD></TR></TABLE>\n");
		builder.append("</body>\n");
		builder.append("</html>\n");
		
		return builder.toString();
	}
}
