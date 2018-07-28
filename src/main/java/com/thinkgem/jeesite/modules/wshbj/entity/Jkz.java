package com.thinkgem.jeesite.modules.wshbj.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Jkz extends DataEntity<Jkz>{

    /**
     * 健康证Entity
     *
     * @author zhxl
     * @version 2018-03-11
     */

        private static final long serialVersionUID = 1L;
        private String jkzCode;        // 编号

        private String examCenterOwner;

        private String examCenterName;

        private String examUserId;

        private String examUserName;

        private String examUserIdNumb;

        private String examUserPhoneNumb;
        @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private java.util.Date jkzTime;

        public String getExamCenterOwner() {
            return examCenterOwner;
        }

        public void setExamCenterOwner(String examCenterOwner) {
            this.examCenterOwner = examCenterOwner;
        }

        public String getJkzCode() {
            return jkzCode;
        }

        public void setJkzCode(String jkzCode) {
            this.jkzCode = jkzCode;
        }

        public String getExamCenterName() {
            return examCenterName;
        }

        public void setExamCenterName(String examCenterName) {
            this.examCenterName = examCenterName;
        }

        public String getExamUserId() {
            return examUserId;
        }

        public void setExamUserId(String examUserId) {
            this.examUserId = examUserId;
        }

        public String getExamUserName() {
            return examUserName;
        }

        public void setExamUserName(String examUserName) {
            this.examUserName = examUserName;
        }

        public String getExamUserIdNumb() {
            return examUserIdNumb;
        }

        public void setExamUserIdNumb(String examUserIdNumb) {
            this.examUserIdNumb = examUserIdNumb;
        }

        public String getExamUserPhoneNumb() {
            return examUserPhoneNumb;
        }

        public void setExamUserPhoneNumb(String examUserPhoneNumb) {
            this.examUserPhoneNumb = examUserPhoneNumb;
        }

        public Date getJkzTime() {
            return jkzTime;
        }

        public void setJkzTime(Date jkzTime) {
            this.jkzTime = jkzTime;
        }

        public String getStrJkzTime() {
            return DateUtils.formatDate(jkzTime, "yyyy-MM-dd");
        }

        public Date getEndJkzTime() {
            return DateUtils.addYears(jkzTime, 1);
        }

        public String getStrEndJkzTime() {
            return DateUtils.formatDate(getEndJkzTime(), "yyyy-MM-dd");
        }

        public long getJkzPastDays() {
            if (getJkzTime() == null) {
                return -1;
            }
            long jkzTimePass = -DateUtils.pastDays(getEndJkzTime());
            return jkzTimePass;
        }



    @JsonIgnore
    public Map<String,String> getMap(){
        Map<String,String > m=new HashMap();
        m.put("id",id);
        m.put("jkzCode",jkzCode);
        m.put("examCenterOwner",examCenterOwner);
        m.put("examCenterName",examCenterName);
        m.put("examUserId",examUserId);
        m.put("examUserName",examUserName);
        m.put("examUserIdNumb",examUserIdNumb);
        m.put("examUserPhoneNumb",examUserPhoneNumb);
        m.put("examUserPhoneNumb",examUserPhoneNumb);
        m.put("delFlag",this.getDelFlag());
        m.put("jkzTime",jkzTime==null?null:DateUtils.formatDate(jkzTime,"yyyy-MM-dd HH:mm:ss"));
        return m;
    }

    }
