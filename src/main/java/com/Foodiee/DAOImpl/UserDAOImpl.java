package com.Foodiee.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.Foodiee.DAO.UserDAO;
import com.Foodiee.model.User;
import com.Foodiee.utility.DBConnection;

public class UserDAOImpl implements UserDAO{

	String INSERT_QUERY = "INSERT INTO user(full_name,email,password,phone,address,city,pincode, role, created_at, last_login) Values(?,?,?,?,?,?,?,?,?,?)";

	@Override
	public void addUser(User user) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);

			pstmt.setString(1, user.getFull_name());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getCity());
			pstmt.setString(7, user.getPincode());
			pstmt.setString(8, user.getRole());

			Timestamp now = new Timestamp(System.currentTimeMillis());

			pstmt.setTimestamp(9, now);
			pstmt.setTimestamp(10, now);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("User added successfully.");
			} else {
				System.out.println("Failed to add user.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public User getUser(int userId) {

		String GET_QUERY ="select * from user where user_id = ?";
		Connection connection = DBConnection.getConnection();

		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);
			pstmt.setInt(1, userId);
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				res.getInt("user_id");
				res.getString("full_name");
				res.getString("email");
				res.getString("password");
				res.getString("phone");
				res.getString("address");
				res.getString("city");
				res.getString("pincode");
				res.getString("role");
				res.getTimestamp("Created_at");
				res.getTimestamp("Last_login");			
			}
			
			pstmt.close();
	        connection.close();
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public User getUserByEmail(String email) {

	    User user = null;

	    try (Connection con = DBConnection.getConnection()) {

	        if (con == null) {
	            System.out.println("ERROR: Database connection is NULL");
	            return null;
	        }

	        System.out.println("Searching user with email: " + email);

	        String sql = "SELECT * FROM user WHERE email = ?";

	        try (PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setString(1, email);

	            try (ResultSet rs = ps.executeQuery()) {

	                if (rs.next()) {

	                    System.out.println("User found in database");

	                    user = new User();

	                    user.setUser_id(rs.getInt("user_id"));
	                    user.setFull_name(rs.getString("full_name"));
	                    user.setEmail(rs.getString("email"));
	                    user.setPassword(rs.getString("password"));
	                    user.setPhone(rs.getString("phone"));
	                    user.setAddress(rs.getString("address"));
	                    user.setCity(rs.getString("city"));
	                    user.setPincode(rs.getString("pincode"));
	                    user.setRole(rs.getString("role"));
	                    user.setCreated_at(rs.getTimestamp("created_at"));
	                    user.setLast_login(rs.getTimestamp("last_login"));

	                } else {
	                    System.out.println("User NOT found in database");
	                }
	            }
	        }

	    } catch (Exception e) {

	        System.out.println("ERROR while getting user by email:");
	        e.printStackTrace();
	    }

	    return user;
	}

	@Override
	public void updateUser(User user) {
		String UPDATE_QUERY = "update user set  full_name =?, email=?, password =?, phone = ?, address =?, city =?, pincode =?,role =?, created_at =?, last_login =? where user_id =?"; 

		Connection connection = DBConnection.getConnection();
		
		try {
			
			PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);
			
			pstmt.setString(1, user.getFull_name());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getCity());
			pstmt.setString(7, user.getPincode());
			pstmt.setString(8, user.getRole());

			Timestamp now = new Timestamp(System.currentTimeMillis());

			pstmt.setTimestamp(9, now);
			pstmt.setTimestamp(10, now);
			
			int res = pstmt.executeUpdate();	
			System.out.println(res);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteUser(int userId) {
		
		String DELETE_QUERY = "delete from user where user_id =?";
		
		Connection connection = DBConnection.getConnection();
		
		try {
			
			PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, userId);
			
			int res = pstmt.executeUpdate();
			System.out.println(res);
			
			pstmt.close();
	        connection.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<User> getAllUsers() {
		String GET_ALLUSERS = "select * from user";
		ArrayList<User> list = new ArrayList<User>();
		Connection connection = DBConnection.getConnection();
		
		try {
			Statement stmt = connection.createStatement();
			ResultSet res = stmt.executeQuery(GET_ALLUSERS);
			
			while(res.next()) {
				res.getInt("user_id");
				res.getString("full_name");
				res.getString("email");
				res.getString("password");
				res.getString("phone");
				res.getString("address");
				res.getString("city");
				res.getString("pincode");
				res.getString("role");
				res.getTimestamp("Created_at");
				res.getTimestamp("Last_login");				
			}
			stmt.close();
	        connection.close();	
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
