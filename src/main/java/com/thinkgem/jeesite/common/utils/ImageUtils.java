package com.thinkgem.jeesite.common.utils;

import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.OutputStream;

public class ImageUtils {

    /**
     * 将Base64的图片，以流方式输出
     * @param base64Img
     */
    public static void base64OutResponse(String base64Img,String format, HttpServletResponse resp){
        resp.setContentType("image/jpeg");
        //发头控制浏览器不要缓存
        resp.setDateHeader("expries", 0);
        resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        resp.setHeader("Cache-Control", "post-check=0, pre-check=0");
        resp.setHeader("Pragma", "no-cache");

        BASE64Decoder decoder = new BASE64Decoder();
        try {
            // 解密
            byte[] b = decoder.decodeBuffer(base64Img);
            if(b!=null) {
                // 处理数据
                for (int i = 0; i < b.length; ++i) {
                    if (b[i] < 0) {
                        b[i] += 256;
                    }
                }

                ByteArrayInputStream bis=new ByteArrayInputStream(b);
                BufferedImage bi=ImageIO.read(bis);

                OutputStream out = resp.getOutputStream();
                ImageIO.write(bi,format,out);
            }
        } catch (Exception e) {

        }

    }


}
