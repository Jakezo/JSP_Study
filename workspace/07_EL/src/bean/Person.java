package bean;

public class Person {
	
	// field
	private String name;
	private int age;
	private char gender;
	
	// constructor
	public Person() {
		
	}

	public Person(String name, int age, char gender) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
	}

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
