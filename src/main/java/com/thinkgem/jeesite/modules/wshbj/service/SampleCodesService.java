/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

import com.thinkgem.jeesite.modules.sys.entity.GlobalSet;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.dao.SpecimenDao;
import com.thinkgem.jeesite.modules.wshbj.entity.SampleCodesPack;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.SampleCodes;
import com.thinkgem.jeesite.modules.wshbj.dao.SampleCodesDao;

/**
 * 样本编号库Service
 * @author cuipengyu
 * @version 2018-04-20
 */
@Service
@Transactional(readOnly = true)
public class SampleCodesService extends CrudService<SampleCodesDao, SampleCodes> {


	@Autowired
	private SpecimenService specimenService;

	@Autowired
	private SampleCodesDao sampleCodesDao;

	public SampleCodes get(String id) {
        return super.get(id);
    }

    public SampleCodes getByCode(SampleCodes sampleCodes) {
        return sampleCodesDao.getByCode(sampleCodes);
    }
	
	public List<SampleCodes> findList(SampleCodes sampleCodes) {
		return super.findList(sampleCodes);
	}
	
	public Page<SampleCodes> findPage(Page<SampleCodes> page, SampleCodes sampleCodes) {
		return super.findPage(page, sampleCodes);
	}
	
	@Transactional(readOnly = false)
	public RequestResult createCodes(SampleCodesPack sampleCodesPack) {

		// 获取体检样本类型 对象
		Specimen specimen = specimenService.get(sampleCodesPack.getSpecimenId());

		// 获得前缀
		String prefix=specimen.getPrefix();
		String gprefix=GlobalSetUtils.getGlobalSet().getCodePre();

		// 生成编号
		for (int i = 0; i < sampleCodesPack.getCodeCount(); i++) {

			SampleCodes sc = new SampleCodes();
			sc.setSpecimenId(sampleCodesPack.getSpecimenId());
			sc.setSpecimenName(sampleCodesPack.getSpecimenName());
			sc.setAuthId(sampleCodesPack.getAuthId());
			sc.setAuthName(sampleCodesPack.getAuthName());
			sc.setOwner(sampleCodesPack.getOwner());
			sc.setPackId(sampleCodesPack.getId());
			sc.setIsUsed("0");
			sc.setPackId(sampleCodesPack.getId());

			// 创建一个新编号
			String seq = SysSequenceUtils.nextSequence(SampleCodes.class, "sampleCode");
			sc.setSampleCode(gprefix+prefix+seq);

			super.save(sc);
		}
		return RequestResult.generate(1,"成功创建编号数量："+sampleCodesPack.getCodeCount());
	}
	
	@Transactional(readOnly = false)
	public void delete(SampleCodes sampleCodes) {
		super.delete(sampleCodes);
	}

	protected SampleCodes refreshBean(SampleCodes sampleCodes) {

		return sampleCodes;
	}
	
}