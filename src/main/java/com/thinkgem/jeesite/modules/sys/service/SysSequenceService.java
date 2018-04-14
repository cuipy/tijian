/**
 * Copyright &copy; 2012-2013 <a href="httparamMap://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.LogDao;
import com.thinkgem.jeesite.modules.sys.dao.SysSequenceDao;
import com.thinkgem.jeesite.modules.sys.entity.Log;
import com.thinkgem.jeesite.modules.sys.entity.SequenceDefine;
import com.thinkgem.jeesite.modules.sys.entity.SysSequence;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Method;
import java.util.List;

/**
 * 日志Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class SysSequenceService extends CrudService<SysSequenceDao, SysSequence> {


	@Autowired
	private SysSequenceDao sysSequenceDao;

	@Autowired
	private SequenceDefineService sequenceDefineService;

	/**
	 * 根据Bean类和字段名生成新的序列号
	 * @param clz
	 * @param fieldName
	 * @return
	 */
	@Transactional(readOnly = false)
	public String nextSequence(Class clz,String fieldName){

		if(StringUtils.isEmpty(fieldName)){
			return null;
		}

		String strMethodName=fieldName;

		if(!fieldName.startsWith("get")){
			strMethodName="get"+ StringUtils.upCaseFirst(fieldName);
		}

		SequenceDefine sd = sequenceDefineService.getByClassMethod(clz, strMethodName);

		// 获得序列生成的表达式
		if(sd==null){
			return null;
		}

		String express=sd.getAnnExpress();
		if(StringUtils.isNotEmpty(sd.getCustomExpress())){
			express=sd.getCustomExpress();
		}

		if(StringUtils.isEmpty(express)){
			return null;
		}

		// 根据express 生成 temp字符串
		String temp=SysSequenceUtils.toTemplate(express);
		SysSequence sysSequence=new SysSequence();
		sysSequence.setExpress(express);
		sysSequence.setSeqTemp(temp);

		// 根据template字符串从数据表 sys_sequence 中读取记录
		SysSequence rowSysSequnence=sysSequenceDao.getBySeqTemp(sysSequence);
		if(rowSysSequnence==null){
			sysSequence.preInsert();
			sysSequence.setSeqVal(1);
			sysSequenceDao.insert(sysSequence);
		}else{
			sysSequence=rowSysSequnence;
		}

		sysSequence.preUpdate();
		sysSequence.setSeqVal(sysSequence.getSeqVal()+1);
		Integer rowCount=sysSequenceDao.update(sysSequence);

		Integer seqVal=sysSequence.getSeqVal();

		// 生成序列号字符串
		String seq=SysSequenceUtils.toSequence(temp,seqVal);

		return seq;


	}




	
}
