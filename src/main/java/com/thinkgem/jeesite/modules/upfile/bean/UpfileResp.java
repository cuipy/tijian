package com.thinkgem.jeesite.modules.upfile.bean;

import java.io.Serializable;

/**
 * 上传文件的响应
 */
public class UpfileResp implements Serializable{

    /**
     * 源文件类型  image  file   video   audio  base64
     */
    private String sourceType;

    private long  fileSize;

    /**
     * 下载路径
     */
    private String saveUrl;

    /**
     * 源文件名
     */
    private String sourceFileName;
    /**
     * 文件描述
     */
    private String describe;

    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }

    public String getSaveUrl() {
        return saveUrl;
    }

    public void setSaveUrl(String saveUrl) {
        this.saveUrl = saveUrl;
    }

    public String getSourceFileName() {
        return sourceFileName;
    }

    public void setSourceFileName(String sourceFileName) {
        this.sourceFileName = sourceFileName;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
}
