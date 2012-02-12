<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 결제 결과 출력 PAGE                                               = */
    /* = -------------------------------------------------------------------------- = */
    /* =   pp_ax_hub.jsp 파일에서 처리된 결과값을 출력하는 페이지입니다.            = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://testpay.kcp.co.kr/pgsample/FAQ/search_error.jsp       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2010.02   KCP Inc.   All Rights Reserved.                 = */
    /* ============================================================================== */
%>
<%!
    /* ============================================================================== */
    /* =   null 값을 처리하는 메소드                                                = */
    /* = -------------------------------------------------------------------------- = */
        public String f_get_parm( String val )
        {
          if ( val == null ) val = "";
          return  val;
        }
    /* ============================================================================== */
%>
<%
	request.setCharacterEncoding("UTF-8") ;
    /* ============================================================================== */
    /* =   지불 결과                                                                = */
    /* = -------------------------------------------------------------------------- = */
	String site_cd			= f_get_parm( request.getParameter( "site_cd"		 ) );      // 사이트 코드
    String req_tx           = f_get_parm( request.getParameter( "req_tx"         ) );      // 요청 구분(승인/취소)
    String use_pay_method   = f_get_parm( request.getParameter( "use_pay_method" ) );      // 사용 결제 수단
    String bSucc            = f_get_parm( request.getParameter( "bSucc"          ) );      // 업체 DB 정상처리 완료 여부
    /* = -------------------------------------------------------------------------- = */
    String res_cd           = f_get_parm( request.getParameter( "res_cd"         ) );      // 결과 코드
    String res_msg          = f_get_parm( request.getParameter( "res_msg"        ) );      // 결과 메시지
	String res_msg_bsucc    = "";
    /* = -------------------------------------------------------------------------- = */
    String ordr_idxx        = f_get_parm( request.getParameter( "ordr_idxx"      ) );      // 주문번호
    String tno              = f_get_parm( request.getParameter( "tno"            ) );      // KCP 거래번호
    String good_mny         = f_get_parm( request.getParameter( "good_mny"       ) );      // 결제 금액
    String good_name        = f_get_parm( request.getParameter( "good_name"      ) );      // 상품명
    String buyr_name        = f_get_parm( request.getParameter( "buyr_name"      ) );      // 구매자명
    String buyr_tel1        = f_get_parm( request.getParameter( "buyr_tel1"      ) );      // 구매자 전화번호
    String buyr_tel2        = f_get_parm( request.getParameter( "buyr_tel2"      ) );      // 구매자 휴대폰번호
    String buyr_mail        = f_get_parm( request.getParameter( "buyr_mail"      ) );      // 구매자 E-Mail
    /* = -------------------------------------------------------------------------- = */
	// 공통
	String pnt_issue        = f_get_parm( request.getParameter( "pnt_issue"      ) );      // 포인트 서비스사
    String app_time         = f_get_parm( request.getParameter( "app_time"       ) );      // 승인시간 (공통)
	/* = -------------------------------------------------------------------------- = */
    // 신용카드
    String card_cd          = f_get_parm( request.getParameter( "card_cd"        ) );      // 카드 코드
    String card_name        = f_get_parm( request.getParameter( "card_name"      ) );      // 카드명
	String noinf			= f_get_parm( request.getParameter( "noinf"			 ) );      // 무이자 여부
    String quota            = f_get_parm( request.getParameter( "quota"          ) );      // 할부개월
	String app_no           = f_get_parm( request.getParameter( "app_no"         ) );      // 승인번호
    /* = -------------------------------------------------------------------------- = */
    // 계좌이체
    String bank_name        = f_get_parm( request.getParameter( "bank_name"      ) );      // 은행명
	String bank_code        = f_get_parm( request.getParameter( "bank_code"      ) );      // 은행코드
    /* = -------------------------------------------------------------------------- = */
    // 가상계좌
    String bankname         = f_get_parm( request.getParameter( "bankname"       ) );      // 입금할 은행
    String depositor        = f_get_parm( request.getParameter( "depositor"      ) );      // 입금할 계좌 예금주
    String account          = f_get_parm( request.getParameter( "account"        ) );      // 입금할 계좌 번호
    String va_date          = f_get_parm( request.getParameter( "va_date"        ) );      // 가상계좌 입금마감시간
    /* = -------------------------------------------------------------------------- = */
    // 포인트
    String pt_idno			= f_get_parm( request.getParameter( "pt_idno"		 ) );	   // 결제 및 인증 아이디
	String add_pnt          = f_get_parm( request.getParameter( "add_pnt"        ) );      // 발생 포인트
    String use_pnt          = f_get_parm( request.getParameter( "use_pnt"        ) );      // 사용가능 포인트
    String rsv_pnt          = f_get_parm( request.getParameter( "rsv_pnt"        ) );      // 적립 포인트
    String pnt_app_time     = f_get_parm( request.getParameter( "pnt_app_time"   ) );      // 승인시간
    String pnt_app_no       = f_get_parm( request.getParameter( "pnt_app_no"     ) );      // 승인번호
    String pnt_amount       = f_get_parm( request.getParameter( "pnt_amount"     ) );      // 적립금액 or 사용금액
    /* = -------------------------------------------------------------------------- = */
	//휴대폰
	String commid			= f_get_parm( request.getParameter( "commid"		 ) );      // 통신사 코드
	String mobile_no		= f_get_parm( request.getParameter( "mobile_no"      ) );      // 휴대폰 번호
	/* = -------------------------------------------------------------------------- = */
	//상품권
	String tk_van_code      = f_get_parm( request.getParameter( "tk_van_code"    ) );      // 발급사 코드
	String tk_app_no        = f_get_parm( request.getParameter( "tk_app_no"      ) );      // 승인 번호
	/* = -------------------------------------------------------------------------- = */
    // 현금영수증
    String cash_yn          = f_get_parm( request.getParameter( "cash_yn"        ) );      // 현금 영수증 등록 여부
    String cash_authno      = f_get_parm( request.getParameter( "cash_authno"    ) );      // 현금 영수증 승인 번호
    String cash_tr_code     = f_get_parm( request.getParameter( "cash_tr_code"   ) );      // 현금 영수증 발행 구분
    String cash_id_info     = f_get_parm( request.getParameter( "cash_id_info"   ) );      // 현금 영수증 등록 번호
	/* ============================================================================== */

    String req_tx_name = "";

    if     ( req_tx.equals( "pay" ) ) 
	{ 
		req_tx_name = "지불" ;
	}
    else if( req_tx.equals( "mod" ) )
	{ 
		req_tx_name = "취소/매입" ;
	}

    /* ============================================================================== */
    /* =   가맹점 측 DB 처리 실패시 상세 결과 메시지 설정                           = */
    /* = -------------------------------------------------------------------------- = */

    if ( "pay".equals ( req_tx ) )
    {
        // 업체 DB 처리 실패
        if ( "false".equals ( bSucc ) )
        {
            if ( "0000".equals ( res_cd ) )
			{
                res_msg_bsucc = "결제는 정상적으로 이루어졌지만 쇼핑몰에서 결제 결과를 처리하는 중 오류가 발생하여 시스템에서 자동으로 취소 요청을 하였습니다. <br> 쇼핑몰로 전화하여 확인하시기 바랍니다." ;
			}
            else
			{
				res_msg_bsucc = "결제는 정상적으로 이루어졌지만 쇼핑몰에서 결제 결과를 처리하는 중 오류가 발생하여 시스템에서 자동으로 취소 요청을 하였으나, <br> <b>취소가 실패 되었습니다.</b><br> 쇼핑몰로 전화하여 확인하시기 바랍니다." ;
			}
		}
    }

    /* = -------------------------------------------------------------------------- = */
    /* =   가맹점 측 DB 처리 실패시 상세 결과 메시지 설정 끝                        = */
    /* ============================================================================== */

