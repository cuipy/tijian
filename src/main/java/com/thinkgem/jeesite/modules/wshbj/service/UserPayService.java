package com.thinkgem.jeesite.modules.wshbj.service;


import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordDao;
import com.thinkgem.jeesite.modules.wshbj.dao.JobPostDao;
import com.thinkgem.jeesite.modules.wshbj.dao.UserPayDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.entity.JobPost;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.entity.UserPay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 在线购买体检健康证的人员身份证号Service
 * @author zhxl
 * @version 2018-03-11
 */
@Service
@Transactional(readOnly = true)
public class UserPayService extends CrudService<UserPayDao, UserPay>   {


     public UserPay findByIdnumber(String idnumber) {
        return dao.findByIdnumber(idnumber) ;
    }
    public void add(UserPay userPay) {
          super.save(userPay) ;
    }


}
