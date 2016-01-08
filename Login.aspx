<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
     <title>LOGIN </title>
      <link rel="stylesheet" href="css/reset.css"/>
     <script src="js/prefixfree.min.js"></script>

    <script type="text/javascript">
        var attempt = 3; // Variable to count number of attempts.
        // Below function Executes on click of login button.
        function validate() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            if (username == "Firestar1" && password == "Firestar123") {
                alert("Login successfully");
                window.location = "ProductCatalogue.aspx"; // Redirecting to other page.
                return false;
            }
            else if (username == "Firestar2" && password == "Firestar123") {
                alert("Login successfully");
                window.location = "ProductCatalogue.aspx"; // Redirecting to other page.
                return false;
            }
            else if (username == "Firestar3" && password == "Firestar123") {
                alert("Login successfully");
                window.location = "ProductCatalogue.aspx"; // Redirecting to other page.
                return false;
            }
            else {
                attempt--;// Decrementing by one.
                alert("You have left " + attempt + " attempt;");
                // Disabling fields after 3 attempts.
                if (attempt == 0) {
                    document.getElementById("username").disabled = true;
                    document.getElementById("password").disabled = true;
                    document.getElementById("submit").disabled = true;
                    return false;
                }
            }
        }





    </script>
    
        <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      * {
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  background: #d3dce0;
  font: 100%/1 "Helvetica Neue", Arial, sans-serif;
}

.login {
  position: absolute;
  top: 50%;
  left: 45%;
  margin: -10rem 0 0 -10rem;
  width: 30rem;
  height: 20rem;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  overflow: hidden;
}
.login:hover > .login-header, .login.focused > .login-header {
  width: 2rem;
}
.login:hover > .login-header > .text, .login.focused > .login-header > .text {
  font-size: 1rem;
  transform: rotate(-90deg);
}
.login.loading > .login-header {
  width: 20rem;
}
.login.loading > .login-header > .text {
  display: none;
}
.login.loading > .login-header > .loader {
  display: block;
}

.login-header {
  position: absolute;
  left: 0;
  top: 0;
  z-index: 1;
  width: 30rem;
  height: 20rem;
  background: #3C9691;
  transition: width 0.5s ease-in-out;
}
.login-header > .text {
  display: block;
  width: 100%;
  height: 100%;
  font-size: 5rem;
  text-align: center;
  line-height: 20rem;
  color: #fff;
  transition: all 0.5s ease-in-out;
}
.login-header > .loader {
  display: none;
  position: absolute;
  left: 5rem;
  top: 5rem;
  width: 10rem;
  height: 10rem;
  border: 2px solid #fff;
  border-radius: 50%;
  animation: loading 2s linear infinite;
}
.login-header > .loader:after {
  content: "";
  position: absolute;
  left: 4.5rem;
  top: -0.5rem;
  width: 1rem;
  height: 1rem;
  background: #fff;
  border-radius: 50%;
  border-right: 2px solid #3C9691;
}
.login-header > .loader:before {
  content: "";
  position: absolute;
  left: 4rem;
  top: -0.5rem;
  width: 0;
  height: 0;
  border-right: 1rem solid #fff;
  border-top: 0.5rem solid transparent;
  border-bottom: 0.5rem solid transparent;
}

@keyframes loading {
  50% {
    opacity: 0.5;
  }
  100% {
    transform: rotate(360deg);
  }
}
.login-form {
  margin: 0 0 0 2rem;
  padding: 0.5rem;
}

.login-input {
  display: block;
  width: 100%;
  font-size: 2rem;
  padding: 0.5rem 1rem;
  box-shadow: none;
  border-color: #ccc;
  border-width: 0 0 2px 0;
}
.login-input + .login-input {
  margin: 10px 0 0;
}
.login-input:focus {
  outline: none;
  border-bottom-color: #3C9691;
}

.login-btn {
  position: absolute;
  right: 1rem;
  bottom: 1rem;
  width: 5rem;
  height: 5rem;
  border: none;
  background: #3C9691;
  border-radius: 50%;
  font-size: 0;
  border: 0.6rem solid transparent;
  transition: all 0.3s ease-in-out;
}
.login-btn:after {
  content: "";
  position: absolute;
  left: 1rem;
  top: 0.8rem;
  width: 0;
  height: 0;
  border-left: 2.4rem solid #fff;
  border-top: 1.2rem solid transparent;
  border-bottom: 1.2rem solid transparent;
  transition: border 0.3s ease-in-out 0s;
}
.login-btn:hover, .login-btn:focus, .login-btn:active {
  background: #fff;
  border-color: #3C9691;
  outline: none;
}
.login-btn:hover:after, .login-btn:focus:after, .login-btn:active:after {
  border-left-color: #3C9691;
}

    </style>

    
</head>
<body>
    <form id="Form1" name="login-form" runat="server">
    
 <div class="container">
     <img src="Images\firetstar.jpg" alt="" style="width: 200px;height: 110px;  margin-top: 30px; margin-left: 600px;"/>
 <div id="login" class="login">
       

 <header class="login-header"><span class="text">LOGIN</span><span class="loader"></span></header>
 
<input type="text" name="username" id="username" placeholder="Username" class="login-input" style="    margin-bottom: 36px;
    margin-top: 25px;"/> 
  
<input type="password" name="password" id="password" placeholder="Password" class="login-input"/>
<input type="button" class="login-btn" value="Login" id="submit" onclick="validate()" />
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>


</div></div>
     <div class="footer" style=" color:#3C9691; font-size:smaller;  margin-top: 500px;margin-left:550px">&copy; Copyright 2015 By Firestar International Pvt. Ltd</div>
    </form>
 
    
</body>
</html>
