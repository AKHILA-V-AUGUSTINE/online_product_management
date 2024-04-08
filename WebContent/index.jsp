<%@ include file="HeaderAdmin.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css" />
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body>
	<div style="text-align: center;">
		<h1>HOME</h1>

		<button name="add_usr" onclick="location.href='add-users.jsp';">
			<span></span>Add Users
		</button>
		<button name="view_usr" onclick="location.href='UsersVED.jsp';">
			<span></span>View Users
		</button>
		<button name="add_prod_cat"
			onclick="location.href='AddProductCategory.jsp';">
			<span></span>Add Category
		</button>
		<button name="view_prod_cat"
			onclick="location.href='CategoryVED.jsp';">
			<span></span>View Category
		</button>
		<button name="add_prod" onclick="location.href='AddProduct.jsp';">
			<span></span>Add Product
		</button>
		<button name="view_prod" onclick="location.href='ProductVED.jsp';">
			<span></span>View Product
		</button>
		<!-- <button name="logout_usr" onclick="location.href='Logout.jsp';"><span></span>Logout
		</button> -->
	</div>

</body>
</html>
<%@ include file="Footer.jsp"%>

