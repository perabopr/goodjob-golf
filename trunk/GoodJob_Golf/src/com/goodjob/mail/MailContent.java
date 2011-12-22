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
		builder.append("<html>");
		builder.append("<head>");
		builder.append("<meta http-equiv='content-type' content='text/html; charset=euc-kr'>");
		builder.append("<title>Welcome to GoodJobGolf</title>");
		builder.append("<link rel='stylesheet' href='http://www.goodjobgolf.com/css/common.css' type='text/css'>");
		builder.append("<link rel='stylesheet' href='http://www.goodjobgolf.com/css/style.css' type='text/css'>");
		builder.append("</head>");
		builder.append("<body>");
		builder.append("<table border='0' cellpadding='0' cellspacing='0' width='700' align='center'>");
		builder.append("<tr>");
		builder.append("<td width='700'>&nbsp;</td>");
		builder.append("</tr>");
		builder.append("<tr>");
		builder.append("<td height='94' background='http://www.goodjobgolf.com/images/common/img_mail_top.gif'>&nbsp;</td>");
		builder.append("</tr>");
		builder.append("<tr>");
		builder.append("<td align='center'><table border='0' cellpadding='0' cellspacing='0' width='650'>");
		builder.append("<tr>");
		builder.append("<td width='650' height='200' background='http://www.goodjobgolf.com/images/common/img_mail_join.gif'>");
		builder.append("</td>");
		builder.append("</tr>");
		builder.append("</table></td>");
		builder.append("</tr>");
		builder.append("<tr>");
		builder.append("<td bgcolor='#58595B' height='170' style='padding-left:8px;padding-right:5px;'><span class=yellow>{0}</span><span class=white_m>회원님께서는 {1}에 회원가입을 하셨으며, 회원가입시 그 이후 메일 수신을 동의하였기에 발송되었습니다.<br>");
		builder.append("<br>");
		builder.append("메일 수신을 원치 않으시면 로그인 후 회원정보로 가셔서 변경하시기 바랍니다.<br>");
		builder.append("(If you do not wish to continue receiving updates from us please log-in and change your E-mailing condition 'yes' to 'no'.)<br>");
		builder.append("* 본 메일은 발신전용입니다. 문의가 있으신 분은</span> <span class=yellow>info@goodjobgolf.com</span> <span class=white_m>으로 문의 메일을 보내주십시오.<br>");
		builder.append("<br>");
		builder.append("사업자등록번호 : 114-81-92021 &nbsp;통신판매업신고번호 : 제 2004-295호 &nbsp;Tel :1588-6670 &nbsp;&nbsp;Fax : 02-6670-0210<br>");
		builder.append("(우) 153-789 서울특별시 금천구 가산동 470-5 에이스테크노타워 10차 509호 (주)세이브코리아 &nbsp;대표이사 정재경</span></td>");
		builder.append("</tr>");
		builder.append("</table>");
		builder.append("</body>");
		builder.append("</html>");
		
		return builder.toString();
	}
}
