package com.thinkgem.jeesite.common.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thinkgem.jeesite.common.annotation.SequenceBean;
import org.apache.commons.collections4.ListUtils;
import org.apache.commons.lang.SystemUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.util.CollectionUtils;

import java.io.File;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.net.URL;
import java.util.*;

public class ReflectionUtils {

    /**
     * 列出包下所有类的字符串列表
     * @return
     */
    public static List<String> listClassNames(String packageName){
        String packageDirName=packageName.replaceAll("\\.", File.separator);
        String classPath=SystemPath.getClassPath();

        List<String> lst=new ArrayList();

        try {
            Enumeration<URL> lst2 = Thread.currentThread().getContextClassLoader().getResources(packageDirName);

            String[] exts={"class"};
            while(lst2.hasMoreElements()){
                URL u=lst2.nextElement();
                String path=u.getPath();


                Collection<File> lst3 = FileUtils.listFiles(new File(path), exts, true);

                for(File f:lst3){
                    String classDir=StringUtils.replace(f.getPath(),classPath,File.separator);
                    String nclass= StringUtils.replace(classDir,File.separator,".");
                    nclass=StringUtils.substring(nclass,1,nclass.length()-6);

                    lst.add(nclass);
                }

            }


        } catch (IOException e) {
            e.printStackTrace();
        }


        return lst;

    }

    public static  List<Class> listClassByAnnotations(String packageName, Class...anns){
        List<String> classes=listClassNames(packageName);
        if(classes==null){
            return null;
        }

        List<String> annList=new ArrayList();
        if(anns!=null&&anns.length>0){
            for(Class clz:anns){
                annList.add(clz.getName());
            }
        }

        List<Class> lstRes=new ArrayList();

        // 遍历所有的类，并且要求类上必须包含注解
        for(String clzName:classes){
            try {

                Class clz = Class.forName(clzName);

                if(clz==null){
                    continue;
                }

                // 如果没有注解参数的要求，则所有的类都加入到返回列表中
                if(annList==null){
                    lstRes.add(clz);
                    continue;
                }

                Annotation[] clzAnns = clz.getAnnotations();
                Boolean hasAnn=false;
                for(Annotation clzAnn:clzAnns){
                    // 判断类上的注解是否包含参数中的注解
                    String annStr=clzAnn.annotationType().getName();

                    if(annList.contains(annStr)){
                        hasAnn=true;
                        break;
                    }
                }

                if(hasAnn){
                    lstRes.add(clz);
                }

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                System.out.println(clzName);
            }

        }
        return lstRes;

    }

    public static void main(String...args){

        List<Class> lst = ReflectionUtils.listClassByAnnotations("com.thinkgem.jeesite.modules",SequenceBean.class);
        System.out.println(JSONArray.toJSONString(lst));

//        Class clz = null;
//        try {
//            clz = Class.forName("com.thinkgem.jeesite.modules.act.rest.servlet.FilterServletOutputStream",false,null);
//
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }


        //System.out.println(clz);


    }
}
