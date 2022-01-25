package com.company.Domain;

public class AuthorVO {
    
	private String authorId;
    private String authorName;
    private String nationId;
    private String nationName;
    private String authorIntro;
    private String regDate;
    private String updateDate;
    private int rnum;
    private int total_cnt;
    
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getTotal_cnt() {
		return total_cnt;
	}
	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getNationId() {
		return nationId;
	}
	public void setNationId(String nationId) {
		this.nationId = nationId;
		if(nationId.equals("01")) {
			this.nationName = "국내";
		}else {
			this.nationName = "국외";
		}
	}
	public String getNationName() {
		return nationName;
	}
	public void setNationName(String nationName) {
		this.nationName = nationName;
	}
	public String getAuthorIntro() {
		return authorIntro;
	}
	public void setAuthorIntro(String authorIntro) {
		this.authorIntro = authorIntro;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
    
}
