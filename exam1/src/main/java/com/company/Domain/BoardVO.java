package com.company.Domain;


public class BoardVO {
	private String Board_seq;
	private String reg_id;
	private String Board_content;
	private String Board_pw;
	private String Board_dt;
	private String Board_updt;
	private String Board_title;
	private String id;
	private int rnum;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getBoard_title() {
		return Board_title;
	}
	public void setBoard_title(String board_title) {
		Board_title = board_title;
	}
	public String getBoard_seq() {
		return Board_seq;
	}
	public void setBoard_seq(String board_seq) {
		Board_seq = board_seq;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getBoard_content() {
		return Board_content;
	}
	public void setBoard_content(String board_content) {
		Board_content = board_content;
	}
	public String getBoard_pw() {
		return Board_pw;
	}
	public void setBoard_pw(String board_pw) {
		Board_pw = board_pw;
	}
	public String getBoard_dt() {
		return Board_dt;
	}
	public void setBoard_dt(String board_dt) {
		Board_dt = board_dt;
	}
	public String getBoard_updt() {
		return Board_updt;
	}
	public void setBoard_updt(String board_updt) {
		Board_updt = board_updt;
	}
} 
