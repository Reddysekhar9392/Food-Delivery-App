package com.Foodiee.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Foodiee.DAO.OrderDAO;
import com.Foodiee.model.Order;
import com.Foodiee.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO{

	String Insert_Query = "insert into orders(user_id, order_date, TotalAmount, status, PaymentMethod, restaurant_id) Values(?,?,?,?,?,?)";

	@Override
	public int addOrder(Order order) {
   
		 int order_id =0;
		Connection con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = con.prepareStatement(Insert_Query, Statement.RETURN_GENERATED_KEYS);

			 pstmt.setInt(1, order.getUser_id());
		        pstmt.setTimestamp(2, java.sql.Timestamp.valueOf(order.getOrder_date()));
		        pstmt.setDouble(3, order.getTotalAmount());
		        pstmt.setString(4, order.getStatus());
		        pstmt.setString(5, order.getPaymentMethod());
		        pstmt.setInt(6, order.getRestaurant_id());

		        pstmt.executeUpdate();
		         
		         ResultSet res = pstmt.getGeneratedKeys();

		        if (res.next()) {
		             order_id = res.getInt(1);
		        	
		        } else {
		            System.out.println("Failed to add order.");
		        }


		} catch (Exception e) {
			e.printStackTrace();
		}
		return order_id;
	}

	@Override
	public Order getOrder(int orderId) {

	    Order order = null;

	    String sql = "SELECT * FROM orders WHERE order_id = ?";

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, orderId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            order = new Order();

	            order.setOrder_id(rs.getInt("order_id"));
	            order.setUser_id(rs.getInt("user_id"));
	            order.setOrder_date(rs.getTimestamp("order_date").toLocalDateTime());
	            order.setTotalAmount(rs.getDouble("TotalAmount"));
	            order.setStatus(rs.getString("status"));
	            order.setPaymentMethod(rs.getString("PaymentMethod"));
	            order.setRestaurant_id(rs.getInt("restaurant_id"));

	        }

	        rs.close();
	        ps.close();
	        con.close();

	    }
	    catch(Exception e){
	        e.printStackTrace();
	    }

	    return order;
	}

	@Override
	public void updateOrder(Order order) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteOrder(int orderId) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Order> getAllOrders() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Order> getOrdersByUserId(int userId) {

	    List<Order> orders = new ArrayList<>();

	    String GET_ORDERS =
	            "SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC";

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps = con.prepareStatement(GET_ORDERS);

	        ps.setInt(1, userId);

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()){

	            Order order = new Order();

	            order.setOrder_id(rs.getInt("order_id"));
	            order.setUser_id(rs.getInt("user_id"));
	            order.setOrder_date(rs.getTimestamp("order_date").toLocalDateTime());
	            order.setTotalAmount(rs.getDouble("TotalAmount"));
	            order.setStatus(rs.getString("status"));
	            order.setPaymentMethod(rs.getString("PaymentMethod"));
	            order.setRestaurant_id(rs.getInt("restaurant_id"));

	            orders.add(order);
	        }

	        rs.close();
	        ps.close();
	        con.close();

	    }
	    catch(Exception e){
	        e.printStackTrace();
	    }

	    return orders;
	}
}
