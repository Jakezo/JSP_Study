package bean;

public class User {

	// 필드
	String id;
	String pw;
	
	// 생성자 (디폴트 생성자만 사용하려면 안 만들면 되고, 디폴트 생성자 + 필드를 이용한 생성자를 사용하려면 둘 다 만들어야 한다.)
	public User() { /* 디폴트 생성자  */ }

	public User(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	
	// 메소드(getter, setter)
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
	
}
