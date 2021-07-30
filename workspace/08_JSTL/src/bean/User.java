package bean;

import java.sql.Date;

public class User {

	private String id;
	private String pw;
	private Date regDate;
	
	public User() { }

	public User(String id, String pw, Date regDate) {
		super();
		this.id = id;
		this.pw = pw;
		this.regDate = regDate;
	}

	public final String getId() {
		return id;
	}

	public final void setId(String id) {
		this.id = id;
	}

	public final String getPw() {
		return pw;
	}

	public final void setPw(String pw) {
		this.pw = pw;
	}

	public final Date getRegDate() {
		return regDate;
	}

	public final void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
