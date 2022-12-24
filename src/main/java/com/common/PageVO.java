package com.common;

public class PageVO {

	
	private int nowPage;    // 현제페이지
	private int pageSize;   // 한 페이지에 보여줄 글 개수
	private int pageBlock;  // 페이지 목록 단위 수
	
	private int startRow;   // 시작글
	private int endRow;     // 마지막 글
	
	private int startPage;  // 시작 페이지
	private int endPage;    // 마지막 페이지
	
	private int count;      // 전체 글수
	private int pageCount;  // 전체 페이지

	public void rowCalculate(int nowPage) {
		this.nowPage = nowPage;
		startRow = (nowPage - 1) * pageSize;
		endRow = startRow + pageSize - 1;
	}

	public void pageCalculate(Integer count) {
		this.count = count;
		startPage = (nowPage - 1) / pageBlock * pageBlock + 1;
		endPage = startPage + pageBlock - 1;
		pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}		
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	

}
