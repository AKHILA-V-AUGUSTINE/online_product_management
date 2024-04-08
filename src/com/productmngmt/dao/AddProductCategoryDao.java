package com.productmngmt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.productmngmt.beans.AddProductCategoryBean;

public class AddProductCategoryDao {
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

	// --------------START------insert /add category --------------------

	/**
	 * @author AKHILA
	 * @date:05/04/24
	 * @return
	 * @throws SQLException
	 */
	public static boolean insertCategory(AddProductCategoryBean addproductcategorybean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("INSERT INTO product_category (cat_name) VALUES (?)");

			pst.setString(1, addproductcategorybean.getCatName());

			// System.out.println("insert into
			// category(cat_name)values(categoryBean.getCaName())");

			pst.executeUpdate();
			flag = true;
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}

	// ------------------END----------insert /add category ----------------

	// ---------------------------------list view
	// category--------------------------
	public static ArrayList<AddProductCategoryBean> getAllCategory() throws SQLException {
		ArrayList<AddProductCategoryBean> addprodcatbean = new ArrayList<AddProductCategoryBean>();
		con = getDbConnection();
		try {
			pst = con.prepareStatement("select * from product_category");
			rs = pst.executeQuery();
			while (rs.next()) {
				AddProductCategoryBean addcat = new AddProductCategoryBean();
				addcat.setCatId(rs.getInt(1));
				addcat.setCatName(rs.getString(2));

				addprodcatbean.add(addcat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addprodcatbean;
	}

	// --------------END----------------------------------------------

	// ---------------------------------edit users------------------------

	public static ArrayList<AddProductCategoryBean> getCategoryDetailsById(
			AddProductCategoryBean addproductcategorybean) throws SQLException {
		ArrayList<AddProductCategoryBean> addprodcatbean = new ArrayList<AddProductCategoryBean>();
		con = getDbConnection();
		try {
			pst = con.prepareStatement("select * from product_category where cat_id=?");
			pst.setInt(1, addproductcategorybean.getCatId());
			rs = pst.executeQuery();
			while (rs.next()) {
				AddProductCategoryBean addcat = new AddProductCategoryBean();
				addcat.setCatId(rs.getInt(1));
				addcat.setCatName(rs.getString(2));
				addprodcatbean.add(addcat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addprodcatbean;
	}

	// --------------END
	// edit----------------------------------------------------------------

	// --------------update users start---------------------
	/**
	 * 
	 * 
	 */

	public static boolean updateCategory(AddProductCategoryBean addproductcategorybean) throws SQLException {
		con = getDbConnection();
		try {
			pst = con.prepareStatement("UPDATE product_category SET cat_name=? WHERE cat_id=?");
			pst.setString(1, addproductcategorybean.getCatName());

			pst.setInt(2, addproductcategorybean.getCatId());
			pst.executeUpdate();
			flag = true;

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}

	// ------------------------end-----------------------------

	// --------------deleteCategory start---------------------
	/**
	 * 
	 * 
	 */

	public static boolean deleteCategory(AddProductCategoryBean addproductcategorybean) throws SQLException {
		con = getDbConnection();
		try {
			pst = con.prepareStatement("delete from product_category  where cat_id=?");

			pst.setInt(1, addproductcategorybean.getCatId());
			pst.executeUpdate();
			flag = true;

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}

	// ------------------------end-----------------------------

	// ---------------------------------get category users------------------------

	public static ArrayList<AddProductCategoryBean>  getCategoryName() throws SQLException {
		ArrayList<AddProductCategoryBean> addprodcatbean = new ArrayList<AddProductCategoryBean>();
		con = getDbConnection();
		try {
			pst = con.prepareStatement("select cat_name from product_category ");
			
			rs = pst.executeQuery();
			
			while (rs.next()) {
				AddProductCategoryBean bean = new AddProductCategoryBean();
                bean.setCatName(rs.getString("cat_name"));
	            addprodcatbean.add(bean);
	        }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addprodcatbean;
		
	}

	// --------------END

}
