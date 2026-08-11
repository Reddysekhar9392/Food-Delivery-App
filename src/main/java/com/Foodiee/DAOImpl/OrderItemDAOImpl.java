package com.Foodiee.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Foodiee.DAO.OrderItemDAO;
import com.Foodiee.model.OrderItem;
import com.Foodiee.utility.DBConnection;

public class OrderItemDAOImpl  implements  OrderItemDAO {

	String Insert_Query ="insert into order_item(order_id,menu_id, price, quantity) Values(?,?,?,?)";
	@Override
	public void addOrderItem(OrderItem orderItem) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareCall(Insert_Query);

			pstmt.setInt(1, orderItem.getOrder_id());
			pstmt.setInt(2, orderItem.getMenu_id());
			pstmt.setDouble(3, orderItem.getPrice());
			pstmt.setInt(4, orderItem.getQuantity());

			int res = pstmt.executeUpdate();

			if (res > 0) {
				System.out.println("Restaurant added successfully.");
			} else {
				System.out.println("Failed to add restaurant.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItem(int itemId) {
		String GET_QUERY = "select * from orderItem where item_id = ?";

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);
			pstmt.setInt(1, itemId);

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				res.getInt("item_id");
				res.getInt("order_id");
				res.getInt("menu_id");
				res.getDouble("price");
				res.getInt("quantity");
			}

			pstmt.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
		String Update_Query = "update order_item set item_id =?, menu_id =?, price=?, quantity=?, where order_id =?";

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(Update_Query);

			pstmt.setInt(1, orderItem.getItem_id());
			pstmt.setInt(1, orderItem.getMenu_id());
			pstmt.setDouble(1, orderItem.getPrice());
			pstmt.setInt(1, orderItem.getQuantity());

			int res = pstmt.executeUpdate();
			System.out.println(res);

			pstmt.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int itemId) {

		String Delete_Query = "delete from order_item where order_id = ?";
		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(Delete_Query);
			int res = pstmt.executeUpdate();
			System.out.println(res);

			pstmt.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderItem> getAllOrderItems() {
		String GET_ALLOrderItem = " select * from order_item";
		ArrayList<OrderItem> List = new ArrayList<OrderItem>();
		Connection connection = DBConnection.getConnection();

		try {

			Statement stmt = connection.createStatement();
			ResultSet res = stmt.executeQuery(GET_ALLOrderItem);

			while(res.next()) {
				res.getInt("order_id");
				res.getInt("item_id");
				res.getInt("menu_id");
				res.getDouble("price");
				res.getInt("quantity");
			}
			stmt.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}

}
