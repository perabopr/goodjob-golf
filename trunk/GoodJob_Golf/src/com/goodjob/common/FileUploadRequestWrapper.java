package com.goodjob.common;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
/**
 * FileUpload API를 사용하는 HttpServletRequestWrapper 클래스로서
 * HttpServletRequest에 기반한 API를 사용하기 위한 래퍼이다.
 */
public class FileUploadRequestWrapper extends HttpServletRequestWrapper {
    
    private boolean multipart = false;
    
    private HashMap parameterMap;
    private HashMap fileItemMap;
    
    /**
     * 기본 생성자
     * @param request
     * @throws FileUploadException
     */
    public FileUploadRequestWrapper(HttpServletRequest request) 
    throws FileUploadException{
        this(request, -1, -1, null);
    }
    
    /**
     * 생성자
     * @param request HttpServletRequest 객체
     * @param threshold 메모리에 저장할 최대크기
     * @param max 업로드할 최대 파일크기
     * @param repositoryPath 업로드 경로
     * @throws FileUploadException
     */
    public FileUploadRequestWrapper(HttpServletRequest request,
        int threshold, int max, String repositoryPath) throws FileUploadException {
        super(request);
        
        parsing(request, threshold, max, repositoryPath);
    }
    
    /**
     * 일반 입력 필드와 파일 필드를 MAP에 저장
     * @param request HttpServletRequest 객체
     * @param threshold 메모리에 저장할 최대크기
     * @param max 업로드할 최대 파일크기
     * @param repositoryPath 업로드 경로
     * @throws FileUploadException
     */
    private void parsing(HttpServletRequest request,
        int threshold, int max, String repositoryPath) throws FileUploadException {
        
        if (FileUpload.isMultipartContent(request)) {
            multipart = true;
            
            parameterMap = new java.util.HashMap();
            fileItemMap = new java.util.HashMap();
            
            DiskFileUpload diskFileUpload = new DiskFileUpload();
            if (threshold != -1) {
                diskFileUpload.setSizeThreshold(threshold);
            }
            diskFileUpload.setSizeMax(max);
            if (repositoryPath != null) {
                diskFileUpload.setRepositoryPath(repositoryPath);
            }
            
            java.util.List list = diskFileUpload.parseRequest(request);
            for (int i = 0 ; i < list.size() ; i++) {
                FileItem fileItem = (FileItem) list.get(i);
                String name = fileItem.getFieldName();
                
                if (fileItem.isFormField()) {
                    String value = fileItem.getString();
                    String[] values = (String[]) parameterMap.get(name);
                    if (values == null) {
                        values = new String[] { value };
                    } else {
                        String[] tempValues = new String[values.length + 1];
                        System.arraycopy(values, 0, tempValues, 0, 1);
                        tempValues[tempValues.length - 1] = value;
                        values = tempValues;
                    }
                    parameterMap.put(name, values);
                } else {
                    fileItemMap.put(name, fileItem);
                }
            }
            addTo(); // request 속성으로 설정한다.
        }
    }
    
    /**
     * 파일을 전송하는 enctype="multipart/form-data"인경우 true리턴
     * @return enctype="multipart/form-data"인경우 true리턴
     */
    public boolean isMultipartContent() {
        return multipart;
    }
    
    /**
     * 주어진 파라미터에 대한 값을 리턴
     */
    public String getParameter(String name) {
        if (multipart) {
            String[] values = (String[])parameterMap.get(name);
            if (values == null) return null;
            return values[0];
        } else
            return super.getParameter(name);
    }
    
    /**
     * 파라미터의 값들을 리턴
     */
    public String[] getParameterValues(String name) {
        if (multipart)
            return (String[])parameterMap.get(name);
        else
            return super.getParameterValues(name);
    }
    
    /**
     * 전체 파라미터의 이름을 리턴
     */
    public Enumeration getParameterNames() {
        if (multipart) {
            return new Enumeration() {
                Iterator iter = parameterMap.keySet().iterator();
                
                public boolean hasMoreElements() {
                    return iter.hasNext();
                }
                public Object nextElement() {
                    return iter.next();
                }
            };
        } else {
            return super.getParameterNames();
        }
    }
    
    public Map getParameterMap() {
        if (multipart)
            return parameterMap;
        else
            return super.getParameterMap();
    }
    
    /**
     * 지정한 파라미터 이름과 관련된 FileItem을 리턴합니다.
     * @param name
     * @return
     */
    public FileItem getFileItem(String name) {
        if (multipart)
            return (FileItem) fileItemMap.get(name);
        else
            return null;
    }
    
    /**
     * 임시로 사용된 업로드 파일을 삭제합니다.
     */
    public void delete() {
        if (multipart) {
            Iterator fileItemIter = fileItemMap.values().iterator();
            while( fileItemIter.hasNext()) {
                FileItem fileItem = (FileItem)fileItemIter.next();
                fileItem.delete();
            }
        }
    }
    
    /**
     * 래퍼객체 자체를 request 객체에 저장합니다.
     */
    public void addTo() {
        super.setAttribute(FileUploadRequestWrapper.class.getName(), this);
    }
    
    /**
     * request 속성에 저장된 FileUploadRequestWrapper를 리턴합니다.
     * @param request
     * @return
     */
    public static FileUploadRequestWrapper 
                  getFrom(HttpServletRequest request) {
        return (FileUploadRequestWrapper)
            request.getAttribute(FileUploadRequestWrapper.class.getName());
    }
    
    /**
     * 지정한 request가 래퍼를 속성으로 포함하고 있으면 true를 리턴합니다.
     * @param request
     * @return
     */
    public static boolean hasWrapper(HttpServletRequest request) {
        if (FileUploadRequestWrapper.getFrom(request) == null) {
            return false;
        } else {
            return true;
        }
    }
} 