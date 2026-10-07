package com.Foodiee.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.Foodiee.DAO.UserDAO;
import com.Foodiee.model.User;
import com.Foodiee.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

	// =========================
	// ADD USER
	// =========================

	private static final String INSERT_QUERY =
			"INSERT INTO user " +
					"(full_name, email, password, phone, address, city, pincode, role, created_at, last_login) " +
					"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	@Override
	public void addUser(User user) {

		try (
				Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt =
						connection.prepareStatement(INSERT_QUERY)
				) {

			pstmt.setString(1, user.getFull_name());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getCity());
			pstmt.setString(7, user.getPincode());
			pstmt.setString(8, user.getRole());

			Timestamp now =
					new Timestamp(System.currentTimeMillis());

			pstmt.setTimestamp(9, now);
			pstmt.setTimestamp(10, now);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("User added successfully.");
			} else {
				System.out.println("Failed to add user.");
			}

		} catch (Exception e) {

			System.out.println("ERROR while adding user:");
			e.printStackTrace();
		}
	}


	// =========================
	// GET USER BY ID
	// =========================

	@Override
	public User getUser(int userId) {

		String sql =
				"SELECT * FROM user WHERE user_id = ?";

		try (
				Connection connection =
				DBConnection.getConnection();

				PreparedStatement pstmt =
						connection.prepareStatement(sql)
				) {

			pstmt.setInt(1, userId);

			try (ResultSet rs = pstmt.executeQuery()) {

				if (rs.next()) {

					return mapUser(rs);
				}
			}

		} catch (Exception e) {

			System.out.println(
					"ERROR while getting user by ID:"
					);

			e.printStackTrace();
		}

		return null;
	}


	// =========================
	// GET USER BY EMAIL
	// Used by LoginServlet
	// =========================

	public User getUserByEmail(String email) {

		String sql =
				"SELECT * FROM user WHERE email = ?";

		try (
				Connection connection =
				DBConnection.getConnection()
				) {

			if (connection == null) {

				System.out.println(
						"ERROR: Database connection is NULL"
						);

				return null;
			}

			System.out.println(
					"Searching user with email: " + email
					);

			try (
					PreparedStatement pstmt =
					connection.prepareStatement(sql)
					) {

				pstmt.setString(1, email);

				try (
						ResultSet rs =
						pstmt.executeQuery()
						) {

					if (rs.next()) {

						System.out.println(
								"User found in database"
								);

						return mapUser(rs);

					} else {

						System.out.println(
								"User NOT found in database"
								);
					}
				}
			}

		} catch (Exception e) {

			System.out.println(
					"ERROR while getting user by email:"
					);

			e.printStackTrace();
		}

		return null;
	}


	// =========================
	// UPDATE USER
	// =========================

	@Override
	public void updateUser(User user) {

		String sql =
				"UPDATE user SET " +
						"full_name = ?, " +
						"email = ?, " +
						"password = ?, " +
						"phone = ?, " +
						"address = ?, " +
						"city = ?, " +
						"pincode = ?, " +
						"role = ?, " +
						"created_at = ?, " +
						"last_login = ? " +
						"WHERE user_id = ?";

		try (
				Connection connection =
				DBConnection.getConnection();

				PreparedStatement pstmt =
						connection.prepareStatement(sql)
				) {

			pstmt.setString(
					1,
					user.getFull_name()
					);

			pstmt.setString(
					2,
					user.getEmail()
					);

			pstmt.setString(
					3,
					user.getPassword()
					);

			pstmt.setString(
					4,
					user.getPhone()
					);

			pstmt.setString(
					5,
					user.getAddress()
					);

			pstmt.setString(
					6,
					user.getCity()
					);

			pstmt.setString(
					7,
					user.getPincode()
					);

			pstmt.setString(
					8,
					user.getRole()
					);

			Timestamp createdAt =
					user.getCreated_at();

			if (createdAt == null) {

				createdAt =
						new Timestamp(
								System.currentTimeMillis()
								);
			}

			pstmt.setTimestamp(
					9,
					createdAt
					);

			Timestamp now =
					new Timestamp(
							System.currentTimeMillis()
							);

			pstmt.setTimestamp(
					10,
					now
					);

			// IMPORTANT:
			// 11th parameter for WHERE user_id = ?
			pstmt.setInt(
					11,
					user.getUser_id()
					);

			int result =
					pstmt.executeUpdate();

			if (result > 0) {

				System.out.println(
						"User updated successfully."
						);

			} else {

				System.out.println(
						"User not found. Update failed."
						);
			}

		} catch (Exception e) {

			System.out.println(
					"ERROR while updating user:"
					);

			e.printStackTrace();
		}
	}


	// =========================
	// DELETE USER
	// =========================

	@Override
	public void deleteUser(int userId) {

		String sql =
				"DELETE FROM user WHERE user_id = ?";

		try (
				Connection connection =
				DBConnection.getConnection();

				PreparedStatement pstmt =
						connection.prepareStatement(sql)
				) {

			pstmt.setInt(
					1,
					userId
					);

			int result =
					pstmt.executeUpdate();

			if (result > 0) {

				System.out.println(
						"User deleted successfully."
						);

			} else {

				System.out.println(
						"User not found."
						);
			}

		} catch (Exception e) {

			System.out.println(
					"ERROR while deleting user:"
					);

			e.printStackTrace();
		}
	}


	// =========================
	// GET ALL USERS
	// =========================

	@Override
	public List<User> getAllUsers() {

		String sql =
				"SELECT * FROM user";

		List<User> users =
				new ArrayList<>();

		try (
				Connection connection =
				DBConnection.getConnection();

				PreparedStatement pstmt =
						connection.prepareStatement(sql);

				ResultSet rs =
						pstmt.executeQuery()
				) {

			while (rs.next()) {

				User user =
						mapUser(rs);

				users.add(user);
			}

		} catch (Exception e) {

			System.out.println(
					"ERROR while getting all users:"
					);

			e.printStackTrace();
		}

		return users;
	}


	// =========================
	// COMMON USER MAPPING
	// =========================

	private User mapUser(ResultSet rs)
			throws Exception {

		User user =
				new User();

		user.setUser_id(
				rs.getInt("user_id")
				);

		user.setFull_name(
				rs.getString("full_name")
				);

		user.setEmail(
				rs.getString("email")
				);

		user.setPassword(
				rs.getString("password")
				);

		user.setPhone(
				rs.getString("phone")
				);

		user.setAddress(
				rs.getString("address")
				);

		user.setCity(rs.getString("city"));

		user.setPincode(rs.getString("pincode"));

		user.setRole(
				rs.getString("role")
				);

		user.setCreated_at(
				rs.getTimestamp("created_at")
				);

		user.setLast_login(
				rs.getTimestamp("last_login")
				);

		return user;
	}
}