package com.Foodiee.DAO;

import java.util.List;

import com.Foodiee.model.User;

public interface UserDAO {

	void addUser(User user);
	User getUser(int userId);
	void updateUser(User user);
	void deleteUser(int userId);
	List<User> getAllUsers();
}
