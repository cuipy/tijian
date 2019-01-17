package com.thinkgem.jeesite.modules.wshbj.quartz;

import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationUser;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationRecordUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Lazy(value = false)
public class ExaminationRecordQuartz {

    @Autowired
    private ExaminationRecordUploadService examinationRecordUploadService;

    @Scheduled(cron = "0 0/13 * * * ? ")
    public void upload(){

        List<ExaminationRecord> lst = examinationRecordUploadService.listNeedUpload(new ExaminationRecord());

        for(ExaminationRecord examinationRecord:lst){
            examinationRecord.setUploadDate(null);
            examinationRecordUploadService.doUpload(examinationRecord);
        }

    }


}
