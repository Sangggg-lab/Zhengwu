<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>政务管理系统：登录</title> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 
<title>后台管理</title>
<link href="login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
//专门为验证码的切换写的方法
	function refresh() {  
        //IE存在缓存,需要new Date()实现更换路径的作用  
        document.getElementById("image").src="image.jsp?"+new Date();  
}
</script>
	<script type="text/javascript">
		function check_admin(form){
			if(form.username.value==""){
				alert("用户名不能为空");
				form.username.focus();
				return false;
			}
			if(form.password.value==""){
				alert("密码不能为空");
				form.password.focus();
				return false;
			}
			if(form.code.value==""){
				alert("验证码不能为空");
				form.code.focus();
				return false;
			}
		}
	</script>

</head>
<body>
   <div class="login_box">
      <div class="login_l_img"><img src="images/login-img.jpg" /></div>
      <div class="login">
          <div class="login_logo"><a href="#"><img src="images/login_logo.jpg" /></a></div>
          <div class="login_name">
               <p>政务管理系统</p>
          </div>
          <form method="post" action="login.jsp" >
              <input name="username" type="text"  value="账号" onfocus="this.value=''" 
                     onblur="if(this.value==''){this.value='账号'}">
              <span id="password_text" onclick="this.style.display='none';document.getElementById('password').style.display='block';document.getElementById('password').focus().select();" >密码</span>
             <input name="password" type="password" id="password" style="display:none;" 
              onblur="if(this.value==''){document.getElementById('password_text').style.display='block';this.style.display='none'};"/>
              <div class = "login-center-input">
              		<input style = "width: 50%" type = "text" name = "code" maxlength="4" value = "" placeholder = "请输入验证码" onfocus = "this.placeholder">
              		<img id="image" border="0"  onclick="refresh()" src="image.jsp" title="点击更换图片">  
              </div>
              <input value="登录" style="width:100%;" type="submit">
          </form>
      </div>
      <div class="copyright">版权所有 QQ：2362662735</div>
</div>
 </body>
</html>
