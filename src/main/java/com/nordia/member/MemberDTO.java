package com.nordia.member;

public class MemberDTO {
	
	private int user_no;
	private String user_id;
	private String user_pw;
	private String email;
	private String tel;
	private int letter;
	private String job_dt ;
	private int use_yn;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getuser_pw() {
		return user_pw;
	}
	public void setuser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getLetter() {
		return letter;
	}
	public void setLetter(int letter) {
		this.letter = letter;
	}
	public String getJob_dt() {
		return job_dt;
	}
	public void setJob_dt(String job_dt) {
		this.job_dt = job_dt;
	}
	public int getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(int use_yn) {
		this.use_yn = use_yn;
	}
	
	
	
}
