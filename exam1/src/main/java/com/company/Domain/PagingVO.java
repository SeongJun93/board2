package com.company.Domain;
public class PagingVO {
	private int listSize = 10; // 초기값으로 목록개수를 10으로 셋팅 한 페이지당 보여질 리스트의 개수
	private int rangeSize = 5; // 초기값으로 페이지범위를 5로 셋팅 한 페이지 범위에 보여질 페이지의 개수
	private int nowPage = 1; // 현재목록의 페이지 번호
	private int nowRange = 1; // 각 페이지 범위 시작 번호
	private int listCnt; // 전체 개시물의 개수
	private int pageCnt; // 전체 페이지 범위의 개수
	private int startPage; // 각 페이지 범위 시작 번호
	private int startListNum; // 게시판 시작번호
	private int endPage; // 각 페이지 범위 끝 번호
	private boolean prev; // 이전 페이지
	private boolean next; // 다음 페이지
	
	public int getListSize() {
		return listSize;
	}


	public void setListSize(int listSize) {
		this.listSize = listSize;
	}


	public int getRangeSize() {
		return rangeSize;
	}


	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}


	public int getNowPage() {
		return nowPage;
	}


	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}


	public int getNowRange() {
		return nowRange;
	}


	public void setNowRange(int nowRange) {
		this.nowRange = nowRange;
	}


	public int getListCnt() {
		return listCnt;
	}


	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}


	public int getPageCnt() {
		return pageCnt;
	}


	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getStartListNum() {
		return startListNum;
	}


	public void setStartListNum(int startListNum) {
		this.startListNum = startListNum;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	// 첫번째 인자 nowPage 는 현재 페이지 정보, 두번째 인자 nowRange 는 현재 페이지 범위 정보, 세번째 인자 listCnt는 게시물의 총 개수
	// 페이징 할시 첫번째로 세팅해야할 것 전체게시물 수 현재 보여줄 페이지 번호,페이지 범위
	public void pageInfo(int nowPage, int nowRange, int listCnt) {

		this.nowPage = nowPage;

		this.nowRange = nowRange;

		this.listCnt = listCnt;

		// 전체 페이지수
		// 전체 페이지 갯수 = 총 게시글 갯수 / 보여줄 게시글 갯수
		this.pageCnt = (int) Math.ceil((double) listCnt / listSize);
		
		// 시작 페이지
		// 각 페이지 범위 시작 번호 = (각 페이지 범위 시작 번호  - 1) * 초기값 페이징 갯수+1
		// 1/11/21/31/41 ......
		this.startPage = (nowRange - 1) * rangeSize + 1;

		// 끝 페이지
		// 각 페이지 범위 끝 번호 = 각 페이지 범위 시작 번호 * 초기값 페이징 갯수
		// 10/20/30/40 ......
		this.endPage = nowRange * rangeSize;

		// 게시판 시작번호
		// 게시판 시작 번호 = (현재목록의 페이지 번호 - 1) * 목록갯수
		// 게시판은 0번 부터 시작 뒤에서
		this.startListNum = (nowPage - 1) * listSize;

		// 이전 버튼 상태
		// 삼항연산자 
		// 이전 = 현재페이지 범위 == 1 ? 트루     :  거짓 
		// 현제 페이지가 1일경우 1이 트루이면 false 거짓이면 이전버튼 반환
		this.prev = nowRange == 1 ? false : true;

		// 다음 버튼 상태
		// 삼항연산자
		//    다음=각페이지 범위 끝 번호>페이지갯수 ?  참    :  거짓
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}
