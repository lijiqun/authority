package com.sd.entity;

public class Person {
	private Integer personId;
	private String name;
	private String age;
	private String address;
	
	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Person(Integer id, String name, String age, String address) {
		super();
		this.personId = id;
		this.name = name;
		this.age = age;
		this.address = address;
	}
	
	public Integer getId() {
		return personId;
	}
	public void setId(Integer id) {
		this.personId = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Person [address=" + address + ", age=" + age + ", id=" + personId
				+ ", name=" + name + "]";
	}
}
