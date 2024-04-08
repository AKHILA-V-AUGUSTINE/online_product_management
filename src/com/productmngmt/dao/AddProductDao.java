package com.productmngmt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.productmngmt.beans.AddProductBean;

public class AddProductDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// --------------START------get connection---------------

	/**
	 * @author AKHILA
	 * @date:05/04/24
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
	// --------------START------insert /add product --------------------

	/**
	 * @author AKHILA
	 * @date:05/04/24
	 * @return
	 * @throws SQLException
	 */
	public static boolean insertProduct(AddProductBean addproductbean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("INSERT INTO product (prod_name,prod_desc,cat_id,prod_price) VALUES (?,?,?,?)");

			pst.setString(1, addproductbean.getProdName());
			pst.setString(2, addproductbean.getProdDesc());
			pst.setInt(3, addproductbean.getCatId());
			pst.setString(4, addproductbean.getProdPrice());

			// System.out.println("insert into
			// category(cat_name)values(categoryBean.getCaName())");

			pst.executeUpdate();
			flag = true;
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}

	// ------------------END----------insert /add product ----------------

	// ---------------------------------list view
	// product--------------------------
	public static ArrayList<AddProductBean> getAllProduct() throws SQLException {
		ArrayList<AddProductBean> addprodbean = new ArrayList<AddProductBean>();
		con = getDbConnection();
		try {
			pst = con.prepareStatement("select * from product");
			rs = pst.executeQuery();
			while (rs.next()) {
				AddProductBean addprod = new AddProductBean();
				addprod.setProdId(rs.getInt(1));
				addprod.setProdName(rs.getString(2));
				addprod.setProdDesc(rs.getString(3));
				addprod.setCatId(rs.getInt(4));
				addprod.setProdPrice(rs.getString(5));

				addprodbean.add(addprod);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addprodbean;
	}

	// --------------END----------------------------------------------

	// --------------deleteCategory start---------------------
	/**
	 * 
	 * 
	 */

	public static boolean deleteProduct(AddProductBean addproductbean) throws SQLException {
		con = getDbConnection();
		try {
			con = getDbConnection();

	        // Disable foreign key checks temporarily
	        pst = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
	        pst.executeUpdate();
	        pst.close();

	        // Delete the product from the product table
	        pst = con.prepareStatement("DELETE FROM product WHERE prod_id=?");
	        pst.setInt(1, addproductbean.getProdId());

	        int rowsAffected = pst.executeUpdate();
	        pst.close();

	        // Enable foreign key checks again
	        pst = con.prepareStatement("SET FOREIGN_KEY_CHECKS=1");
	        pst.executeUpdate();
	        if (rowsAffected > 0) {
	            flag = true;
	            System.out.println("Product deleted successfully.");
	        } else {
	            System.out.println("Product deletion failed. No rows affected.");
	        }

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}

	// ------------------------end-----------------------------

}