%>
<html>
<head>
    <title>예약 및 결제완료</title>
    <link href="/kcp/css/sample.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/css/common.css" type="text/css">
    <script type="text/javascript">
        /* 신용카드 영수증 연동 스크립트 */
        function receiptView(tno)
        {
            receiptWin = "http://admin.kcp.co.kr/Modules/Sale/Card/ADSA_CARD_BILL_Receipt.jsp?c_trade_no=" + tno ;
            window.open(receiptWin , "" , "width=420, height=670") ;
        }

		/* 현금영수증 연동 스크립트 */
        function receiptView2( site_cd, order_id, bill_yn, auth_no )
        {
        	receiptWin2 = "https://admin.kcp.co.kr/Modules/Service/Cash/Cash_Bill_Common_View.jsp";
        	receiptWin2 += "?";
        	receiptWin2 += "term_id=PGNW" + site_cd + "&";
        	receiptWin2 += "orderid=" + order_id + "&";
        	receiptWin2 += "bill_yn=" + bill_yn + "&";
        	receiptWin2 += "authno=" + auth_no ;

        	window.open(receiptWin2 , "" , "width=360, height=645");
        }

        function win_close(){
        	window.opener.location.reload();
        	self.close();
        }
    </script>
</head>

<body>
    <div align="center">
	<div style="height:20px;"></div>    
