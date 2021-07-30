package bean;

public class User {

	private String name;
	private String age;
	private String gender;
	private String[] hobbies;
	private String address;
	private String[] foods;
	

	public final String getName() {
		return name;
	}

	public final void setName(String name) {
		this.name = name;
	}

	public final String getAge() {
		return age;
	}

	public final void setAge(String age) {
		this.age = age;
	}

	public final String getGender() {
		return gender;
	}

	public final void setGender(String gender) {
		this.gender = gender;
	}

	public final String[] getHobbies() {
		return hobbies;
	}

	public final void setHobbies(String[] hobbies) {
		this.hobbies = hobbies;
	}

	public final String getAddress() {
		return address;
	}

	public final void setAddress(String address) {
		this.address = address;
	}

	public final String[] getFoods() {
		return foods;
	}

	public final void setFoods(String[] foods) {
		this.foods = foods;
	}
	
}
