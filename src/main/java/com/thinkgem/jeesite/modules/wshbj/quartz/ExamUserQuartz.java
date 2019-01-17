package com.thinkgem.jeesite.modules.wshbj.quartz;

import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationUser;
import com.thinkgem.jeesite.modules.wshbj.service.ExamUserUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Lazy(value = false)
public class ExamUserQuartz {

    @Autowired
    private ExamUserUploadService ExamUserUploadService;

    @Scheduled(cron = "0 0/14 * * * ? ")
    public void upload(){

        List<ExaminationUser> lst = ExamUserUploadService.listNeedUpload(new ExaminationUser());

        for(ExaminationUser ExamUser:lst){
            ExamUser.setUploadDate(null);
            ExamUserUploadService.doUpload(ExamUser);
        }

    }


}
