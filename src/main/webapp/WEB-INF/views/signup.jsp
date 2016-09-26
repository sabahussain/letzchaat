<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up Form</title>
<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
body {
    background-color: #6495ED;
     line-height: 1;
}

article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
  display: block;
}


ol, ul {
  list-style: none;
}

blockquote, q {
  quotes: none;
}

blockquote:before, blockquote:after,
q:before, q:after {
  content: '';
  content: none;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

.about {
  margin: 70px auto 40px;
  padding: 8px;
  width: 260px;
  font: 10px/18px 'Lucida Grande', Arial, sans-serif;
  color: #666;
  text-align: center;
  text-shadow: 0 1px rgba(255, 255, 255, 0.25);
  background: #eee;
  background: rgba(250, 250, 250, 0.8);
  border-radius: 4px;
  background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.1));
  background-image: -moz-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.1));
  background-image: -o-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.1));
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.1));
  -webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), inset 0 0 0 1px rgba(255, 255, 255, 0.1), 0 0 6px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), inset 0 0 0 1px rgba(255, 255, 255, 0.1), 0 0 6px rgba(0, 0, 0, 0.2);
}
.about a {
  color: #333;
  text-decoration: none;
  border-radius: 2px;
  -webkit-transition: background 0.1s;
  -moz-transition: background 0.1s;
  -o-transition: background 0.1s;
  transition: background 0.1s;
}
.about a:hover {
  text-decoration: none;
  background: #fafafa;
  background: rgba(255, 255, 255, 0.7);
}

.about-links {
  height: 30px;
}
.about-links > a {
  float: left;
  width: 50%;
  line-height: 30px;
  font-size: 12px;
}

.about-author {
  margin-top: 5px;
}
.about-author > a {
  padding: 1px 3px;
  margin: 0 -1px;
}

body {
  font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
  color: #404040;
  background: #FFE4E1;
}

.sign-up {
  position: relative;
  margin: 50px auto;
  width: 280px;
  padding: 33px 25px 29px;
  background: white;
  border-bottom: 1px solid #c4c4c4;
  border-radius: 5px;
  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}
.sign-up:before, .sign-up:after {
  content: '';
  position: absolute;
  bottom: 1px;
  left: 0;
  right: 0;
  height: 10px;
  background: inherit;
  border-bottom: 1px solid #d2d2d2;
  border-radius: 4px;
}
.sign-up:after {
  bottom: 3px;
  border-color: #dcdcdc;
}

.sign-up-title {
  margin: -25px -25px 25px;
  padding: 15px 25px;
  line-height: 35px;
  font-size: 26px;
  font-weight: 300;
  color: #aaa;
  text-align: center;
  text-shadow: 0 1px rgba(255, 255, 255, 0.75);
  background: #f7f7f7;
}
.sign-up-title:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 8px;
  background: #c4e17f;
  border-radius: 5px 5px 0 0;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}

input {
  font-family: inherit;
  color: inherit;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.sign-up-input {
  width: 100%;
  height: 50px;
  margin-bottom: 25px;
  padding: 0 15px 2px;
  font-size: 17px;
  background: white;
  border: 2px solid #ebebeb;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 -2px #ebebeb;
  box-shadow: inset 0 -2px #ebebeb;
}
.sign-up-input:focus {
  border-color: #62c2e4;
  outline: none;
  -webkit-box-shadow: inset 0 -2px #62c2e4;
  box-shadow: inset 0 -2px #62c2e4;
}
.lt-ie9 .sign-up-input {
  line-height: 48px;
}

.sign-up-button {
  position: relative;
  vertical-align: top;
  width: 100%;
  height: 54px;
  padding: 0;
  font-size: 22px;
  color: white;
  text-align: center;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
  background: #f0776c;
  border: 0;
  border-bottom: 2px solid #d76b60;
  border-radius: 5px;
  cursor: pointer;
  -webkit-box-shadow: inset 0 -2px #d76b60;
  box-shadow: inset 0 -2px #d76b60;
}
.sign-up-button:active {
  top: 1px;
  outline: none;
  -webkit-box-shadow: none;
  box-shadow: none;
}
</style>
</head>
<body style="background-color: #DCDCDC;">
  <jsp:include page="header.jsp"/>
<form class="sign-up" action="successRegister">
 <div>
  <h1 class="sign-up-title">Sign up in seconds</h1>
    <input type="text" class="sign-up-input" placeholder="What's your username?" name="username" autofocus required>
    <input type="password" class="sign-up-input" placeholder="Choose a password" name="password" required>
    <input type="text" class="sign-up-input" placeholder="Your FirstName" name="firstName" required>
    <input type="text" class="sign-up-input" placeholder="Your LastName" name="lastName" required>
    <input type="text" class="sign-up-input" placeholder="Your e-mail?" name="email" required>
      <input type="text" class="sign-up-input" placeholder="Your contact number?" name="contact" required>
      <div class="form-group" style="font-family: inherit; color: inherit;  font-size: 17px;" >
  <label for="userType">User Type:</label>
  <select name="userType" class="form-control">
        <option>STUDENT</option>
        <option>ALUMNI</option>
    </select>   
</div>
    <input type="submit" value="Sign me up!" class="sign-up-button">
     </div>
  </form>
 
</body>
</html>