/*
 * @(#) Mail.java
 * 
 * Copyright 2004. 4. 21.
 * 
 * @author gundallove , gundallover@hotmail.com
 * 
 */

package com.goodjob.mail;
/**
 * 
 * 이 것은 메일 프레임 워크이다.
 * 매일 패키지의 데모 를 보고 완성한것이며 ,  자유로게 배포 할 수 있다.
 * 
 * 사용 정보
 * 기본 properties 파일에 세팅이 되어 있을 겨우는 그냥 생성해서 제목과 메일 내용을
 * 세팅해서 사용하면 된다
 * 
 * Mail mail = new Mail();
 * mail.setTo(to);
 * mail.setFrom(from , name);
 * mail.setSubject(subject);
 * mail.setHtmlContent(content);
 * mail.send();
 * 
 * Mail mail = new Mail(to , from , name);
 * mail.setSubject(subject);
 * mail.setHtmlContent(content);
 * mail.send();
 * 
 *  
 * 메일에 첨부 파일이 들어갈경우
 * Mail mail = new Mail();
 * mail.setSubject(subject);
 * mail.setHtmlContent(content);
 * mail.Addattach(file);
 * mail.send();
 * 
 * Mail.java
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.IllegalWriteException;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Mail {
	
    private String host;							//메일 서버
	private String content;						//메일내용
	private String from;							//보낸사람메일
	private String name;						//보낼사람이름
	private String to;								//받을메일주소
	private String subject;						//메일제목
	private String file;							//파일이름
	private boolean ishtml=false;		//텍스트(false) 메일인지 html(true) 메일인지
	
	private MimeMessage msg = null;			//메일 바디객체
	private InputStream is = null;
	
	/**
	 * 메일 클래스 생성자
	 * 기본 세팅은 properties 파일에서 불러와 세팅한다.
	 * @throws MailException
	 */
	public Mail(String host) throws MailException{
	  
		//메일 서버(smtp)를 세팅한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		
		//메일 세션 생성
		Session session = Session.getDefaultInstance(props, null);
		//Session session = Session.getInstance(props, auth);
		//메일 세션을 메일 메세지에 세팅
		msg = new MimeMessage(session);

	}
	
	public Mail(String host , String id , String pw) throws MailException{
	    
		//메일 서버(smtp)를 세팅한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		
		Authenticator auth = new MyAuthenticator(id,pw);
		
		//메일 세션 생성
		Session session = Session.getInstance(props, auth);
		//메일 세션을 메일 메세지에 세팅
		msg = new MimeMessage(session);

	}
	
	public Mail(String host , String to , String from , String name) throws MailException{

		this.to = to;					//받을메일
	    this.from = from;			//보낼메일
	    this.name = name;		//보낼사람
	    
		//메일 서버(smtp)를 세팅한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		
		//메일 세션 생성
		Session session = Session.getDefaultInstance(props, null);
		//메일 세션을 메일 메세지에 세팅
		msg = new MimeMessage(session);
		
		try{
		    //보낼 사람의 메일주소와 이름을 세팅 한다.
			msg.setFrom(new InternetAddress(from,name));
			
			 //받을사람  메일주소를 세팅 한다.
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			
		} catch(UnsupportedEncodingException ue){
		    throw new MailException("UnsupportedEncodingException" , ue.getMessage());
		}catch(IllegalWriteException ie){
		    throw new MailException("IllegalWriteException" , ie.getMessage());
		}catch(MessagingException me){
		    throw new MailException("MessagingException" , me.getMessage());
		}
	}
	
	/**
	 * <pre>
	 * 받을사람 사람의 메일주소를 세팅한다.
	 * @param to
	 * @throws MailException
	 * </pre>
	 */
	public void setTo(String to) throws MailException{
	    
	    try{
	        //받을사람  메일주소를 세팅 한다.
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	        
	    } catch(MessagingException me){
	        throw new MailException("MessagingException" , me.getMessage());
	    }
	}
	
	/**
	 * <pre>
	 * 보낼 사람의 메일과 이름을 세팅 한다.
	 * @param from
	 * @param name
	 * @throws MailException
	 * </pre>
	 */
	public void setFrom(String from , String name) throws MailException{
	    
	    try{
	        
		    //보낼 사람의 메일주소와 이름을 세팅 한다.
			msg.setFrom(new InternetAddress(from,name));
			
		} catch(UnsupportedEncodingException ue){
		    throw new MailException("UnsupportedEncodingException" , ue.getMessage());
		}catch(IllegalWriteException ie){
		    throw new MailException("IllegalWriteException" , ie.getMessage());
		}catch(MessagingException me){
		    throw new MailException("MessagingException" , me.getMessage());
		}	
	}
	
	/**
	 * <pre>
	 * 보낼 사람의 메일을 세팅 한다.
	 * @param from
	 * @param mailname
	 * @throws MailException
	 * </pre>
	 */
	public void setFrom(String from) throws MailException{
	    
	    try{
	        
		    //보낼 사람의 메일주소와 이름을 세팅 한다.
			msg.setFrom(new InternetAddress(from));
			
		} catch(AddressException ae){
		    throw new MailException("AddressException" , ae.getMessage());
		}catch(IllegalWriteException ie){
		    throw new MailException("IllegalWriteException" , ie.getMessage());
		}catch(MessagingException me){
		    throw new MailException("MessagingException" , me.getMessage());
		}	
	}
	
	/**
	 * <pre>
	 * 보낼 메일의 제목을 세팅한다
	 * @param subject
	 * @throws MailException
	 * </pre>
	 */
	public void setSubject(String subject) throws MailException{
	    
	    try{
	        
	        //보내는 메일의 제목을 세팅하며 언어 세팅을 같이 한다. 기본은 영문
	        msg.setSubject(subject , "euc-kr");
	        //보내는 메일의 날짜를 세팅한다.
	        msg.setSentDate(new Date());
	        
	    } catch(MessagingException me){
	        throw new MailException("MessagingException" , me.getMessage());
	    }
	}
	
	/**
	 * <pre>
	 * 메일 내용이 html 일 경우
	 * @param content
	 * @throws MailException
	 * </pre>
	 */
	public void setHtmlContent(String content) throws MailException{
	    //메일 내용
	    this.content = content;
	    this.ishtml = true;
	}
	
	/**
	 * <pre>
	 * 메일 내용이 단순 text 일 경우
	 * @param content
	 * @throws MailException
	 * </pre>
	 */
	public void setTextContent(String content) throws MailException{
	    
	    //메일 내용
	    this.content = content;
	    this.ishtml = false;
	}
	
	/**
	 * <pre>
	 * 메일 내용이 html 일 경우
	 * @param content
	 * @throws MailException
	 * </pre>
	 */
	public void setHtmlContent(InputStream is) throws MailException{
	    //메일 내용
	    this.is = is;
	    this.ishtml = true;
	}
	
	/**
	 * <pre>
	 * 메일 내용이 단순 text 일 경우
	 * @param content
	 * @throws MailException
	 * </pre>
	 */
	public void setTextContent(InputStream is) throws MailException{
	    
	    //메일 내용
	    this.is = is;
	    this.ishtml = false;
	}
	
	/**
	 * <pre>
	 * 메일 내용이 단순 text 일 경우
	 * @param content
	 * @throws MailException
	 * </pre>
	 */
	public void setContent(String content) throws MailException{
	    
	    try{
	        
	        if(ishtml)		//html 
	            msg.setContent(content, "text/html; charset=euc-kr");
	        else
	            msg.setContent(content, "text/plain; charset=euc-kr");
	        
	    }catch(MessagingException me){
		    throw new MailException("MessagingException" , me.getMessage());
		}
	}
	
	/**
	 * <pre>
	 * 메일 내용이 스트림 일경우 데이터 소스를 통해 메일내용을 세팅한다.
	 * @param is
	 * @throws MailException
	 * </pre>
	 */
	public void setContent(InputStream is) throws MailException{
	    
	    try{	        
	        if(ishtml)
	        	msg.setDataHandler(new DataHandler(new ByteArrayDataSource(is, "text/html; charset=euc-kr")));
	        else
	            msg.setDataHandler(new DataHandler(new ByteArrayDataSource(is, "text/plain; charset=euc-kr")));
	        
	    }catch(MessagingException me){
		    throw new MailException("MessagingException" , me.getMessage());
		}	
	}
	
	/**
	 * <pre>
	 * 메일 내용을 상황에 맞게 세팅해서
	 * 메일내용 객체에 끼워 넣기~
	 * @throws MailException
	 * </pre>
	 */
	public void setContent() throws MailException{
	    
	    //메일의 형식에 따라서 판별한다.
	    if(file == null || file.trim().length() == 0)
	        if(content != null || content.trim().length() !=0)
	            setContent(content);
	        else
	            setContent(is);
	}
	
	/**
	 * <pre>
	 * 보낼 메일에 파일을 첨부 시킨다.
	 * 메일은 파일경로와 파일 이름을 모두 적어 줘야 한다.
	 * @param file
	 * @throws MailException
	 * </pre>
	 */
	public void Addattach(String file) throws MailException{
	    this.file = file;
	    
	    //실제 첨부가 일어나는 메소드
	    setAttach();
	}
	
	/**
	 * <pre>
	 * 메일에 첨부 파일이 들어 갈경우 사용
	 * @throws MailException
	 * </pre>
	 */
	public void setAttach() throws MailException{
	
		try{

			//메일의 내용을 세팅한다.
			MimeBodyPart mbp1 = new MimeBodyPart();	
			
	        if(ishtml)
	            mbp1.setContent(content, "text/html; charset=euc-kr");
	        else
	            mbp1.setContent(content, "text/plain; charset=euc-kr");
	        
			//첨부파일을 위한 바디
			MimeBodyPart mbp2 = new MimeBodyPart();

			//파일을 첨부한다.
			FileDataSource fds = new FileDataSource(file);
			mbp2.setDataHandler(new DataHandler(fds));
			mbp2.setFileName(fds.getName());

			//첨부파일을  바디에 추가 한다.
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp1);
			mp.addBodyPart(mbp2);
			
			//메일 본체에 끼워 넣는다.
			msg.setContent(mp);

		}catch(SendFailedException e){
			e.printStackTrace();
		}catch(AddressException e){
			e.printStackTrace();
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * <pre>
	 * 메일을 보낸다.
	 * @throws MailException
	 * </pre>
	 */
	public void send() throws MailException{
	    
		try{
		    
		    //메일을 보낼때 실제 세팅했던 메일 내용을 담아서 보낸다
		    setContent();
		    
			//실제 메일을 보냄
			Transport.send(msg);
			
		}catch(SendFailedException e){	
		    throw new MailException("SendFailedException" , e.getMessage());
		}catch(AddressException e){
		    throw new MailException("AddressException" , e.getMessage());
		}catch(MessagingException e) {
		    throw new MailException("MessagingException" , e.getMessage());
		}
	}
	
    /**
     * <pre>
     * 자바 메일 패키지에 있는 데모를 가지고 왔으며 , 메일의 첨부파일일 사용시 
     * 파일을 가지고 오는 클래스다.
     * </pre>
	 */
	class ByteArrayDataSource implements DataSource {
	    private byte[] data;	// data
	    private String type;		//메일 타입(text , html)

	    /**
	     * <pre>
	     * Create a DataSource from an input stream
	     * 데이터 소스의 스트림을 연다. 생성자
	     * @param is 스트림을 얻는다
	     * @param type 메일 타입(텍스트 , html )
	     * </pre>
	     */
	    public ByteArrayDataSource(InputStream is, String type) {
	        this.type = type;
	        try {
	            
	            int ch;
	            ByteArrayOutputStream os = new ByteArrayOutputStream();
			    while ((ch = is.read()) != -1)
			        os.write(ch);
		    
		    	data = os.toByteArray();

	        } catch (IOException ioex){
	            ioex.printStackTrace();
	        }
	    }

	    /* Create a DataSource from a byte array */
	    public ByteArrayDataSource(byte[] data, String type) {
	        this.data = data;
	        this.type = type;
	    }

	    /* Create a DataSource from a String */
	    public ByteArrayDataSource(String data, String type) {
			try {
			    this.data = data.getBytes("KSC5601");
			} catch (UnsupportedEncodingException uex) { }
			this.type = type;
	    }

	    /**
	     * Return an InputStream for the data.
	     * Note - a new stream must be returned each time.
	     */
	    public InputStream getInputStream() throws IOException {
			if (data == null)
			    throw new IOException("no data");
			return new ByteArrayInputStream(data);
	    }

	    public OutputStream getOutputStream() throws IOException {
	        throw new IOException("cannot do this");
	    }

	    public String getContentType() {
	        return type;
	    }

	    public String getName() {
	        return "dummy";
	    }
	}
	
	public final class MyAuthenticator extends javax.mail.Authenticator {

	    private String id;
	    private String pw;

	    public MyAuthenticator(String id, String pw) {
	        this.id = id;
	        this.pw = pw;
	    }
	    
	    protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
	        return new javax.mail.PasswordAuthentication(id, pw);
	    }
	}
}