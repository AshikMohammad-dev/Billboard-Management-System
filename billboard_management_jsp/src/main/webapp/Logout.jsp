<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	
	<script type="text/javascript">
		function preventback()// disable back button
		{
			window.history.forward();
		}
		setTimeout("preventback()",0);
		window.onunload =function(){null};
		
	</script>
	
	<script type ="text/javascript">
			document.onmousedown =disableclick;// disable right click
			status ="Welcome to Demo Project";
			
			function disableclick(event)
			{
				if(event.button == 2){
					alert(status);
					return false;
				}
			}			
	</script>
	
	<script type ="text/javascript">
			function valForm()
			{	
				
				if(document.loginForm.username.value=="")
				{
					alert("Enter Username");
					document.loginForm.username.focus();
					return false;
				}
				if(document.loginForm.password.value=="")
				{
					alert("Enter Password");
					document.loginForm.password.focus();
					return false;
				}
				document.loginForm.submit();			
			}
		</script>
		
</head>
<body>
	<h1 align ="center">LOGOUT</h1>
	<h3>Logout successful.....Login Again</h3>
	<form name="loginForm" method="post" action="LoginActionController.jsp" >
		Username<input type="text" name="username"/><br><br>
		Password<input type="password" name="password"/><br><br>
		<br> <input type="submit" value="Sign In" onclick ="return valForm();"/>
	</form>
</body>
</html>