/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.constant.ExaminationRecordConstant;
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

import java.util.ArrayList;
import java.util.HashMap;
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

	@Autowired
	private ExaminationRecordItemService examinationRecordItemService;
	
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

		// 获取分页的体检记录
		Page<ExaminationRecord> page = examinationRecordService.findPage(new Page<ExaminationRecord>(request, response), examinationRecord); 
		model.addAttribute("page", page);

		// 体检套餐列表
		ExaminationPackage examinationPackage = new ExaminationPackage();
		examinationPackage.setOwner(UserUtils.getUser().getCompany().getId());
		examinationPackage.setDelFlag("0");
		examinationPackage.setReferenceFlag("0");
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		// 单位列表
		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);
		return "modules/wshbj/examinationRecordList";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = {"list_print"})
	public String list_print(ExaminationRecord examinationRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		// 获取分页的体检记录
		Page<ExaminationRecord> page = examinationRecordService.pageForPrint(new Page<ExaminationRecord>(request, response), examinationRecord);
		model.addAttribute("page", page);

		// 体检套餐列表
		ExaminationPackage examinationPackage = new ExaminationPackage();
		examinationPackage.setOwner(UserUtils.getUser().getCompany().getId());
		examinationPackage.setDelFlag("0");
		examinationPackage.setReferenceFlag("0");
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		// 单位列表
		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);

		return "modules/wshbj/examinationRecord_list_print";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = {"list_nopass"})
	public String list_nopass(ExaminationRecord examinationRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		// 获取分页的体检记录
		Page<ExaminationRecord> page = examinationRecordService.pageForNopass(new Page<ExaminationRecord>(request, response), examinationRecord);
		model.addAttribute("page", page);

		// 体检套餐列表
		ExaminationPackage examinationPackage = new ExaminationPackage();
		examinationPackage.setOwner(UserUtils.getUser().getCompany().getId());
		examinationPackage.setDelFlag("0");
		examinationPackage.setReferenceFlag("0");
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		// 单位列表
		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);

		return "modules/wshbj/examinationRecord_list_nopass";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "ajax_start_fujian")
	@ResponseBody
	public ResponseResult ajax_start_fujian(ExaminationRecord examinationRecord, Model model) {

		// 1 获得不合格的，Last的 体检项目；

		// 2 复制每个不合格的体检项目，设置为非last的状态，并保存到 ExaminationRecoredItem中

		// 3 设置每个不合格的项目 sample_code 、result_flag 为 null   examinstaion_flag 为复检 并保存。

		// 4 调用 ExaminationRecordService.updateStatus 的方法，刷新体检记录的状态。

		// 5 ajax返回，并刷新 “不合格的体检记录”列表。

		return examinationRecordService.startFujian(examinationRecord);
	}


	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "view")
	public String view(ExaminationRecord examinationRecord, Model model) {
		model.addAttribute("examinationRecord", examinationRecord);
		return "modules/wshbj/examinationRecordView";
	}

	/**
	 * 制作 体检流程表
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "print_tjb")
	public String print_tjb(String id,String format, Model model) {

		String ids="'"+id+"'";
		if(StringUtils.isEmpty(format)){
			format="pdf";
		}

		model.addAttribute("format",format);
		model.addAttribute("ids", ids);
		return "tjb";
	}

	/**
	 * 打印健康证
	 */
	@RequestMapping(value = "print_jkz1")
	public String print_jkz1(String id,String format, Model model) {

		String ids="'"+id+"'";
		String currUser=UserUtils.getUser().getName();
		String imgHost=Global.getImgHost();
		if(StringUtils.isEmpty(format)){
			format="pdf";
		}

		model.addAttribute("format",format);
		model.addAttribute("ids", ids);
		model.addAttribute("currUser", currUser);
		model.addAttribute("imgHost", imgHost);
		return "jkz1";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "form")
	public String form(ExaminationRecord examinationRecord, Model model) {

		model.addAttribute("examinationRecord", examinationRecord);


		// 获得体检套餐
		ExaminationPackage examinationPackage = new ExaminationPackage();
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		// 获得体检项目类别
		ExaminationItem examinationItem = new ExaminationItem();
		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("examinationItemList", examinationItemList);

		return "modules/wshbj/examinationRecordForm";
	}

	@RequiresPermissions("wshbj:examinationRecord:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationRecord examinationRecord, Model model, RedirectAttributes redirectAttributes) {

		//编号在保存的时候才创建
		if (StringUtils.isEmpty(examinationRecord.getCode())){
			examinationRecord.setCode(GlobalSetUtils.getGlobalSet().getCodePre()+SysSequenceUtils.nextSequence(ExaminationRecord.class,"code"));
		}

		if (!beanValidator(model, examinationRecord)){
			return form(examinationRecord, model);
		}

		//如果是新创建而不是编辑的时候，则设置状态为 未检查状态
		if(StringUtils.isBlank(examinationRecord.getId())){
			examinationRecord.setStatus(ExaminationRecordConstant.STATUS0);
			examinationRecord.setName(examinationRecord.getName());
			examinationRecord.setOwner(UserUtils.getUser().getCompany().getId());
		}

		ResponseResult result = examinationRecordService.saveRecord(examinationRecord);
		List<String> resultMessages = (List<String>) result.getData();
		addMessage(redirectAttributes, resultMessages.toArray(new String[]{}));
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecord/?repage";
	}


	
	@RequiresPermissions("wshbj:examinationRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationRecord examinationRecord, RedirectAttributes redirectAttributes) {
		ResponseResult rr = examinationRecordService.delRecord(examinationRecord);
		addMessage(redirectAttributes, rr.getMsg());
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



	/**
	* @author zhxl
	* @Description 
	* @Date 2018/4/16 00:30:12
	* @Param [examinationRecord, request, response, model, redirectAttributes]
	* @return java.lang.String 
	*/
	@RequiresPermissions("wshbj:certRecord:edit")
	@RequestMapping(value = "recordResultDetailPop")
	public String recordResultDetailPop(String recordId,HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		ExaminationRecord record = examinationRecordService.get(recordId);
		model.addAttribute("record", record);

		/**
		 * 获取体检记录所有体检项目
		 */
		List<ExaminationRecordItem> recordItemList = examinationRecordItemService.listByRecordId(recordId);
		model.addAttribute("recordItemList", recordItemList);

		return "modules/wshbj/recordResultDetailPop";
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


	@ResponseBody
	@RequestMapping(value = "getList4CertForm")
	public List<Map> getList4CertForm(String startDate,String endDate,String examinationCode
			,String organId, String userName, String status) {
		return examinationRecordService.getList4CertForm(startDate,endDate,examinationCode,organId,userName,status);
	}

	/**
	 * ajax方式获取未完成的体检记录列表，用于autocomplete
	 * @param model
	 * @return
	 */
	@RequiresPermissions("wshbj:examinationRecord:view")
	@GetMapping(value = {"ajax_no_complete_for_autocompleter"})
	@ResponseBody
	public List ajax_no_complete_for_autocompleter(String query, Model model){
		List<Map<String, String>> lstres = new ArrayList();
		try {
			ExaminationRecord er = new ExaminationRecord();

			er.setOwner(UserUtils.getUser().getCompany().getId());
			er.setCode(query);
			er.setStatus(ExaminationRecordConstant.STATUS30);
			List<ExaminationRecord> lst = examinationRecordService.listBeforeStatus(er);


			for (ExaminationRecord ertmp : lst) {
				Map<String, String> mer = new HashMap();
				mer.put("id", ertmp.getId());
				mer.put("name", ertmp.getName());
				mer.put("code", ertmp.getCode());

				mer.put("value", ertmp.getCode());
				mer.put("label", ertmp.getCode() + "[" + ertmp.getName() + "]");
				lstres.add(mer);
			}

		}catch (Exception e){
			e.printStackTrace();;
		}
		return lstres;
	}


	/**
	 * 通过记录id获取采购信息
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "ajax_get_by_record_code")
	public RequestResult ajax_get_by_record_code(ExaminationRecord examinationRecord, HttpServletResponse response) {
		if(examinationRecord==null||StringUtils.isEmpty(examinationRecord.getCode())){
			return RequestResult.generate(10,"未能获取体检记录的code");
		}

		ExaminationRecord er = examinationRecordService.getByCode(examinationRecord);
		if(er==null){
			return RequestResult.generate(12,"由于未知原因，code :"+examinationRecord.getCode()+"未能获取体检记录数据");
		}

		return RequestResult.generate(RequestResult.SUCCESS,"获取体检记录成功",er);
	}

}