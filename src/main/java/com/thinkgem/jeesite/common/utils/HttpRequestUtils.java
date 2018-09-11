package com.thinkgem.jeesite.common.utils;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import okhttp3.*;

import javax.net.ssl.*;
import java.io.IOException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class HttpRequestUtils {

    private static OkHttpClient client  = new OkHttpClient.Builder()
            .connectTimeout(10, TimeUnit.SECONDS)
            .writeTimeout(10,TimeUnit.SECONDS)
            .readTimeout(20, TimeUnit.SECONDS)
            .build();


    public static RequestResult doHttpPost(String url, Map<String,String> params){
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

    public static RequestResult doHttpsPost(String url, Map<String,String> params){

        FormBody.Builder fbuider = new FormBody.Builder();
        for(String k:params.keySet()){
            String val=params.get(k);
            if(val==null){
                continue;
            }
            fbuider.add(k,params.get(k));
        }
        FormBody fbody = fbuider.build();

        OkHttpClient build = new OkHttpClient.Builder()
                .sslSocketFactory(createSSLSocketFactory())
                .hostnameVerifier(new TrustAllHostnameVerifier())
                .build();
        final Request request = new Request.Builder().url(url).post(fbody).build();
        Call call    = build.newCall(request);

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
        }catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }

        return rr;

    }

    private static class TrustAllCerts implements X509TrustManager {
        @Override
        public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {}

        @Override
        public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {}

        @Override
        public X509Certificate[] getAcceptedIssuers() {return new X509Certificate[0];}
    }
    private static class TrustAllHostnameVerifier implements HostnameVerifier {
        @Override
        public boolean verify(String hostname, SSLSession session) {
            return true;
        }
    }
    private static SSLSocketFactory createSSLSocketFactory() {
        SSLSocketFactory ssfFactory = null;

        try {
            SSLContext sc = SSLContext.getInstance("TLS");
            sc.init(null,  new TrustManager[] { new TrustAllCerts() }, new SecureRandom());

            ssfFactory = sc.getSocketFactory();
        } catch (Exception e) {
        }

        return ssfFactory;
    }

}
