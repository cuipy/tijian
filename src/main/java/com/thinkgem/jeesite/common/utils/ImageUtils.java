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
            byte[] bs = decoder.decodeBuffer(base64Img);
            if(bs!=null) {
                // 处理数据
//                for (int i = 0; i < bs.length; ++i) {
//                    if (bs[i] < 0) {
//                        bs[i] += 256;
//                    }
//                }

//                ByteArrayInputStream bis=new ByteArrayInputStream(bs);
//                BufferedImage bi=ImageIO.read(bis);

                OutputStream out = resp.getOutputStream();
                //ImageIO.write(bi,format,out);
                out.write(bs);
                out.flush();
                out.close();
            }
        } catch (Exception e) {

        }

    }


}
