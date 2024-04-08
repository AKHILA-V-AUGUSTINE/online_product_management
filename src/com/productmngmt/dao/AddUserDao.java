package com.productmngmt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.productmngmt.beans.AddUserBean;
import com.productmngmt.dao.DBDAO;

public class AddUserDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// --------------START------get connection---------------

	/**
	 * @author AKHILA
	 * @date:4/04/24
	 * @return
	 * @throws SQLException
	 */
	public static Connection getDbConnection() throws SQLException {
		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	// ------------------END-------------database connection------------

	// --------------START------insert /add user --------------------

	/**
	 * @author AKHILA
	 * @date:20/03/24
	 * @return
	 * @throws SQLException
	 */
	public static boolean insertUsers(AddUserBean adduserbean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"INSERT INTO users_personal_details (user_per_name, user_per_contact,user_per_email,user_per_username,user_per_password,user_per_role) VALUES (?, ?,?,?,?,?)");

			pst.setString(1, adduserbean.getUserPerName());
			pst.setString(2, adduserbean.getUserPerContact());
			pst.setString(3, adduserbean.getUserPerEmail());
			pst.setString(4, adduserbean.getUserPerUsername());
			pst.setString(5, adduserbean.getUserPerPassword());
			pst.setString(6, adduserbean.getUserPerRole());

			// System.out.println("insert into
			// category(cat_name)values(categoryBean.getCaName())");

			pst.executeUpdate();
			flag = true;
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}

	// ------------------END----------insert /add user ----------------

	// ---------------------------------list view
	// users----------------------------------------
	public static ArrayList<AddUserBean> getAllUsers() throws SQLException {
		ArrayList<AddUserBean> adduserbean = new ArrayList<AddUserBean>();
		con = getDbConnection();
		try {
			pst = con.prepareStatement("select * from users_personal_details");
			rs = pst.executeQuery();
			while (rs.next()) {
				AddUserBean adduser = new AddUserBean();
				adduser.setUserPerId(rs.getInt(1));
				adduser.setUserPerName(rs.getString(2));
				adduser.setUserPerContact(rs.getString(3));
				adduser.setUserPerEmail(rs.getString(4));
				adduser.setUserPerUsername(rs.getString(5));
				adduser.setUserPerPassword(rs.getString(6));
				adduser.setUserPerRole(rs.getString(7));
				adduserbean.add(adduser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return adduserbean;
	}

	// --------------END----------------------------------------------------------------

	// ---------------------------------edit
	// users-------------------------------

	public static ArrayList<AddUserBean> getUserDetailsById(AddUserBean usr) throws SQLException {
		ArrayList<AddUserBean> adduserbean = new ArrayList<AddUserBean>();
		con = getDbConnection();
		try {
			pst = con.prepareStatement("select * from users_personal_details where user_per_id=?");
			pst.setInt(1, usr.getUserPerId());
			rs = pst.executeQuery();
			while (rs.next()) {
				AddUserBean users = new AddUserBean();
				users.setUserPerId(rs.getInt(1));
				users.setUserPerName(rs.getString(2));
				users.setUserPerContact(rs.getString(3));
				users.setUserPerEmail(rs.getString(4));
				users.setUserPerUsername(rs.getString(5));
				users.setUserPerPassword(rs.getString(6));
				users.setUserPerRole(rs.getString(7));
				adduserbean.add(users);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return adduserbean;
	}

	// --------------END
	// edit----------------------------------------------------------------

	// --------------update users start---------------------
	/**
	 * 
	 * 
	 */

	public static boolean updateUser(AddUserBean usr) throws SQLException {
		con = getDbConnection();
		try {
			pst = con.prepareStatement(
					"UPDATE users_personal_details SET user_per_name=?, user_per_contact=?, user_per_email=?, user_per_username=?, user_per_password=?, user_per_role=? WHERE user_per_id=?");
			pst.setString(1, usr.getUserPerName());
			pst.setString(2, usr.getUserPerContact());
			pst.setString(3, usr.getUserPerEmail());
			pst.setString(4, usr.getUserPerUsername());
			pst.setString(5, usr.getUserPerPassword());
			pst.setString(6, usr.getUserPerRole());
			pst.setInt(7, usr.getUserPerId());
			pst.executeUpdate();
			flag = true;

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}

	// ------------------------end-----------------------------

	// --------------delete user start---------------------
	/**
	 * 
	 * 
	 */

	public static boolean deleteUser(AddUserBean usr) throws SQLException {
		con = getDbConnection();
		try {
			pst = con.prepareStatement("delete from users_personal_details  where user_per_id=?");

			pst.setInt(1, usr.getUserPerId());
			pst.executeUpdate();
			flag = true;

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}

	// ------------------------end-----------------------------

	// --------------login user start---------------------
	/**
	 * 
	 * 
	 */

	public static String loginUser(AddUserBean usr) throws SQLException {
		con = getDbConnection();
		String role = null;
		try {
			pst = con.prepareStatement(
					"SELECT user_per_role FROM users_personal_details WHERE user_per_email=? AND user_per_password=?");
			pst.setString(1, usr.getUserPerEmail());
			pst.setString(2, usr.getUserPerPassword());

			rs = pst.executeQuery();
			if (rs.next()) {
				role = rs.getString("user_per_role");
			}

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return role;
	}

	// ------------------------end-----------------------------

}
