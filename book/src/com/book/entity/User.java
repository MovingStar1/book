package com.book.entity;

public class User {
	private int uid;
	private String username;
	private String password;
    private String phonenumber;
    private String address;
    public User() {
		// TODO Auto-generated constructor stub
	}
    public User(String username,String password){
    	super();
    	this.username=username;
    	this.password=password;
    }
    public User(String username,String phonenumber,String password){
    	super();
    	this.username=username;
    	this.phonenumber=phonenumber;
    	this.password=password;
    }
	public User(int uid, String username, String password, String phonenumber,
			String address) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.phonenumber = phonenumber;
		this.address = address;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", phonenumber=" + phonenumber + ", address="
				+ address + "]";
	}

}
