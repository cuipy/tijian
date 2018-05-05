package com.thinkgem.jeesite.common.utils;

import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class HttpRequestUtils {

    private static OkHttpClient client  = new OkHttpClient.Builder()
            .connectTimeout(10, TimeUnit.SECONDS)
            .writeTimeout(10,TimeUnit.SECONDS)
            .readTimeout(20, TimeUnit.SECONDS)
            .build();


    public static String doPost(String url, Map<String,String> params){
        FormBody.Builder fbuider = new FormBody.Builder();
        for(String k:params.keySet()){
            fbuider.add(k,params.get(k));
        }
        FormBody fbody = fbuider.build();

        Request request = new Request.Builder()
                .url(url)
                .post(fbody)
                .build();
        Response response = null;
        try {
            response = client.newCall(request).execute();
            return response.body().string();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "-1";
    }

}
