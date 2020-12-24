package com.xiaofeng.oa.utils;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5Utils {
    /**
     * 对源数据生成MD5摘要
     * @param source 源数据
     * @return MD5摘要
     */
    public static  String md5Digest(String source){
       return DigestUtils.md5Hex(source);
    }

    /**
     * 对源数据加盐混淆后生成MD5摘要
     * @param source 源数据
     * @param salt 盐值
     * @return MD5摘要
     */
    public static  String md5Digest(String source,Integer salt){
       char[] ca= source.toCharArray();//字符数组
        for (int i=0;i<ca.length;i++){
            ca[i]= (char)(ca[i]+salt);
        }
        String target=new String(ca);
        String md5 = DigestUtils.md5Hex(target);
        return md5;
    }

    public static void main(String[] args) {
        System.out.println(MD5Utils.md5Digest("test",192));
    }
}
