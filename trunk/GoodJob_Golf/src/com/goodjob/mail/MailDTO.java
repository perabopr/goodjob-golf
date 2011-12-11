/*
 * 작성된 날짜: 2005. 1. 6.
 *
 * TODO 생성된 파일에 대한 템플리트를 변경하려면 다음으로 이동하십시오.
 * 창 - 환경 설정 - Java - 코드 스타일 - 코드 템플리트
 */
package com.goodjob.mail;

import java.util.List;

/**
 * @author gundallove
 *
 * TODO 생성된 유형 주석에 대한 템플리트를 변경하려면 다음으로 이동하십시오.
 * 창 - 환경 설정 - Java - 코드 스타일 - 코드 템플리트
 */
public class MailDTO {
    
    private String host;
	private String content;					//메일내용
	private String mailfrom;				//보낸사람메일
	private String mailname;				//보낼사람이름
	private String mailto;					//받을메일주소
	private String subject;					//메일제목
	private String filename;				//파일이름
	private List maillist;						//메일링리스트
	private boolean ishtml;

    /**
     * 생성자
     */
    public MailDTO() {}

    /**
     * @return content을 리턴합니다.
     */
    public String getContent() {
        return content;
    }
    /**
     * @param content 설정하려는 content.
     */
    public void setContent(String content) {
        this.content = content;
    }
    /**
     * @return filename을 리턴합니다.
     */
    public String getFilename() {
        return filename;
    }
    /**
     * @param filename 설정하려는 filename.
     */
    public void setFilename(String filename) {
        this.filename = filename;
    }
    /**
     * @return host을 리턴합니다.
     */
    public String getHost() {
        return host;
    }
    /**
     * @param host 설정하려는 host.
     */
    public void setHost(String host) {
        this.host = host;
    }
    /**
     * @return ishtml을 리턴합니다.
     */
    public boolean isIshtml() {
        return ishtml;
    }
    /**
     * @param ishtml 설정하려는 ishtml.
     */
    public void setIshtml(boolean ishtml) {
        this.ishtml = ishtml;
    }
    /**
     * @return mailfrom을 리턴합니다.
     */
    public String getMailfrom() {
        return mailfrom;
    }
    /**
     * @param mailfrom 설정하려는 mailfrom.
     */
    public void setMailfrom(String mailfrom) {
        this.mailfrom = mailfrom;
    }
    /**
     * @return maillist을 리턴합니다.
     */
    public List getMaillist() {
        return maillist;
    }
    /**
     * @param maillist 설정하려는 maillist.
     */
    public void setMaillist(List maillist) {
        this.maillist = maillist;
    }
    /**
     * @return mailname을 리턴합니다.
     */
    public String getMailname() {
        return mailname;
    }
    /**
     * @param mailname 설정하려는 mailname.
     */
    public void setMailname(String mailname) {
        this.mailname = mailname;
    }
    /**
     * @return mailto을 리턴합니다.
     */
    public String getMailto() {
        return mailto;
    }
    /**
     * @param mailto 설정하려는 mailto.
     */
    public void setMailto(String mailto) {
        this.mailto = mailto;
    }
    /**
     * @return subject을 리턴합니다.
     */
    public String getSubject() {
        return subject;
    }
    /**
     * @param subject 설정하려는 subject.
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }
}
