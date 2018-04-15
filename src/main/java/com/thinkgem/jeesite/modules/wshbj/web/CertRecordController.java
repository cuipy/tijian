/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.service.DictService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationRecordService;
import com.thinkgem.jeesite.modules.wshbj.service.OrganService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import com.thinkgem.jeesite.common.utils.DateUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import javax.validation.ConstraintViolationException;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.CertRecord;
import com.thinkgem.jeesite.modules.wshbj.service.CertRecordService;

/**
 * 制卡记录Controller
 * @author zhxl
 * @version 2018-03-25
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/certRecord")
public class CertRecordController extends BaseController {

	@Autowired
	private CertRecordService certRecordService;
	@Autowired
	private OrganService organService;
	@Autowired
	private DictService dictService;
	@Autowired
	private ExaminationRecordService examinationRecordService;
	
	@ModelAttribute
	public CertRecord get(@RequestParam(required=false) String id) {
		CertRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = certRecordService.get(id);
		}
		if (entity == null){
			entity = new CertRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:certRecord:view")
	@RequestMapping(value = {"list", ""})
	public String list(CertRecord certRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CertRecord> page = certRecordService.findPage(new Page<CertRecord>(request, response), certRecord); 
		model.addAttribute("page", page);
		return "modules/wshbj/certRecordList";
	}

	@RequiresPermissions("wshbj:certRecord:view")
	@RequestMapping(value = "view")
	public String view(CertRecord certRecord, Model model) {
		model.addAttribute("certRecord", certRecord);
		return "modules/wshbj/certRecordPage";
	}

	@RequiresPermissions("wshbj:certRecord:view")
	@RequestMapping(value = "form")
	public String form(CertRecord certRecord,HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("certRecord", certRecord);

		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);

		//体检记录状态字典
		Dict dict = new Dict();
		dict.setType("examination_record_status");
		List<Dict> statusDictList = dictService.findList(dict);
		model.addAttribute("statusDictList", statusDictList);

		return "modules/wshbj/certRecordForm";
	}

	@RequiresPermissions("wshbj:certRecord:edit")
	@RequestMapping(value = "save")
	public String save(CertRecord certRecord,HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, certRecord)){
			return form(certRecord,request,response, model);
		}
		certRecordService.save(certRecord);
		addMessage(redirectAttributes, "保存制卡记录成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/certRecord/?repage";
	}
	
	@RequiresPermissions("wshbj:certRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(CertRecord certRecord, RedirectAttributes redirectAttributes) {
		certRecordService.delete(certRecord);
		addMessage(redirectAttributes, "删除制卡记录成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/certRecord/?repage";
	}





}