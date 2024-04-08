<%@ include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Category</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div style='text-align: center;'>
		<form name="categoryadd" action="AddCategory.jsp" method="post">
			<h1>Add Product Category</h1>
			<label>Category</label> <input type="text" name="catg_name"
				placeholder="add category"><br>
			<br> <input type="submit" name="cat_save" value="save">
		</form>
	</div>

</body>
</html>
<%@ include file="Footer.jsp"%>