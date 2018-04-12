/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import com.thinkgem.jeesite.modules.wshbj.service.*;
import org.apache.commons.collections.map.HashedMap;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.thinkgem.jeesite.common.utils.DateUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.util.Map;
import javax.validation.ConstraintViolationException;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 体检记录Controller
 * @author zhxl
 * @version 2018-03-17
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationRecord")
public class ExaminationRecordController extends BaseController {

	@Autowired
	private ExaminationRecordService examinationRecordService;

	@Autowired
	private OrganService organService;
	@Autowired
	private IndustryService industryService;
	@Autowired
	private JobPostService jobPostService;
	@Autowired
	private ExaminationItemService examinationItemService;
	@Autowired
	private ExaminationSamplesService examinationSamplesService;

	@Autowired
	private ExaminationPackageService examinationPackageService;
	
	@ModelAttribute
	public ExaminationRecord get(@RequestParam(required=false) String id) {
		ExaminationRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationRecordService.get(id);
		}
		if (entity == null){
			entity = new ExaminationRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationRecord examinationRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationRecord> page = examinationRecordService.findPage(new Page<ExaminationRecord>(request, response), examinationRecord); 
		model.addAttribute("page", page);

		ExaminationPackage examinationPackage = new ExaminationPackage();
		examinationPackage.setOwner(UserUtils.getUser().getCompany().getId());
		examinationPackage.setDelFlag("0");
		examinationPackage.setReferenceFlag("0");
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);
		return "modules/wshbj/examinationRecordList";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "view")
	public String view(ExaminationRecord examinationRecord, Model model) {
		model.addAttribute("examinationRecord", examinationRecord);
		return "modules/wshbj/examinationRecordPage";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "form")
	public String form(ExaminationRecord examinationRecord, Model model) {
		if (StringUtils.isBlank(examinationRecord.getCode())){
			examinationRecord.setCode(examinationRecordService.genCode());
		}
		model.addAttribute("examinationRecord", examinationRecord);

		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);

		Industry industry = new Industry();
		industry.setOwner(UserUtils.getUser().getCompany().getId());
		industry.setDelFlag("0");
		industry.setReferenceFlag("0");
		List<Industry> industryList = industryService.findList(industry);
		model.addAttribute("industryList", industryList);

		JobPost jobPost = new JobPost();
		jobPost.setOwner(UserUtils.getUser().getCompany().getId());
		jobPost.setDelFlag("0");
		jobPost.setReferenceFlag("0");
		List<JobPost> postList = jobPostService.findList(jobPost);
		model.addAttribute("postList", postList);

		ExaminationPackage examinationPackage = new ExaminationPackage();
		examinationPackage.setOwner(UserUtils.getUser().getCompany().getId());
		examinationPackage.setDelFlag("0");
		examinationPackage.setReferenceFlag("0");
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		ExaminationItem examinationItem = new ExaminationItem();
		examinationItem.setOwner(UserUtils.getUser().getCompany().getId());
		examinationItem.setDelFlag("0");
		examinationItem.setReferenceFlag("0");
		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("examinationItemList", examinationItemList);

		return "modules/wshbj/examinationRecordForm";
	}

	@RequiresPermissions("wshbj:examinationRecord:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationRecord examinationRecord, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationRecord)){
			return form(examinationRecord, model);
		}
		examinationRecord.setName(examinationRecord.getUser().getName());
		examinationRecord.setOwner(UserUtils.getUser().getCompany().getId());
		if (StringUtils.isBlank(examinationRecord.getStatus())){
			examinationRecord.setStatus("1");
		}


		ResponseResult result = examinationRecordService.saveRecord(examinationRecord);
		List<String> resultMessages = (List<String>) result.getData();
		addMessage(redirectAttributes, resultMessages.toArray(new String[]{}));
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecord/?repage";
	}


	
	@RequiresPermissions("wshbj:examinationRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationRecord examinationRecord, RedirectAttributes redirectAttributes) {
		examinationRecordService.delete(examinationRecord);
		addMessage(redirectAttributes, "删除体检记录成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecord/?repage";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "export",method=RequestMethod.POST)
	public String exportFile(ExaminationRecord examinationRecord,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "体检记录数据"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            List<ExaminationRecord> list = examinationRecordService.findList(examinationRecord);
    		new ExportExcel("examinationRecord数据", ExaminationRecord.class).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出体检记录失败！失败信息："+e.getMessage());
		}
		return "redirect:" + Global.getAdminPath() + "/wshbj/examinationRecord/list?repage";
	}


	@RequiresPermissions("wshbj:examinationRecord:collectSamples")
	@RequestMapping(value = "collectSamples")
	public String collectSamples(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		Office company = UserUtils.getUser().getCompany();
		ExaminationItem examinationItem = new ExaminationItem();
		examinationItem.setOwner(company.getId());
		examinationItem.setNeedSamples("1");

		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("itemList", examinationItemList);
		return "modules/wshbj/collectSamples";
	}


	@RequiresPermissions("wshbj:examinationRecord:inputSamplesResult")
	@RequestMapping(value = "inputSamplesResult")
	public String inputSamplesResult(ExaminationRecord examinationRecord,HttpServletRequest request, HttpServletResponse response,Model model, RedirectAttributes redirectAttributes) {
		Office company = UserUtils.getUser().getCompany();
		ExaminationItem examinationItem = new ExaminationItem();
		examinationItem.setOwner(company.getId());
		examinationItem.setNeedSamples("1");

		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("itemList", examinationItemList);
		return "modules/wshbj/inputSamplesResult";
	}


	@RequiresPermissions("wshbj:examinationRecord:inputSamplesResult")
	@RequestMapping(value = "saveSamplesResult")
	@ResponseBody
	public ResponseResult saveSamplesResult(@RequestParam(name="samplesIdArray[]") String[] samplesIdArray
			,@RequestParam(name="resultDictIdArray[]")String[] resultDictIdArray
			,@RequestParam(name="resultRemarksArray[]")String[] resultRemarksArray) {
		ResponseResult result = examinationSamplesService.saveSamplesResult(samplesIdArray,resultDictIdArray,resultRemarksArray);
		return result;
	}


	@RequiresPermissions("wshbj:examinationRecord:inputResult")
	@RequestMapping(value = "saveResult")
	@ResponseBody
	public ResponseResult saveResult(@RequestParam(name="recordItemIdArray[]")String[] recordItemIdArray
			,@RequestParam(name="resultDictIdArray[]")String[] resultDictIdArray
			,@RequestParam(name="resultRemarksArray[]")String[] resultRemarksArray) {
		ResponseResult responseResult = examinationRecordService.saveResult(recordItemIdArray,resultDictIdArray,resultRemarksArray);
		return responseResult;
	}

	/**
	 * 录入体检结果
	 * @param examinationRecord
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("wshbj:examinationRecord:inputResult")
	@RequestMapping(value = "inputResult")
	public String inputResult(ExaminationRecord examinationRecord,HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);
		return "modules/wshbj/inputResult";
	}






	@ResponseBody
	@RequestMapping(value = "getByCode")
	public ExaminationRecord getByCode(@RequestParam(required=true) String code, HttpServletResponse response) {
		if (org.apache.commons.lang3.StringUtils.isBlank(code)){
			return null;
		}
		ExaminationRecord examinationRecord = examinationRecordService.getByCode(code);
		return examinationRecord;
	}

    @ResponseBody
    @RequestMapping(value = "getMapByCode")
    public Map getMapByCode(@RequestParam(required=true) String code, HttpServletResponse response) {
        if (org.apache.commons.lang3.StringUtils.isBlank(code)){
            return new HashedMap();
        }
        return examinationRecordService.getMapByCode(code);
    }

	@ResponseBody
	@RequestMapping(value = "getMapByCode4Result")
	public Map getMapByCode4Result(@RequestParam(required=true) String code,@RequestParam()String examinationFlag, HttpServletResponse response) {
		if (org.apache.commons.lang3.StringUtils.isBlank(code)){
			return new HashedMap();
		}
		return examinationRecordService.getMapByCode4Result(code,examinationFlag);
	}


	@ResponseBody
	@RequestMapping(value = "getListMap4Result")
	public List<ExaminationRecord> getListMap4Result(String startDate,String endDate,String examinationCode,String organId) {

		return examinationRecordService.getList4Result(startDate,endDate,examinationCode,organId);
	}

	@ResponseBody
	@RequestMapping(value = "getItemListMap4Result")
	public List<Map> getItemListMap4Result(String recordId) {

		return examinationRecordService.getItemListMap4Result(recordId);
	}
}