package com.thinkgem.jeesite.modules.wshbj.entity;

import java.util.Date;

/**
 * 制证新增记录
 */
public class ZhizhengAddRecord {

    private String id;

    private String add_code;

    private Integer add_count;

    private Integer result_count;

    private java.util.Date update_time;

    private Integer update_type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAdd_code() {
        return add_code;
    }

    public void setAdd_code(String add_code) {
        this.add_code = add_code;
    }

    public Integer getAdd_count() {
        return add_count;
    }

    public void setAdd_count(Integer add_count) {
        this.add_count = add_count;
    }

    public Integer getResult_count() {
        return result_count;
    }

    public void setResult_count(Integer result_count) {
        this.result_count = result_count;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    public Integer getUpdate_type() {
        return update_type;
    }

    public void setUpdate_type(Integer update_type) {
        this.update_type = update_type;
    }
}
