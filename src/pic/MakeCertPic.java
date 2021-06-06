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
 * ����:���ɲ�ɫ��֤��ͼƬ
 * ����widthΪ����ͼƬ�Ŀ��,����heightΪ����ͼƬ�ĸ߶�,����osΪҳ��������
 * 
 */
public class MakeCertPic {
	private String yzm;
	//��֤��ͼƬ�п��Գ��ֵ��ַ������ɸ�����Ҫ�޸�
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
    
    //���������
    private final String[] fontNames = new String[]{
			"����", "����", "Courier", "Arial", 
			"Verdana", "Times", "Tahoma", "Georgia",
			"Atlantic Inline"};
    
    
    
    public String getCertPic(int width, int height, OutputStream os) {
    	if(width<=0)width=60;
    	if(height<=0)height=20;
    	BufferedImage image = new BufferedImage(width, height,
    	BufferedImage.TYPE_INT_RGB);
   
   // ��ȡͼ��������
   Graphics g = image.getGraphics();
   // �趨����ɫ
   int c = (int)(0+Math.random()*(colors.length ));
   g.setColor(new Color(colors[c]));
   
   
   g.fillRect(0, 0, width, height);
   //���߿�
   g.setColor(Color.black);
   g.drawRect(0,0,width-1,height-1);
   
   // ȡ�����������֤��
   String strEnsure = "";
   // 4����4λ��֤��,���Ҫ���ɸ���λ����֤��,��Ӵ���ֵ
   for(int i=0; i<4; ++i) {
	   strEnsure+=mapTable[(int)(mapTable.length*Math.random())];
   } 
   yzm=strEnsure;
   //����֤����ʾ��ͼ����,���Ҫ���ɸ���λ����֤��,����strEnsure���
   g.setColor(Color.black);
   
   int f = (int)(0+Math.random()*(fontNames.length ));
   g.setFont(new Font(fontNames[f],Font.PLAIN,18));
   //��ȡ�ַ���
   String str = strEnsure.substring(0,1);
   g.drawString(str,8,17);
   str = strEnsure.substring(1,2);
   g.drawString(str,20,15);
   str = strEnsure.substring(2,3);
   g.drawString(str,35,18);  
   str = strEnsure.substring(3,4);
   g.drawString(str,45,15);
   //����ÿ�β�֤���ַ���ͬ�����Կ��Ըо�������ŤŤ���ڶ�
   // �������20�����ŵ�
   Random rand = new Random();
   for (int i=0;i<20;i++) {
    int x = rand.nextInt(width);
    int y = rand.nextInt(height);
    g.drawOval(x,y,2,2);
   }
   
   // �ͷ�ͼ��������
   g.dispose();  
   
   try {
    // ���ͼ��ҳ��
	   ImageIO.write(image, "JPEG", os);
   } catch (IOException e) {
	   	return "";
   } 
   		return strEnsure;
   }
   //��ȡԭ���������֤��
   public String getYzm(){
	   return this.yzm;
   }
}