<table border="0" cellpadding="0" cellspacing="0" width="640">
<tr>
<td width="640">
<table border="0" cellpadding="2" cellspacing="1" width="640" bgcolor="#D2D2D2">
<tr>
<td align="center" bgcolor="white" width="615" valign="top">
	        <table border="0" cellpadding="0" cellspacing="0" width="95%">
	          <tr>
	            <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">예약 및 결제완료</td>
	          </tr>
	          <tr>
	            <td><p>&nbsp;</p></td>
	          </tr>
	          <tr>
	            <td align="center" height="250"><img src="/images/booking/img_card_end_title.gif" width="455" height="108" border="0"></td>
	          </tr>
	          <tr>
	            <td height="50" align="center"><a href="javascript:win_close();"><img src="/images/common/btn_confirm.gif" border="0"></a></td>
	          </tr>
	          <tr>
				<td height="200" align="center" width="0">&nbsp;</td>
	          </tr>
	        </table></td>
</tr>
</table></td>
</tr>
</table> 
        
    </div>
</body>
</html>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   결제 결과 코드 및 메시지 출력 끝                                         = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   01. 결제 결과 출력                                                       = */
    /* = -------------------------------------------------------------------------- = */
    if ( "pay".equals ( req_tx ) )
    {
        /* ============================================================================== */
        /* =   01-1. 업체 DB 처리 정상(bSucc값이 false가 아닌 경우)                     = */
        /* = -------------------------------------------------------------------------- = */
        if ( ! "false".equals ( bSucc ) )
        {
            /* ============================================================================== */
            /* =   01-1-1. 정상 결제시 결제 결과 출력 ( res_cd값이 0000인 경우)             = */
            /* = -------------------------------------------------------------------------- = */
            if ( "0000".equals ( res_cd ) ){
	
%>
<script language="javascript" type="text/javascript">
alert("카드 결제가 정상적으로 처리 되었습니다.");
</script>
<%
            }
            else{
            	%>
            	<script language="javascript" type="text/javascript">
            	alert("**카드 결제가 정상적으로 처리되지 못했습니다.\n**다시 결제를 시도해 주세요!!");
            	self.close();
            	</script>
            	<%
            }
            /* = -------------------------------------------------------------------------- = */
            /* =   01-1-1. 정상 결제시 결제 결과 출력 END                                   = */
            /* ============================================================================== */
        }
        /* = -------------------------------------------------------------------------- = */
        /* =   01-1. 업체 DB 처리 정상 END                                              = */
        /* ============================================================================== */
    }
    /* = -------------------------------------------------------------------------- = */
    /* =   01. 결제 결과 출력 END                                                   = */
    /* ============================================================================== */
  
%>