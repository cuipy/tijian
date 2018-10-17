package com.thinkgem.jeesite.modules.wshbj.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import java.util.Date;

public class UserPay  extends DataEntity<UserPay> {

    private int id;
    private String idnumber;
    private Integer state;
    private Date create_time;

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdnumber() {
        return idnumber;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber;
    }

}
