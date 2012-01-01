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

	//어드민쪽 DAO랑 사용자쪽 DAO가 틀려요 근데 왜 안되는지 몰겠네여;
	PackageDao pkDao = new PackageDao();
	List<RegionDto> arrRegions = pkDao.getRegionList("1");
	
	CondoReserveDao cdDao = new CondoReserveDao();
	
	List<CondoDto> condoList = cdDao.getCondoList(region+"");
	
%>
<table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" height="650" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>콘도예약</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">콘도예약</td>
                                            </tr>
                                            <tr>
                                              <td><p>&nbsp;</p></td>
                                            </tr>
                                            <tr>
                                              <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td height="30" align="right" style="padding-right:18px;">
                                                    <% 
														if (arrRegions != null && !arrRegions.isEmpty()){
															for(int i = 0; i < arrRegions.size();i++){
																if(region == arrRegions.get(i).getRegion_seq()){
													%>
															<span class=blue><%=arrRegions.get(i).getRegion_name()%></a></span> &nbsp;I &nbsp;
													<%
																}
																else{
													%>
															<a href="/forGolfbooking/reserve.jsp?menu=5&region=<%=arrRegions.get(i).getRegion_seq() %>" class=area><%=arrRegions.get(i).getRegion_name()%></a> &nbsp;I &nbsp;
													<%				
																}
															}
														}
													%>
                                                    </td>
                                                  </tr>
                                                  <tr>
                                                    <td align="center">
                                                    <table border="0" width="669" cellpadding="0" cellspacing="0">
                                                      <tr>
					<%
										if(condoList != null && !condoList.isEmpty()){
											
											String img_dir = Config.get("reserve_img");
											int size = condoList.size();
											
											int remainder = size%2;
											
											CondoDto cdDto;
											for(int i = 0 ; i < size ; i++){
												
												cdDto = condoList.get(i);
												
												if(i!=0 && i%2==0){
					%>                                    
                                                     </tr>
                                                  </table>
                                                  <div style="height:20px;"></div>
                                                  <table border="0" width="669" cellpadding="0" cellspacing="0">
                                                      <tr>
                                                        
                      <%
												}
                      %>                                    
                                                         <td width="325" valign="top">
                                                          <table border="0" cellpadding="0" cellspacing="0" width="325">
                                                              <tr>
                                                                <td colspan="2" width="325"><table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="#D1D3D4">
                                                                    <tr>
                                                                      <td bgcolor="white" height="120" align="center"><table cellpadding="0" cellspacing="0" width="313">
                                                                          <tr>
                                                                            <td width="313" height="110" bgcolor="#F1F1F1" align="center"><img src="<%=img_dir%><%=cdDto.getImg_main()%>" width="313" height="110"/></td>
                                                                          </tr>
                                                                        </table></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              <tr>
                                                                <td colspan="2">&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                <td class="cc_name" colspan="2"><%=cdDto.getCondo_name()%></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="225"><span class=normal_fee_b><strike>정상가:주중<%=Utils.numberFormat(cdDto.getPrice_n1())%>원 / 주말<%=Utils.numberFormat(cdDto.getPrice_n1())%>원</strike></span></td>
                                                                <td width="100" rowspan="2" align="center" valign="bottom"><a href="detail.jsp?menu=5&condo_seq=<%=cdDto.getCondo_seq()%>"><img align="absmiddle" src="../../images/common/btn_regist_booking.gif" width="89" height="34" border="0"></a></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="225"><span class=mem_fee_b>회원가:주중 <%=Utils.numberFormat(cdDto.getPrice_s1())%>원 / 주말 <%=Utils.numberFormat(cdDto.getPrice_s1())%>원</span></td>
                                                              </tr>
                                                            </table>
                                                            </td>
                                                          	<td width="19">&nbsp;</td>
					<%
											}
										}
					%>                                   </tr>
                                                      </table>
                                                	</td>
                                                  </tr>
                                                  <tr>
                                                    <td>&nbsp;</td>
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