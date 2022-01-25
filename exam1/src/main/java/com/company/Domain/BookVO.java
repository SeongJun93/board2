package com.company.Domain;

public class BookVO {
	private String BookId;
	private String BookName;
	private int authorId;
	private String PubleYear;
	private String publisher;
	private String cateCode;
	private int BookPrice;
	private int BookStock;
	private double BookDiscount;
	private String BookIntro;
	private String BookContents;
	private String regDate;
	private String updtDate;
	
	
	public String getBookId() {
		return BookId;
	}
	public void setBookId(String bookId) {
		BookId = bookId;
	}
	public String getBookName() {
		return BookName;
	}
	public void setBookName(String bookName) {
		BookName = bookName;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public String getPubleYear() {
		return PubleYear;
	}
	public void setPubleYear(String publeYear) {
		PubleYear = publeYear;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public int getBookPrice() {
		return BookPrice;
	}
	public void setBookPrice(int bookPrice) {
		BookPrice = bookPrice;
	}
	public int getBookStock() {
		return BookStock;
	}
	public void setBookStock(int bookStock) {
		BookStock = bookStock;
	}
	public double getBookDiscount() {
		return BookDiscount;
	}
	public void setBookDiscount(double bookDiscount) {
		BookDiscount = bookDiscount;
	}
	public String getBookIntro() {
		return BookIntro;
	}
	public void setBookIntro(String bookIntro) {
		BookIntro = bookIntro;
	}
	public String getBookContents() {
		return BookContents;
	}
	public void setBookContents(String bookContents) {
		BookContents = bookContents;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdtDate() {
		return updtDate;
	}
	public void setUpdtDate(String updtDate) {
		this.updtDate = updtDate;
	}
	
}
