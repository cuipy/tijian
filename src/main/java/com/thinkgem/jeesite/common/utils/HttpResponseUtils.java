package com.thinkgem.jeesite.common.utils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class HttpResponseUtils {

    /**
     * 异常输出
     * @param resp
     * @param errorStatus
     * @param errorMsg
     */
    public static void error(HttpServletResponse resp,Integer errorStatus,String errorMsg){
        if(resp==null){
            return;
        }

        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        try {
            resp.setStatus(errorStatus);
            PrintWriter out = resp.getWriter();
            out.print(errorMsg);

            out.flush();
            out.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
