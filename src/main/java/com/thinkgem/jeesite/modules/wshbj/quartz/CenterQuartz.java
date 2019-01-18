package com.thinkgem.jeesite.modules.wshbj.quartz;

import com.thinkgem.jeesite.modules.sys.entity.GlobalSet;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.service.GlobalUploadService;
import com.thinkgem.jeesite.modules.wshbj.service.JkzUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@Lazy(value = false)
public class CenterQuartz {

    @Autowired
    private GlobalUploadService globalUploadService;

    /**
     * 向服务端同步健康证的可制证数量
     */
    @Scheduled(cron = "0 */5 * * * ? ")
    public void upload(){

        globalUploadService.doUpload();

    }


}

