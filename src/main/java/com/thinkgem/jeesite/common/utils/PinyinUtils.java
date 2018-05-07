package com.thinkgem.jeesite.common.utils;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class PinyinUtils {

    private static HanyuPinyinOutputFormat format;



    /**
     * 对单个字进行转换
     * @param pinYinStr 需转换的汉字字符串
     * @return 拼音字符串数组
     */
    public static String getCharPinYin(char pinYinStr){

        String[]pinyin=null;

        try
        {
            if(format==null) {
                format = new HanyuPinyinOutputFormat();
                format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
            }

            //执行转换
            pinyin = PinyinHelper.toHanyuPinyinStringArray(pinYinStr, format);

        } catch (BadHanyuPinyinOutputFormatCombination e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        //pinyin4j规则，当转换的符串不是汉字，就返回null
        if(pinyin == null){
            return null;
        }

        //多音字会返回一个多音字拼音的数组，pinyiin4j并不能有效判断该字的读音
        return pinyin[0];
    }

    /**
     * 对单个字进行转换
     * @param pinYinStr
     * @return
     */
    public static String getStringPinYin(String pinYinStr){
        StringBuffer sb = new StringBuffer();
        String tempStr = null;
        //循环字符串
        for(int i = 0; i<pinYinStr.length(); i++)
        {

            tempStr = getCharPinYin(pinYinStr.charAt(i));
            if(tempStr == null)
            {
                //非汉字直接拼接
                sb.append(pinYinStr.charAt(i));
            }
            else
            {
                sb.append(tempStr);
            }
        }

        return sb.toString();

    }

    public static void main(String...args){
        System.out.println(getStringPinYin("保定市"));
    }

}
