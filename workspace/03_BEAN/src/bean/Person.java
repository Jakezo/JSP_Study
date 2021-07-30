package bean;

public class Person {
	
	/*
	 * 자바빈(Java bean)
	 * 
	 * 1. 자바빈 개발 규약에 의한 자바 클래스이다.
	 * 2. 개발규약
	 * 	1) 반드시 특정 패키지에 저장해야 한다.
	 * 	2) 디폴트(default) 생성자가 필요하다. (생성자를 하나도 안 만들면 디폴트가 사용되므로 안 만들어도 된다.)
	 *  3) getter, setter를 추가해야 한다.
	 */
	
	// field
	private String name;
	private int age;
	private char gender;
	// default constructor
	// Person() { }
	// 디폴트 생성자 자동 생성
	
	// method
	public final String getName() {
		return name;
	}
	public final void setName(String name) {
		this.name = name;
	}
	public final int getAge() {
		return age;
	}
	public final void setAge(int age) {
		this.age = age;
	}
	public final char getGender() {
		return gender;
	}
	public final void setGender(char gender) {
		this.gender = gender;
	}

}
