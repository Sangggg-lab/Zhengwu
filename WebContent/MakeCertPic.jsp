<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="org.eclipse.jdt.internal.compiler.lookup.CaptureBinding"%>
<%@page import="util.CpachaUtil"%>
<%@page contentType="image/jpeg" %>
<jsp:useBean id="image" scope="page" class="util.CpachaUtil"/>
<%
CpachaUtil capUtil=new CpachaUtil(4,100,30);
String generatorVcode=capUtil.generatorVCode();//获得验证码字符串
session.setAttribute("cpachaType", generatorVcode);//塞入session，方便后台的获取
BufferedImage generatorRotateVCodeImage=capUtil.generatorRotateVCodeImage(generatorVcode, true);//添加干扰线
ImageIO.write(generatorRotateVCodeImage, "gif", response.getOutputStream());
session.setAttribute("grci", generatorRotateVCodeImage);
out.clear();
out = pageContext.pushBody();
%>
