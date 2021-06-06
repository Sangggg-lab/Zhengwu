<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%! String sql; %>
<%! ResultSet rs; //定义结果集对象%>
<%! Statement stmt;//定义SQL语句对象 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name=viewport content="width=device-width,initial-scale=1,user-scalable=no">
<meta http-equiv=X-UA-Compatible content="IE = Edge,chrome=1">
<title>用户页面</title>
<!-- 样式 -->
<link rel=stylesheet href="css/common.css">
<link rel=stylesheet href="css/jdc-side-panel.css">
<style type="text/css">
#home {position:absolute;top:10px;right:10px;}
#home img{width:30px;height:30px;padding-right:10px;}
</style>
</head>
<body bgcolor="#F3F3F3" background="images/student.jpg" style="background-size:100% 100%;">
<div align="center"><font color="#31708F" size="5">用户信息</font>
</div>
<br/>
<br/>
<div id="home">
<img src="images/home.png"  alt="返回主页"  onclick="javascript:location.href='index.jsp'"/>
<img src="images/back.png"  alt="返回上一页"  onclick="javascript:history.back(-1);"/>
</div>
<p align="center">
<a href="video.html">请点击此处来播放视频！</a>
<table  align="center" width="70%" border="1"  cellspacing="0" cellpadding="0" style= "opacity: 0.9;" >
<tr bgcolor=#F3F3F3>
   <td width=10% align="center">编号</td>
  <td width=10% align="center">姓名</td>
  <td width=8% align="center">性别</td>
  <td width=8% align="center">年龄</td>
  <td width=10% align="center">籍贯</td>
  <td width=10% align="center">专业</td>
  <td width=8% align="center">班级</td>
  <td width=10% align="center">民族</td>
  <td width=10% align="center">操作</td>
</tr>
<%! String u; %>
<%
u=request.getParameter("username");
%>
<%
try
{
    stmt=conn.createStatement();
    sql="select *from student  where username='"+u+"'";
    rs= stmt.executeQuery(sql);
while(rs.next()){
%>
<tr bgcolor=#FFFFFF>
  <td width=10% align="center"><%=rs.getObject(1)%></td>
  <td width=10% align="center"><%=rs.getObject(2)%></td>
  <td width=10% align="center"><%=rs.getObject(3)%></td>
  <td width=10% align="center"><%=rs.getObject(4)%></td>
  <td width=10% align="center"><%=rs.getObject(5)%></td>
  <td width=10% align="center"><%=rs.getObject(6)%></td>
  <td width=10% align="center"><%=rs.getObject(7)%></td>
  <td width=10% align="center"><%=rs.getObject(8)%></td>
  <td width=10% align="center" ><a href="Spasswd update.jsp?username=<%=rs.getObject(1)%>">修改密码</a></td>
</tr>
<%
}
	rs.close();
	stmt.close();
	conn.close();
}catch(Exception e)
{
	response.sendRedirect("err.jsp");
}

%>
</table>
<div class="jdc-side" style="display: block;">
  <div class="mod_hang_qrcode jdc_feedback_qrcode">
    <div class="mod_hang_qrcode_btn"><i class="jdcfont"></i><span>扫码反馈</span></div>
    <div class="mod_hang_qrcode_show">
      <div class="mod-qr-tips"></div>
      <div class="mod_hang_qrcode_show_bg">
        <div id="canvas" style="height: 123px; width: 123px;"><img src="images/qr_img.png"></div>
      </div>
      <p>扫一扫，反馈当前页面</p>
    </div>
  </div>
  <div class="mod_hang_appeal">
    <div class="mod_hang_appeal_btn"><i class="jdcfont"></i> <span>咨询反馈</span></div>
    <div class="mod_hang_appeal_show">
      <ul>
        <li><a href="#" target="_blank">
          <div class="icon_box"><i class="jdcfont"></i></div>
          <div class="text_box">
            <h5>人工在线客服</h5>
            <a href="chat.html">7*12 专业客服，服务咨询</a>
            
          </div>
          </a></li>
        <li id="entry"><a href="#" target="_blank" class="f-cb">
          <div class="icon_box"><i class="jdcfont"></i></div>
          <div class="text_box">
            <h5>便民服务</h5>
            <a href="phone+mail.jsp">查询部门电话及领导信箱</a>
          </div>
          </a></li>
        <li><a href="#" target="_blank" class="f-cb">
          <div class="icon_box"><i class="jdcfont"></i></div>
          <div class="text_box">
            <h5>投诉建议</h5>
            <a href="message board.jsp">倾耳聆听，一个工作日内及时处理</a>
          </div>
          </a></li>
      </ul>
    </div>
    </div>
  <div class="mod_hang_qrcode jdc_hang_qrcode"><a class="mod_hang_qrcode_btn"><i class="jdcfont"></i><span>扫码关注</span></a>
    <div class="mod_hang_qrcode_show">
      <div class="mod_hang_qrcode_show_bg"></div>
      <p>微信公众号</p>
    </div>
  </div>
  <div class="mod_hang_qrcode mod_hang_top"><a href="#" class="mod_hang_qrcode_btn"><i class="jdcfont"></i><span>返回顶部</span></a></div>
  <div class="el-dialog__wrapper" style="display: none;">
    <div class="el-dialog el-dialog--small" style="top: 15%;">
      <div class="el-dialog__header"><span class="el-dialog__title"></span>
        <div type="button" class="el-dialog__headerbtn"><i class="el-dialog__close el-icon el-icon-close"></i></div>
      </div>
      </div>
  </div>
</div>
</body>
</html>