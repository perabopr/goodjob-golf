package com.goodjob.util;

/**
 * <code>PageNavigater.java</code>
 * @Description : 리스트 페이징 유틸
 * @since 2009. 04. 05
 * @version 1.0
 */
public class PageNavigater {
	
	private int pageSize 	= 10;		// 한페이지당 게시물수
	private int blockSize 	= 10;      	// 블럭당 페이지수
	private int totalCount = 0;		// 전체 레코드수
	private int totalPage 	= 0;		// 전체 페이지수
	
	private int npage		= 1 ;		// 현재 페이지
	private int stnum		= 0 ;		// 시작 로우
	private int ednum		= 0 ;		// 끝 로우
	
	public PageNavigater(int npage){
		this.npage = npage;
		setRowNum();
	}
	
	public PageNavigater(int npage, int pageSize){
		this.npage = npage;
		this.pageSize = pageSize;
		setRowNum();
	}
	
	public PageNavigater(int npage, int pageSize, int blockSize){
		this.npage = npage;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		setRowNum();
	}
	
	/**
	 * start rownum 과 end rownum 구한다~
	 *
	 */
	private void setRowNum(){
		this.stnum = (this.npage-1) * this.pageSize; 	// rownum 시작 번호
		this.ednum = this.pageSize * this.npage; 		// rownum 끝 번호
	}
	
	public int getStartNum(){
		return this.stnum;
	}
	
	public int getEndNum(){
		return this.ednum;
	}
	
	public int getTotalPage(){
		return this.totalPage;
	}
	
	/**
	 * 전체 페이지수를 구한다~
	 *
	 */
	private void setTotalPage(){
		if(this.totalCount % this.pageSize == 0){
			this.totalPage = this.totalCount / this.pageSize;
		} else{
			this.totalPage = (this.totalCount / this.pageSize) + 1;
		}		
		if(this.totalPage == 0){
			this.totalPage = 1;
		}
	}
	
	
	
	/**
	 * 페이징
	 * @param totalCount 전체카운트
	 * @param isDisable 이미지활성화 true-비활성화 false-활성화
	 * @return String
	 */
	public String getPaging(int totalCount, boolean isDisable){
		this.totalCount = totalCount;
		this.setTotalPage();
		
		StringBuffer str 	= new StringBuffer();
		// onMouseOver=\"roll_over(this, true);\" onMouseOut=\"roll_over(this,false);\"
		String firstImage 	= "<img class=\"paging01\" src=\"/_admin/images/board/btn_prev_dual.gif\" border=\"0\" alt=\"처음페이지\" >";
		String prevImage 	= "<img class=\"paging01\" src=\"/_admin/images/board/btn_prev.gif\" border=\"0\" alt=\"이전페이지\" >";
		String nextImage 	= "<img class=\"paging01\" src=\"/_admin/images/board/btn_next.gif\" border=\"0\" alt=\"다음페이지\" >";
		String lastImage 	= "<img class=\"paging01\" src=\"/_admin/images/board/btn_next_dual.gif\" border=\"0\" alt=\"마지막페이지\" >";
		
		int blockCnt = 1; //현재 블럭 번호

		blockCnt = (npage - 1) / blockSize + 1;

		int startPage 	= ((blockCnt-1)*blockSize)+1; 	//블럭시작페이지
		int nextPage 	= (blockCnt*blockSize)+1; 		//다음블럭시작페이지
		int prePage 	= ((blockCnt-2)*blockSize)+1; 	//이전블럭시작페이지
		
		
		str.append("<div>\n");
		
		//처음페이지
		if(npage != 1){
			str.append("<A HREF=\"javascript:goPage('1');\">"+firstImage+"</A>< \n");
		} else{
			if(!isDisable){
				str.append("<li class=\"imgPage\"><A HREF=\"#\">"+firstImage+"</a></li> \n");
			}
		}
		
		//이전페이지
		if(prePage > 0){
			str.append("<A HREF=\"javascript:goPage('"+prePage+"');\">"+prevImage+"</A> \n");
		} else{
			if(!isDisable){
				str.append("<A HREF=\"#\">"+prevImage+"</a> \n");
			}
		}
		
		//페이지
		for(int i = startPage; i < (startPage + blockSize); i++){

			if(i > totalPage){
				break;
			}
			
			if(i == npage){
				str.append("<A HREF=\"#\">" + i + "</a>\n");
			} else{
				str.append("<a href=\"javascript:goPage('"+i+"');\">" + i + "</a>\n");
			}
		}
		
		//다음페이지
		if(nextPage <= totalPage){
			str.append("<A HREF=\"javascript:goPage('"+nextPage+"');\">"+nextImage+"</A> \n");
		} else{
			if(!isDisable){
				str.append("<A HREF=\"#\">"+nextImage+"</a> \n");
			}
		}
		
		//마지막페이지
		if(npage != totalPage){
			str.append("<A HREF=\"javascript:goPage('"+totalPage+"');\">"+lastImage+"</A> \n");
		} else{
			if(!isDisable){
				str.append("<A HREF=\"#\">"+lastImage+"</a> \n");
			}
		}
		str.append("</div>\n");
		
		return str.toString();
	}
	
	
}