<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/pqcBaseJsp.jsp"%>

<html>
    <head>
        <meta charset="utf-8" />
        <title>欢迎来到enjoyMJ</title>
        
        <!-- Our CSS stylesheet file -->
        <link rel="stylesheet" href="/static/modules/css/login/styles.css" />
        
        <!--[if lt IE 9]>
          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    
    <body>

		<div id="formContainer">
			<form id="login" method="post" action="./">
				<a href="#" id="flipToRecover" class="flipLink">忘记了?</a>
				<input type="text" name="loginEmail" id="loginEmail" placeholder="Email" />
				<input type="password" name="loginPass" id="loginPass"  placeholder="pass" />
				<input type="submit" name="submit" placeholder="Login" />
			</form>
			<form id="recover" method="post" action="./">
				<a href="#" id="flipToLogin" class="flipLink">Forgot?</a>
				<input type="text" name="recoverEmail" id="recoverEmail" value="Email" />
				<input type="submit" name="submit"  placeholder="Recover" />
			</form>
		</div>


        
        <!-- JavaScript includes -->
		<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
		<script src="/static/modules/js/login/script.js"></script>

	<script type="text/javascript">



	</script>
    </body>
</html>

