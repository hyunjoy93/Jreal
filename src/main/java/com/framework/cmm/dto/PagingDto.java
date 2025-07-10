package com.framework.cmm.dto;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.framework.cmm.configuration.Constant;

public class PagingDto {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
    /** 페이지 번호*/
    private int pageNo;
    
	/** 게시 글 수*/
    private int pageSize;
    
	/** 페이지 네비 수*/
    private int naviSize;
    
    /** 첫 번째 페이지 번호*/
    private int firstPageNo;
    
    /** 이전 페이지 번호*/
    private int prevPageNo;
    
    /** 시작 페이지 (페이징 네비 기준)*/
    private int startPageNo;
    
    /** 끝 페이지 (페이징 네비 기준)*/
    private int endPageNo;
    
    /** 다음 페이지 번호*/
    private int nextPageNo;
    
    /** 마지막 페이지 번호*/
    private int finalPageNo;
    
    /** 게시 글 전체 수*/
    private int totalCount;
    
    /** 이전페이지 여부*/
    private String prevYn;

    /** 다음페이지 여부*/
    private String nextYn;

    /**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the naviSize
	 */
	public int getNaviSize() {
		return naviSize;
	}

	/**
	 * @param naviSize the naviSize to set
	 */
	public void setNaviSize(int naviSize) {
		this.naviSize = naviSize;
	}

	/**
	 * @return the firstPageNo
	 */
	public int getFirstPageNo() {
		return firstPageNo;
	}

	/**
	 * @param firstPageNo the firstPageNo to set
	 */
	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}

	/**
	 * @return the prevPageNo
	 */
	public int getPrevPageNo() {
		return prevPageNo;
	}

	/**
	 * @param prevPageNo the prevPageNo to set
	 */
	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}

	/**
	 * @return the startPageNo
	 */
	public int getStartPageNo() {
		return startPageNo;
	}

	/**
	 * @param startPageNo the startPageNo to set
	 */
	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	/**
	 * @return the pageNo
	 */
	public int getPageNo() {
		return pageNo;
	}

	/**
	 * @param pageNo the pageNo to set
	 */
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	/**
	 * @return the endPageNo
	 */
	public int getEndPageNo() {
		return endPageNo;
	}

	/**
	 * @param endPageNo the endPageNo to set
	 */
	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	/**
	 * @return the nextPageNo
	 */
	public int getNextPageNo() {
		return nextPageNo;
	}

	/**
	 * @param nextPageNo the nextPageNo to set
	 */
	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	/**
	 * @return the finalPageNo
	 */
	public int getFinalPageNo() {
		return finalPageNo;
	}

	/**
	 * @param finalPageNo the finalPageNo to set
	 */
	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}

	/**
	 * @return the totalCount
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @param totalCount the totalCount to set
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * @return the prevYn
	 */
	public String getPrevYn() {
		return prevYn;
	}

	/**
	 * @param prevYn the prevYn to set
	 */
	public void setPrevYn(String prevYn) {
		this.prevYn = prevYn;
	}

	/**
	 * @return the nextYn
	 */
	public String getNextYn() {
		return nextYn;
	}

	/**
	 * @param nextYn the nextYn to set
	 */
	public void setNextYn(String nextYn) {
		this.nextYn = nextYn;
	}

	/**
     * 페이징을 생성 한다.
	 * @param addObjectName 
	 * @param map 
     */
	public void makePaging(Map<String, Object> map, String addObjectName) {

		this.setTotalCount((int) map.get("total_count"));
		this.setPageNo((int) map.get("pageNo"));
		this.setPageSize((int) map.get("pageSize"));
		this.setNaviSize((int) map.get("naviSize"));
		
		if (0 < this.getTotalCount()) {
			
			// 마지막 페이지
			int finalPage = 0;
			int nDivision = (this.getTotalCount() / this.getPageSize());
			int nRemainder  = (this.getTotalCount() % this.getPageSize()); 
			
			if(0 == nRemainder) {
				finalPage = nDivision;
			}else {
				finalPage = (nDivision + 1);
			}
			
			if (this.getPageNo() > finalPage) {
				this.setPageNo(finalPage);
			}
			
			if (this.getPageNo() < 0 || this.getPageNo() > finalPage) {
				this.setPageNo(Constant.DEFAULT_PAGE_NO);
			}
			
			// 시작 페이지 (페이징 네비 기준)
	        int startPage = ((this.getPageNo() - 1) / this.getNaviSize()) * this.getNaviSize() + 1; 
	        
	        // 끝 페이지 (페이징 네비 기준)
	        int endPage = (startPage + this.getNaviSize()) - 1;

	        // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우
	        if (endPage > finalPage) {
	            endPage = finalPage;
	        }
	        
	        this.setStartPageNo(startPage);
	        this.setEndPageNo(endPage);
	        this.setFinalPageNo(finalPage);
	        
	        // 시작 페이지 (전체), 마지막 페이지 (전체)
	        boolean isNowFirst = this.getPageNo() == 1 ? true : false;
	        boolean isNowFinal = this.getEndPageNo() == this.getFinalPageNo() ? true : false;
			
	        this.setFirstPageNo(1); // 첫 번째 페이지 번호
			
	        // 이전 페이지 번호
	        if (isNowFirst) {
	            this.setPrevPageNo(1); 
	            this.setPrevYn(Constant.DEFAULT_STRING_N);
	        } else {
	        	this.setPrevPageNo(this.getStartPageNo() - 1);
	        }
	        
	        // 이전 다음 페이지 여부
	        if(this.getStartPageNo() > this.getNaviSize()) {
	        	this.setPrevYn(Constant.DEFAULT_STRING_Y);
	        	if(0 < ((this.getEndPageNo() * this.getPageSize()) -  this.getTotalCount())) {
	        		this.setNextYn(Constant.DEFAULT_STRING_N);
	        	}else {
	        		this.setNextYn(Constant.DEFAULT_STRING_Y);
	        	}
	        }else {
	        	this.setPrevYn(Constant.DEFAULT_STRING_N);
	        	this.setNextYn(Constant.DEFAULT_STRING_N);
	        }
	        		
	        // 다음 페이지 번호
	        if (isNowFinal) {
	            this.setNextPageNo(finalPage); 
	            this.setNextYn(Constant.DEFAULT_STRING_N);
	        } else {
	        	this.setNextPageNo(this.getEndPageNo() + 1);
	        	this.setNextYn(Constant.DEFAULT_STRING_Y);
	        }

        }
		
		log.debug("====================================== makePaging ======================================" + "\n" + this.toString());
	}

	@Override
	public String toString() {
		return "PagingDto [log=" + log + ", pageNo=" + pageNo + ", pageSize=" + pageSize + ", naviSize=" + naviSize
				+ ", firstPageNo=" + firstPageNo + ", prevPageNo=" + prevPageNo + ", startPageNo=" + startPageNo
				+ ", endPageNo=" + endPageNo + ", nextPageNo=" + nextPageNo + ", finalPageNo=" + finalPageNo
				+ ", totalCount=" + totalCount + ", prevYn=" + prevYn + ", nextYn=" + nextYn + "]";
	}	

}


