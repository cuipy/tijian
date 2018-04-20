/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.SampleCodes;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.SampleCodesPack;
import com.thinkgem.jeesite.modules.wshbj.dao.SampleCodesPackDao;

/**
 * 样本编号包Service
 * @author cuipengyu
 * @version 2018-04-20
 */
@Service
@Transactional(readOnly = true)
public class SampleCodesPackService extends CrudService<SampleCodesPackDao, SampleCodesPack> {

	@Autowired
	private SpecimenService specimenService;



	public SampleCodesPack get(String id) {
		return super.get(id);
	}
	
	public List<SampleCodesPack> findList(SampleCodesPack sampleCodesPack) {
		return super.findList(sampleCodesPack);
	}
	
	public Page<SampleCodesPack> findPage(Page<SampleCodesPack> page, SampleCodesPack sampleCodesPack) {
		return super.findPage(page, sampleCodesPack);
	}
	
	@Transactional(readOnly = false)
	public RequestResult save2(SampleCodesPack sampleCodesPack) {

		// 获取体检样本类型 对象
		Specimen specimen = specimenService.get(sampleCodesPack.getSpecimenId());
		if(specimen==null){
			return RequestResult.generate(10,"由于未知原因，获取体检样本类型记录失败。");
		}

		String specimenName=specimen.getName();
		sampleCodesPack.setSpecimenName(specimenName);

		super.save(sampleCodesPack);

		return RequestResult.generate(1,"样本编号创建成功。");
	}
	
	@Transactional(readOnly = false)
	public void delete(SampleCodesPack sampleCodesPack) {
		super.delete(sampleCodesPack);
	}

	protected SampleCodesPack refreshBean(SampleCodesPack sampleCodesPack) {

		return sampleCodesPack;
	}
	
}