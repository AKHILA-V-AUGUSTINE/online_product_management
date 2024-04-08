<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Users</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script>
        function validateformReg() {

            console.log("validation function");//debug check
           
            
            var name = document.getElementsByName("reg_name")[0].value.trim();
            var contact = document.getElementsByName("reg_phno")[0].value.trim();
            var username = document.getElementsByName("reg_user_name")[0].value.trim();
            var password = document.getElementsByName("reg_user_pwd")[0].value.trim();
            var category = document.getElementsByName("users_cat")[0].value.trim();


            if (name == null || name == "") {
                alert("Name Can't be blank or number");

                return false;//this condition has not been met
            } else if (/\d/.test(name)) {
                alert("Name Can't be a number");
                return false;

            } else if (contact == null || contact == "") {
                alert("plz enter the phone number");
                return false;
            }else if (!/^\d{10}$/.test(contact)) {
            alert("Contact Number must be a 10-digit number");
            return false;

            }else if (username == null || username == "") {
                alert("plz enter the username");
                return false;
            } else if (/\d/.test(username)) {
                alert("UserName Can't be a number");
                return false;
            } else if (pass == null || pass == "") {
                alert("plz enter the password");
                return false;
            } else if (pass.length < 6) {
                alert("Password length must be >=6");
                return false;
            } else if (category == "") {
                alert("plz choose the category");
                return false;
            }
            return true;


        }</script>

</head>
<body><div style='text-align: center;'>
    <form name="register" method="post" action="AddUsers.jsp" onsubmit="return validateformReg()">
        
            <h1>ADD USER</h1>
            <label>Name</label>&nbsp;
            <input type="text" name="reg_name" id="reg_name" /><br><br>
            <label>Contact number</label>&nbsp;
            <input type="number" name="reg_phno" id="reg_phno" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" /><br><br>
            <label>Email</label>&nbsp;&nbsp;
            <input type="email" name="reg_email" id="email" /><br><br>
            Username &nbsp;<input type="text" name="reg_user_name" id="reg_user_name"
                placeholder="enter username" /><br><br>
            <label>Password</label>&nbsp;
            <input type="password" name="reg_user_pwd" id="reg_user_pwd" /><br><br>


            <label>Role</label>&nbsp;
            <select name="users_cat">
                <option>ADMIN</option>
                <option>STAFF</option>
                <option>USER</option>
            </select><br><br>

            <input  type="submit" name="reg_submit" value="SAVE" />
        
    </form></div>


</body>
</html>
<%@ include file="Footer.jsp" %>