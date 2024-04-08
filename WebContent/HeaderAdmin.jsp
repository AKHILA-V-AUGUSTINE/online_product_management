<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="styleheader.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	document.onmousedown = disableclick;
	status = "Welcome to Demo Project";
	function disableclick(event) {
		if (event.button == 2) {
			alert(status);
			return false;
		}
	}
</script>


<script type="text/javascript">
	function preventBack() {
		window.history.forward();
	}
	setTimeout("preventBack()", 0);
	window.onunload = function() {
		null
	};
</script>
</head>
<body>
	<ul>

		<li><a class="active" href="index.jsp">Home</a></li>

		<li><a href="index.jsp">Contact</a></li>
		<li><a href="index.jsp">About</a></li>
		<li style="float: right"><a href="Logout.jsp">Logout</a></li>

	</ul>

</body>
</html>