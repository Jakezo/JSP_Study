package dto;

public class PersonDto {

	private String name;
	private int age;
	private String address;
	private char gender;
	private String[] interests;
	
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
	public final String getAddress() {
		return address;
	}
	public final void setAddress(String address) {
		this.address = address;
	}
	public final char getGender() {
		return gender;
	}
	public final void setGender(char gender) {
		this.gender = gender;
	}
	public final String[] getInterests() {
		return interests;
	}
	public final void setInterests(String[] interests) {
		this.interests = interests;
	}
	
	
	
}
