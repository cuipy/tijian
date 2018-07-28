package com.thinkgem.jeesite.modules.wshbj.quartz;

import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecordItem;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationRecordItemUploadService;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationRecordUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Lazy(value = false)
public class ExaminationRecordItemQuartz {

    @Autowired
    private ExaminationRecordItemUploadService examinationRecordItemUploadService;

    @Scheduled(cron = "0 */1 * * * ? ")
    public void upload(){

        List<ExaminationRecordItem> lst = examinationRecordItemUploadService.listNeedUpload(new ExaminationRecordItem());

        for(ExaminationRecordItem examinationRecordItem:lst){
            examinationRecordItem.setUploadDate(null);
            examinationRecordItemUploadService.doUpload(examinationRecordItem);
        }

    }


}
