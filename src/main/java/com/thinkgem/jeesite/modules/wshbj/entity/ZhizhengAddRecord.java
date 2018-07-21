package com.thinkgem.jeesite.modules.wshbj.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import java.util.Date;

/**
 * 制证新增记录
 */
public class ZhizhengAddRecord extends DataEntity<ZhizhengAddRecord> {

    private String id;

    /**
     * md5加密码的 新增制证数量，32位长度
     */
    private String addCode;

    /**
     * 增加的明文数量
     */
    private Integer addCount;

    /**
     * 明文的结果数
     */
    private Integer resultCount;

    private java.util.Date updateTime;

    private Integer updateType;

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getAddCode() {
        return addCode;
    }

    public void setAddCode(String addCode) {
        this.addCode = addCode;
    }

    public Integer getAddCount() {
        return addCount;
    }

    public void setAddCount(Integer addCount) {
        this.addCount = addCount;
    }

    public Integer getResultCount() {
        return resultCount;
    }

    public void setResultCount(Integer resultCount) {
        this.resultCount = resultCount;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getUpdateType() {
        return updateType;
    }

    public void setUpdateType(Integer updateType) {
        this.updateType = updateType;
    }
}
