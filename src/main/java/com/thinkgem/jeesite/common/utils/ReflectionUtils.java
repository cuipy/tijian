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
import java.lang.reflect.Method;
import java.net.URL;
import java.util.*;

public class ReflectionUtils {

    /**
     * 列出包下所有类的字符串列表
     * @return
     */
    public static List<String> listClassNames(String packageName){
        String packageDirName=StringUtils.replace(packageName,".", File.separator);

        List<String> lst=new ArrayList();


        URL packageDir = Thread.currentThread().getContextClassLoader().getResource(packageDirName);
        URL rootDir=Thread.currentThread().getContextClassLoader().getResource("/");

        String[] exts={"class"};

        String path=packageDir.getPath();
        String rootPath=rootDir.getPath();

        Collection<File> lst3 = FileUtils.listFiles(new File(path), exts, true);

        for(File f:lst3){
            String classDir=StringUtils.replace(f.getPath(),rootPath,File.separator);
            String nclass= StringUtils.replace(classDir,File.separator,".");
            nclass=StringUtils.substring(nclass,1,nclass.length()-6);

            lst.add(nclass);
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

    public static Method getMethod( Class clz, String methdName, Class...clzArgs){
        if(clz==null){
            return null;
        }

        try {
            Method m= clz.getMethod(methdName,clzArgs);
            return m;
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }

        return null;

    }

    public static Annotation getAnn(Class clzAnn,Class clzClass,String methodName,Class...clzArgs){
        Method m=getMethod(clzClass,methodName,clzArgs);
        if(m==null){
            return null;
        }

        Annotation ann = m.getAnnotation(clzAnn);
        return ann;
    }


}
