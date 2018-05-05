package com.thinkgem.jeesite.common.utils;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
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


    public static RequestResult doPost(String url, Map<String,String> params){
        FormBody.Builder fbuider = new FormBody.Builder();
        for(String k:params.keySet()){
            String val=params.get(k);
            if(val==null){
                continue;
            }
            fbuider.add(k,params.get(k));
        }
        FormBody fbody = fbuider.build();

        Request request = new Request.Builder()
                .url(url)
                .post(fbody)
                .build();
        Response response = null;
        RequestResult rr=null;
        String res=null;
        try {
            response = client.newCall(request).execute();
            res = response.body().string();


            JSONObject json = JSONObject.parseObject(res);

            if(json.get("state")!=null){
                rr=RequestResult.generate(json.getInteger("state"),json.getString("msg"));
            }

        } catch(JSONException e){
            System.out.println(res);
        }catch (IOException e) {
            e.printStackTrace();
        }

        return rr;
    }

}
