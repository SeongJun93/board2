package com.company.Domain;
public class PagingVO {
	private int listSize = 10; // �ʱⰪ���� ��ϰ����� 10���� ���� �� �������� ������ ����Ʈ�� ����
	private int rangeSize = 5; // �ʱⰪ���� ������������ 5�� ���� �� ������ ������ ������ �������� ����
	private int nowPage = 1; // �������� ������ ��ȣ
	private int nowRange = 1; // �� ������ ���� ���� ��ȣ
	private int listCnt; // ��ü ���ù��� ����
	private int pageCnt; // ��ü ������ ������ ����
	private int startPage; // �� ������ ���� ���� ��ȣ
	private int startListNum; // �Խ��� ���۹�ȣ
	private int endPage; // �� ������ ���� �� ��ȣ
	private boolean prev; // ���� ������
	private boolean next; // ���� ������
	
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


	// ù��° ���� nowPage �� ���� ������ ����, �ι�° ���� nowRange �� ���� ������ ���� ����, ����° ���� listCnt�� �Խù��� �� ����
	// ����¡ �ҽ� ù��°�� �����ؾ��� �� ��ü�Խù� �� ���� ������ ������ ��ȣ,������ ����
	public void pageInfo(int nowPage, int nowRange, int listCnt) {

		this.nowPage = nowPage;

		this.nowRange = nowRange;

		this.listCnt = listCnt;

		// ��ü ��������
		// ��ü ������ ���� = �� �Խñ� ���� / ������ �Խñ� ����
		this.pageCnt = (int) Math.ceil((double) listCnt / listSize);
		
		// ���� ������
		// �� ������ ���� ���� ��ȣ = (�� ������ ���� ���� ��ȣ  - 1) * �ʱⰪ ����¡ ����+1
		// 1/11/21/31/41 ......
		this.startPage = (nowRange - 1) * rangeSize + 1;

		// �� ������
		// �� ������ ���� �� ��ȣ = �� ������ ���� ���� ��ȣ * �ʱⰪ ����¡ ����
		// 10/20/30/40 ......
		this.endPage = nowRange * rangeSize;

		// �Խ��� ���۹�ȣ
		// �Խ��� ���� ��ȣ = (�������� ������ ��ȣ - 1) * ��ϰ���
		// �Խ����� 0�� ���� ���� �ڿ���
		this.startListNum = (nowPage - 1) * listSize;

		// ���� ��ư ����
		// ���׿����� 
		// ���� = ���������� ���� == 1 ? Ʈ��     :  ���� 
		// ���� �������� 1�ϰ�� 1�� Ʈ���̸� false �����̸� ������ư ��ȯ
		this.prev = nowRange == 1 ? false : true;

		// ���� ��ư ����
		// ���׿�����
		//    ����=�������� ���� �� ��ȣ>���������� ?  ��    :  ����
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}
