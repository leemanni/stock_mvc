package com.leemanni.vo;

/**
 * @author cjffy
 *	로그인 확인차 id,pw 객체 VO
 */
public class LoginVO {
	private String id;
	private String pw;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", pw=" + pw + "]";
	}

}
