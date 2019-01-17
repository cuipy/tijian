package com.thinkgem.jeesite.modules.wshbj.quartz;

import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
 import com.thinkgem.jeesite.modules.wshbj.service.JkzUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@Lazy(value = false)
public class JkzQuartz {

    @Autowired
    private JkzUploadService jkzUploadService;

    /**
     * 向服务端同步健康证的信息
     */
    @Scheduled(cron = "0 0/15 * * * ? ")
    public void upload(){
        //查询出哪些信息需要同步
        List<ExaminationRecord> lst = jkzUploadService.listJkzNeedUpload(new ExaminationRecord());
        //向服务端同步数据
        for(ExaminationRecord examinationRecord:lst){
            examinationRecord.setUploadDate(null);
            jkzUploadService.doUpload(examinationRecord);
        }

    }


}

