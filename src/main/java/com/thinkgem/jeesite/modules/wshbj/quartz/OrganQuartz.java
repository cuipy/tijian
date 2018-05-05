package com.thinkgem.jeesite.modules.wshbj.quartz;

import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import com.thinkgem.jeesite.modules.wshbj.service.OrganUploadService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Lazy(value = false)
public class OrganQuartz {

    @Autowired
    private OrganUploadService organUploadService;

    @Scheduled(cron = "0 0/1 * * * ? ")
    public void upload(){

        List<Organ> lst = organUploadService.listNeedUpload(new Organ());

        for(Organ organ:lst){
            organUploadService.doUpload(organ);
        }

    }


}
