package com.example.SportyShoesApp.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private String fname;
	private String lname;
	private String mobile_no;
	private String username;
	private String password;
	
	@Embedded
	private Address address;
	
	public User() {
		super();
	}
	public User(String fname, String lname, String mobileNo, String username, String password,Address address) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.mobile_no = mobileNo;
		this.username = username;
		this.password = password;
		this.address = address;
		//this.orders=orders;
	}
	public User(int id, String fname, String lname, String mobileNo, String username, String password,Address address) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.mobile_no = mobileNo;
		this.username = username;
		this.password = password;
		this.address = address;
		//this.orders=orders;
	}
	
	public User(String fname, String lname, String mobileNo, String username, Address address) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.mobile_no = mobileNo;
		this.username = username;
		this.address = address;
		//this.orders=orders;
	}
	
	public User(String fname, String lname, String mobile_no, String username, String password) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.mobile_no = mobile_no;
		this.username = username;
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
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
//	public List<Orders> getOrders() {
//		return orders;
//	}
//	public void setOrders(List<Orders> orders) {
//		this.orders = orders;
//	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", fname=" + fname + ", lname=" + lname + ", mobileNo=" + mobile_no + ", username="
				+ username + "]";
	}
}
