package com.Foodiee.model;

import java.sql.Timestamp;

public class User {

    private int user_id;
    private String full_name;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String city;
    private String pincode;
    private String role;
    private Timestamp created_at;
    private Timestamp last_login;

    public User() {

    }

    public User(String full_name, String email, String password, String phone,
            String address, String city, String pincode, String role,
            Timestamp created_at, Timestamp last_login) {

        this.full_name = full_name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.city = city;
        this.pincode = pincode;
        this.role = role;
        this.created_at = created_at;
        this.last_login = last_login;
    }

    public User(int user_id, String full_name, String email, String password,
            String phone, String address, String city, String pincode,
            String role, Timestamp created_at, Timestamp last_login) {

        this.user_id = user_id;
        this.full_name = full_name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.city = city;
        this.pincode = pincode;
        this.role = role;
        this.created_at = created_at;
        this.last_login = last_login;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getLast_login() {
        return last_login;
    }

    public void setLast_login(Timestamp last_login) {
        this.last_login = last_login;
    }

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", full_name=" + full_name + ", email=" + email + ", password=" + password
				+ ", phone=" + phone + ", address=" + address + ", city=" + city + ", pincode=" + pincode + ", role="
				+ role + ", created_at=" + created_at + ", last_login=" + last_login + "]";
	}

    
}