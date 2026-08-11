package com.Foodiee.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Foodiee.DAO.RestaurantDAO;
import com.Foodiee.model.Restaurant;
import com.Foodiee.utility.DBConnection;

public class RestaurantDAOImpl  implements RestaurantDAO{

	String Insert_Query ="insert into restaurant(restaurant_name,owner_name,phone, email, address, city, rating, opening_time, closing_time, cuisine_type, Image_path) Values(?,?,?,?,?,?,?,?,?,?,?)";
	@Override
	public void addRestaurant(Restaurant restaurant) {
		
		Connection connection  = DBConnection.getConnection();
		
		try {
			
			PreparedStatement pstmt = connection.prepareStatement(Insert_Query);
			
	        pstmt.setString(1, restaurant.getRestaurant_name());
	        pstmt.setString(2, restaurant.getOwner_name());
	        pstmt.setString(3, restaurant.getPhone());
	        pstmt.setString(4, restaurant.getEmail());
	        pstmt.setString(5, restaurant.getAddress());
	        pstmt.setString(6, restaurant.getCity());
	        pstmt.setDouble(7, restaurant.getRating());
	        pstmt.setTime(8, java.sql.Time.valueOf(restaurant.getOpening_time()));
	        pstmt.setTime(9, java.sql.Time.valueOf(restaurant.getClosing_time()));
	        pstmt.setString(10, restaurant.getCuisine_type());
	        pstmt.setString(11, restaurant.getImage_path());

	        int result = pstmt.executeUpdate();

	        if (result > 0) {
	            System.out.println("Restaurant added successfully.");
	        } else {
	            System.out.println("Failed to add restaurant.");
	        }
			
	        pstmt.close();
	        connection.close();
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		
		String GET_QUERY = "SELECT * FROM restaurant WHERE restaurant_id = ?";
		
		 Connection connection = DBConnection.getConnection();
		    Restaurant restaurant = null;

		    try {

		        PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);

		        pstmt.setInt(1, restaurantId);

		        ResultSet rs = pstmt.executeQuery();

		        if (rs.next()) {

		            restaurant = new Restaurant();

		            restaurant.setRestaurant_id(rs.getInt("restaurant_id"));
		            restaurant.setRestaurant_name(rs.getString("restaurant_name"));
		            restaurant.setOwner_name(rs.getString("owner_name"));
		            restaurant.setPhone(rs.getString("phone"));
		            restaurant.setEmail(rs.getString("email"));
		            restaurant.setAddress(rs.getString("address"));
		            restaurant.setCity(rs.getString("city"));
		            restaurant.setRating(rs.getDouble("rating"));
		            restaurant.setOpening_time(rs.getTime("opening_time").toLocalTime());
		            restaurant.setClosing_time(rs.getTime("closing_time").toLocalTime());
		            restaurant.setCuisine_type(rs.getString("cuisine_type"));
		            restaurant.setImage_path(rs.getString("Image_path"));
		        }
		        pstmt.close();
		        connection.close();

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return restaurant;
		
		
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {
		
		String UPDATE_QUERY = "UPDATE restaurant SET restaurant_name=?, owner_name=?, phone=?, email=?, address=?, city=?, rating=?, opening_time=?, closing_time=?, cuisine_type=?, Image_path= ?, WHERE restaurant_id=?";
	
		 Connection connection = DBConnection.getConnection();

		    try {

		        PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

		        pstmt.setString(1, restaurant.getRestaurant_name());
		        pstmt.setString(2, restaurant.getOwner_name());
		        pstmt.setString(3, restaurant.getPhone());
		        pstmt.setString(4, restaurant.getEmail());
		        pstmt.setString(5, restaurant.getAddress());
		        pstmt.setString(6, restaurant.getCity());
		        pstmt.setDouble(7, restaurant.getRating());
		        pstmt.setTime(8, java.sql.Time.valueOf(restaurant.getOpening_time()));
		        pstmt.setTime(9, java.sql.Time.valueOf(restaurant.getClosing_time()));
		        pstmt.setString(10, restaurant.getCuisine_type());
		        pstmt.setString(11, restaurant.getImage_path());
		        pstmt.setInt(12, restaurant.getRestaurant_id());

		        int result = pstmt.executeUpdate();

		        if (result > 0) {
		            System.out.println("Restaurant updated successfully.");
		        } else {
		            System.out.println("Restaurant not found.");
		        }
		        
		        pstmt.close();
		        connection.close();

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
	}

	@Override
	public void deleteRestaurant(int restaurantId) {
		
		String DELETE_QUERY = "DELETE FROM restaurant WHERE restaurant_id = ?";
		Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

	        pstmt.setInt(1, restaurantId);

	        int result = pstmt.executeUpdate();

	        if (result > 0) {
	            System.out.println("Restaurant deleted successfully.");
	        } else {
	            System.out.println("Restaurant not found.");
	        }
	        
	        pstmt.close();
	        connection.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	}

	@Override
	public List<Restaurant> getAllRestaurants() {
		
		String GET_ALL_QUERY = "SELECT * FROM restaurant";
		
		List<Restaurant> restaurantList = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(GET_ALL_QUERY);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            Restaurant restaurant = new Restaurant();

	            restaurant.setRestaurant_id(rs.getInt("restaurant_id"));
	            restaurant.setRestaurant_name(rs.getString("restaurant_name"));
	            restaurant.setOwner_name(rs.getString("owner_name"));
	            restaurant.setPhone(rs.getString("phone"));
	            restaurant.setEmail(rs.getString("email"));
	            restaurant.setAddress(rs.getString("address"));
	            restaurant.setCity(rs.getString("city"));
	            restaurant.setRating(rs.getDouble("rating"));
	            restaurant.setOpening_time(rs.getTime("opening_time").toLocalTime());
	            restaurant.setClosing_time(rs.getTime("closing_time").toLocalTime());
	            restaurant.setCuisine_type(rs.getString("cuisine_type"));
	            restaurant.setImage_path(rs.getString("Image_path"));

	            restaurantList.add(restaurant);
	        }

	        
	        pstmt.close();
	        connection.close();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return restaurantList;
	}
	
	
	public List<Restaurant> searchRestaurant(String keyword) {

	    List<Restaurant> list = new ArrayList<>();

	    String sql = "SELECT * FROM restaurant WHERE restaurant_name LIKE ?";

	    Connection connection = DBConnection.getConnection();
	    
	    try {
			PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setString(1, keyword + "%");

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	        	Restaurant r = new Restaurant();

	        	r.setRestaurant_id(rs.getInt("restaurant_id"));
	        	r.setRestaurant_name(rs.getString("restaurant_name"));
	        	r.setCuisine_type(rs.getString("cuisine_type"));
	        	r.setImage_path(rs.getString("image_path"));
	        	r.setAddress(rs.getString("address"));
	        	r.setCity(rs.getString("city"));
	        	r.setRating(rs.getDouble("rating"));
	        	r.setOpening_time(rs.getTime("opening_time").toLocalTime());
	            r.setClosing_time(rs.getTime("closing_time").toLocalTime());
	        	r.setEmail(rs.getString("email"));
	        	r.setOwner_name(rs.getString("owner_name"));


	            list.add(r);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

}
