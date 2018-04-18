/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.constant.ExaminationRecordConstant;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordItemDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationSamplesDao;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 体检记录项目Service
 *
 * @author zhxl
 * @version 2018-03-17
 */
@Service
@Transactional(readOnly = true)
public class ExaminationRecordItemService extends CrudService<ExaminationRecordItemDao, ExaminationRecordItem> {


    public List<ExaminationRecordItem> listByRecordId(String recordId){
        if(StringUtils.isBlank(recordId)){
            return new ArrayList<ExaminationRecordItem>();
        }
        return this.dao.listByRecordId(recordId);
    }
}