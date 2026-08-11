package com.Foodiee.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Foodiee.DAO.MenuDAO;
import com.Foodiee.model.Menu;
import com.Foodiee.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

	String INSERT_QUERY = "INSERT INTO menu (restaurant_id, food_name, category, price, Description, is_available, imagesPath, rating, review_count, calories, preparation_time, food_type, discount) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	@Override
	public void addMenu(Menu menu) {

		Connection con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, menu.getRestaurant_id());
			pstmt.setString(2, menu.getFood_name());
			pstmt.setString(3, menu.getCategory());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setString(5, menu.getDescription());
			pstmt.setBoolean(6, menu.isIs_available());
			pstmt.setString(7, menu.getImagePath());
			pstmt.setDouble(8, menu.getRating());
			pstmt.setInt(9, menu.getReview_count());
			pstmt.setInt(10, menu.getCalories());
			pstmt.setInt(11, menu.getPreparation_time());
			pstmt.setString(12, menu.getFood_type());
			pstmt.setInt(13, menu.getDiscount());

			int res = pstmt.executeUpdate();

			if (res > 0) {
				System.out.println("Menu added successfully.");
			} else {
				System.out.println("Failed to add menu.");
			}

			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menuId) {
		String Get_Query = "select * from menu where menu_id=?";
		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(Get_Query);
			pstmt.setInt(1, menuId);
			ResultSet res = pstmt.executeQuery();

			if(res.next()){

				Menu menu = new Menu();

				menu.setMenu_id(res.getInt("menu_id"));
				menu.setRestaurant_id(res.getInt("restaurant_id"));
				menu.setFood_name(res.getString("food_name"));
				menu.setCategory(res.getString("category"));
				menu.setPrice(res.getDouble("price"));
				menu.setDescription(res.getString("Description"));
				menu.setIs_available(res.getBoolean("is_available"));
				menu.setImagePath(res.getString("imagesPath"));
				menu.setRating(res.getDouble("rating"));
				menu.setReview_count(res.getInt("review_count"));
				menu.setCalories(res.getInt("calories"));
				menu.setPreparation_time(res.getInt("preparation_time"));
				menu.setFood_type(res.getString("food_type"));
				menu.setDiscount(res.getInt("discount"));

				return menu;
			}

		} catch (Exception e) {
			e.printStackTrace();		
		}
		return null;
	}

	@Override
	public void updateMenu(Menu menu) {

		String Update_Query = "UPDATE menu SET restaurant_id=?, food_name=?, category=?, price=?, Description=?, is_available=?, imagesPath=?, rating=?, review_count=?, calories=?, preparation_time=?, food_type=?, discount=? WHERE menu_id=?";
		Connection con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = con.prepareStatement(Update_Query);
			pstmt.setInt(1, menu.getRestaurant_id());
			pstmt.setString(2, menu.getFood_name());
			pstmt.setString(3, menu.getCategory());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setString(5, menu.getDescription());
			pstmt.setBoolean(6, menu.isIs_available());
			pstmt.setString(7, menu.getImagePath());
			pstmt.setDouble(8, menu.getRating());
			pstmt.setInt(9, menu.getReview_count());
			pstmt.setInt(10, menu.getCalories());
			pstmt.setInt(11, menu.getPreparation_time());
			pstmt.setString(12, menu.getFood_type());
			pstmt.setInt(13, menu.getDiscount());
			pstmt.setInt(14, menu.getMenu_id());

			int res = pstmt.executeUpdate();
			System.out.println(res);

			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteMenu(int menuId) {
		String Delete_Query ="delete from menu where menu_id =?";
		Connection con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = con.prepareStatement(Delete_Query);
			pstmt.setInt(1, menuId);

			int res = pstmt.executeUpdate();
			System.out.println(res);

			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Menu> getAllMenus() {
		String GetALL_Query = "select * from menu";
		List<Menu> List = new ArrayList<Menu>();
		Connection con = DBConnection.getConnection();

		try {

			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(GetALL_Query);

			while(res.next()){

				Menu menu = new Menu();

				menu.setMenu_id(res.getInt("menu_id"));
				menu.setRestaurant_id(res.getInt("restaurant_id"));
				menu.setFood_name(res.getString("food_name"));
				menu.setCategory(res.getString("category"));
				menu.setPrice(res.getDouble("price"));
				menu.setDescription(res.getString("Description"));
				menu.setIs_available(res.getBoolean("is_available"));
				menu.setImagePath(res.getString("imagesPath"));
				menu.setRating(res.getDouble("rating"));
				menu.setReview_count(res.getInt("review_count"));
				menu.setCalories(res.getInt("calories"));
				menu.setPreparation_time(res.getInt("preparation_time"));
				menu.setFood_type(res.getString("food_type"));
				menu.setDiscount(res.getInt("discount"));

				List.add(menu);
			}

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();		
		}

		return List;
	}

	public List<Menu> getMenusByRestaurant(int restaurantId) {

		List<Menu> list = new ArrayList<>();

		String sql = "SELECT * FROM menu WHERE restaurant_id=?";

		Connection con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, restaurantId);

			ResultSet res = pstmt.executeQuery();

			while(res.next()){

				Menu menu = new Menu();

				menu.setMenu_id(res.getInt("menu_id"));
				menu.setRestaurant_id(res.getInt("restaurant_id"));
				menu.setFood_name(res.getString("food_name"));
				menu.setCategory(res.getString("category"));
				menu.setPrice(res.getDouble("price"));
				menu.setDescription(res.getString("Description"));
				menu.setIs_available(res.getBoolean("is_available"));
				menu.setImagePath(res.getString("imagesPath"));
				menu.setRating(res.getDouble("rating"));
				menu.setReview_count(res.getInt("review_count"));
				menu.setCalories(res.getInt("calories"));
				menu.setPreparation_time(res.getInt("preparation_time"));
				menu.setFood_type(res.getString("food_type"));
				menu.setDiscount(res.getInt("discount"));


				list.add(menu);
			}

			pstmt.close();
			con.close();

		} catch(Exception e){
			e.printStackTrace();
		}

		return list;
	}


}
