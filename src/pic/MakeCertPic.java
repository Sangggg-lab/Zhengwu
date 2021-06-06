package pic;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
/**
 * 功能:生成彩色验证码图片
 * 参数width为生成图片的宽度,参数height为生成图片的高度,参数os为页面的输出流
 * 
 */
public class MakeCertPic {
	private String yzm;
	//验证码图片中可以出现的字符集，可根据需要修改
    private final char mapTable[]={
       'a','b','c','d','e','f',
       'g','h','i','j','k','l',
       'm','n','o','p','q','r',
       's','t','u','v','w','x',
       'y','z','0','1','2','3',
       '4','5','6','7','8','9'};
    private final int colors[]={
    	0xFFFFFF,0x800000,
    	0x008000,0x808000,
    	0x000080,0x800080,
    	0x008080,0x808080,
    	0xC0C0C0,0xFF0000,
    	0xFFFF00,0x0000FF,
    	0xFF00FF,0x00FFFF,
    };
    
    //字体的设置
    private final String[] fontNames = new String[]{
			"黑体", "宋体", "Courier", "Arial", 
			"Verdana", "Times", "Tahoma", "Georgia",
			"Atlantic Inline"};
    
    
    
    public String getCertPic(int width, int height, OutputStream os) {
    	if(width<=0)width=60;
    	if(height<=0)height=20;
    	BufferedImage image = new BufferedImage(width, height,
    	BufferedImage.TYPE_INT_RGB);
   
   // 获取图形上下文
   Graphics g = image.getGraphics();
   // 设定背景色
   int c = (int)(0+Math.random()*(colors.length ));
   g.setColor(new Color(colors[c]));
   
   
   g.fillRect(0, 0, width, height);
   //画边框
   g.setColor(Color.black);
   g.drawRect(0,0,width-1,height-1);
   
   // 取随机产生的认证码
   String strEnsure = "";
   // 4代表4位验证码,如果要生成更多位的认证码,则加大数值
   for(int i=0; i<4; ++i) {
	   strEnsure+=mapTable[(int)(mapTable.length*Math.random())];
   } 
   yzm=strEnsure;
   //将认证码显示到图像中,如果要生成更多位的认证码,增加strEnsure语句
   g.setColor(Color.black);
   
   int f = (int)(0+Math.random()*(fontNames.length ));
   g.setFont(new Font(fontNames[f],Font.PLAIN,18));
   //截取字符串
   String str = strEnsure.substring(0,1);
   g.drawString(str,8,17);
   str = strEnsure.substring(1,2);
   g.drawString(str,20,15);
   str = strEnsure.substring(2,3);
   g.drawString(str,35,18);  
   str = strEnsure.substring(3,4);
   g.drawString(str,45,15);
   //由于每次产证的字符不同，所以可以感觉是歪歪扭扭的在动
   // 随机产生20个干扰点
   Random rand = new Random();
   for (int i=0;i<20;i++) {
    int x = rand.nextInt(width);
    int y = rand.nextInt(height);
    g.drawOval(x,y,2,2);
   }
   
   // 释放图形上下文
   g.dispose();  
   
   try {
    // 输出图像到页面
	   ImageIO.write(image, "JPEG", os);
   } catch (IOException e) {
	   	return "";
   } 
   		return strEnsure;
   }
   //获取原本输入的验证码
   public String getYzm(){
	   return this.yzm;
   }
}
