/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import com.drew.lang.StringUtil;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.constant.ExaminationRecordConstant;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import com.thinkgem.jeesite.modules.wshbj.service.*;
import org.apache.commons.collections.map.HashedMap;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 体检记录Controller
 * @author zhxl
 * @version 2018-03-17
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationRecordItem")
public class ExaminationRecordItemController extends BaseController {



	@Autowired
	private ExaminationRecordItemService examinationRecordItemService;
	@Autowired
	private ExaminationRecordService examinationRecordService;
	@Autowired
	private ExaminationItemService examinationItemService;
	@Autowired
	private SampleCodesService sampleCodesService;
	
	@ModelAttribute
	public ExaminationRecordItem get(@RequestParam(required=false) String id) {
		ExaminationRecordItem entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationRecordItemService.get(id);
		}
		if (entity == null){
			entity = new ExaminationRecordItem();
		}
		return entity;
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = {"list_need_sample_nodo"})
	public String list_need_sample_nodo(ExaminationRecordItem examinationRecordItem, HttpServletRequest request, HttpServletResponse response, Model model) {

		examinationRecordItem.setNeedSamples("1");
		Page<ExaminationRecordItem> page = examinationRecordItemService.pageNeedSampleNodo(new Page<ExaminationRecordItem>(request, response), examinationRecordItem);
		model.addAttribute("page", page);
		model.addAttribute("where","_nodo");
		return "modules/wshbj/examinationRecordItem_list_need_sample";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = {"list_need_sample_done"})
	public String list_need_sample_done(ExaminationRecordItem examinationRecordItem, HttpServletRequest request, HttpServletResponse response, Model model) {

		examinationRecordItem.setNeedSamples("1");
		Page<ExaminationRecordItem> page = examinationRecordItemService.pageNeedSampleDone(new Page<ExaminationRecordItem>(request, response), examinationRecordItem);
		model.addAttribute("page", page);
		model.addAttribute("where","_done");
		return "modules/wshbj/examinationRecordItem_list_need_sample";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = {"list_need_sample"})
	public String list_need_sample(ExaminationRecordItem examinationRecordItem, HttpServletRequest request, HttpServletResponse response, Model model) {

		examinationRecordItem.setNeedSamples("1");
		Page<ExaminationRecordItem> page = examinationRecordItemService.pageAllNeedSample(new Page<ExaminationRecordItem>(request, response), examinationRecordItem);
		model.addAttribute("page", page);
		model.addAttribute("where","");
		return "modules/wshbj/examinationRecordItem_list_need_sample";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = {"list_resulting"})
	public String list_resulting(ExaminationRecordItem examinationRecordItem, HttpServletRequest request, HttpServletResponse response, Model model) {

		// 读取已经有采样，但还没有输入结果的项目
		Page<ExaminationRecordItem> page = examinationRecordItemService.pageResulting(new Page<ExaminationRecordItem>(request, response), examinationRecordItem);
		model.addAttribute("page", page);
		return "modules/wshbj/examinationRecordItem_list_resulting";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = {"list_resulted"})
	public String list_resulted(ExaminationRecordItem examinationRecordItem, HttpServletRequest request, HttpServletResponse response, Model model) {

		// 已经有采样，且有输入结果，并且体检记录还没结束的项目
		Page<ExaminationRecordItem> page = examinationRecordItemService.pageResulted(new Page<ExaminationRecordItem>(request, response), examinationRecordItem);
		model.addAttribute("page", page);
		return "modules/wshbj/examinationRecordItem_list_resulted";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = "form")
	public String form(ExaminationRecordItem examinationRecordItem, Model model) {
		model.addAttribute("examinationRecordItem", examinationRecordItem);
		return "modules/wshbj/examinationRecordItemForm";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@RequestMapping(value = "saveSamples")
	public String saveSamples(ExaminationRecordItem examinationRecordItem, RedirectAttributes redirectAttributes, Model model) {

		if(examinationRecordItem==null||StringUtils.isEmpty(examinationRecordItem.getRecordId())){
			addMessage(redirectAttributes,"检查记录为空，无法进行采样数据保存");
			model.addAttribute("examinationRecordItem", examinationRecordItem);
			return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecordItem/form?repage";
		}

		if(!examinationRecordItem.getGrabSample()){
			addMessage(redirectAttributes,"未完成采样，无法进行采样数据保存");
			model.addAttribute("examinationRecordItem", examinationRecordItem);
			return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecordItem/form?repage";
		}

		RequestResult result = examinationRecordItemService.saveSamples(examinationRecordItem);
		if(1==result.getState()){

			// 更新SampleCodes 中的已使用 状态
			SampleCodes sc=new SampleCodes();
			sc.setSampleCode(examinationRecordItem.getSampleCode());
			sampleCodesService.updateUsed(sc);

			addMessage(redirectAttributes,result.getMsg());
			return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecordItem/list_need_sample_nodo";
		}else{
			addMessage(redirectAttributes,result.getMsg());
			model.addAttribute("examinationRecordItem", examinationRecordItem);
			return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecordItem/form?repage";
		}
	}


	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = "ajax_check_sample_code")
	@ResponseBody
	public RequestResult ajax_check_sample_code(ExaminationRecordItem examinationRecordItem, Model model){
		return examinationRecordItemService.checkSampleCode(examinationRecordItem);
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = "ajax_update_result_flag")
	@ResponseBody
	public RequestResult ajax_update_result_flag(ExaminationRecordItem examinationRecordItem, Model model){
		return examinationRecordItemService.updateResultFlag(examinationRecordItem);
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = "ajax_cancel_sample")
	@ResponseBody
	public RequestResult ajax_cancel_sample(ExaminationRecordItem examinationRecordItem, Model model){
		return examinationRecordItemService.cancelSample(examinationRecordItem);
	}

	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@RequestMapping(value = "ajax_cancel_result")
	@ResponseBody
	public RequestResult ajax_cancel_result(ExaminationRecordItem examinationRecordItem, Model model){
		return examinationRecordItemService.cancelResult(examinationRecordItem);
	}

	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@RequestMapping(value = "ajax_update_sample_code_print_count")
	@ResponseBody
	public RequestResult ajax_update_sample_code_print_count(ExaminationRecordItem examinationRecordItem, Model model){
		Integer count = examinationRecordItemService.updateSampleCodePrintCount(examinationRecordItem.getId());
		return RequestResult.generate(1,"更新成功");
	}


	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@RequestMapping(value = {"grab_sample"})
	public String grab_sample(String currExamItemId,String examRecordCode , Model model) {

		// 获取 什么阶段生成 样本编号 ；获取 什么阶段打印 样本编号
		Integer sampleCodeCreatePoint =GlobalSetUtils.getGlobalSet().getSampleCodeCreatePoint();
		Integer sampleCodePrintPoint= GlobalSetUtils.getGlobalSet().getSampleCodePrintPoint();

		model.addAttribute("sampleCodeCreatePoint",sampleCodeCreatePoint);
		model.addAttribute("sampleCodePrintPoint",sampleCodePrintPoint);

		// 加载需要采集样本的类型列表
		ExaminationItem ei=new ExaminationItem();
		ei.setNeedSamples("1");
		List<ExaminationItem> needSampleItems = examinationItemService.findList(ei);
		model.addAttribute("needSampleItems",needSampleItems);

		// 如果没有设置 currExamItemId 参数
		if(StringUtils.isEmpty(currExamItemId)){
			return "modules/wshbj/examinationRecordItem_grab_sample";
		}

		model.addAttribute("currExamItemId",currExamItemId);

		// 获取 采样记录Code
		if(StringUtils.isNotEmpty(examRecordCode)){
			ExaminationRecord er=new ExaminationRecord();
			er.setCode(examRecordCode);
			ExaminationRecord record = examinationRecordService.getByCode(er);

			if(record!=null) {
				List<ExaminationRecordItem> recordItems = record.getItems();
				if (recordItems != null) {
					for (ExaminationRecordItem eri : recordItems) {
						// 1类型与当前类型 currExamItemId 相同， 2 最新的体检记录项目  3 未采样
						if (eri.getItemId().equals(currExamItemId) && "1".equals(eri.getLastFlag()) && !eri.getGrabSample()) {
							model.addAttribute("examRecord",record);

							// 如果没有样本编号，则生成样本编号
							String sampleCode = eri.getSampleCode();
							if(StringUtils.isEmpty(sampleCode)) {
								String itemId = eri.getItemId();
								ExaminationItem examItem = examinationItemService.get(itemId);

								// 样本编号前缀
								String prefixSampleCode = examItem.getPrefixSampleCode();
								sampleCode = SysSequenceUtils.nextSequence(prefixSampleCode + "{yyMMdd}[4]");
								eri.setSampleCode(sampleCode);

							}
							// 设置真实采样
							if(!eri.getGrabSample()) {
								eri.setGrabSample(true);
								eri.setGrabSampleTime(new Date());
							}

							examinationRecordItemService.save(eri);

							model.addAttribute("examRecordItem",eri);
							break;
						}
					}
				}
			}
		}

		return "modules/wshbj/examinationRecordItem_grab_sample";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@RequestMapping(value = {"set_result"})
	public String set_result(String currExamItemId, String examRecordCode,  Model model) {
		// 加载 所有体检项目 ExaminationItem 列表
		ExaminationItem ei=new ExaminationItem();
		List<ExaminationItem> examItems = examinationItemService.findList(ei);
		model.addAttribute("examItems",examItems);

		// 如果没有设置 currExamItemId 参数
		if(StringUtils.isEmpty(currExamItemId)){
			return "modules/wshbj/examinationRecordItem_set_result";
		}

		model.addAttribute("currExamItemId",currExamItemId);

		// 获取 采样记录Code
		if(StringUtils.isNotEmpty(examRecordCode)){
			ExaminationRecord er=new ExaminationRecord();
			er.setCode(examRecordCode);
			ExaminationRecord record = examinationRecordService.getByCode(er);

			if(record!=null) {
				List<ExaminationRecordItem> recordItems = record.getItems();
				if (recordItems != null) {
					for (ExaminationRecordItem eri : recordItems) {

						// 1 类型正确  2 是最新的体检记录项目  3 没有结果
						if (eri.getItemId().equals(currExamItemId) && "1".equals(eri.getLastFlag()) && StringUtils.isEmpty(eri.getResultFlag()) ) {
							model.addAttribute("examRecord",record);
							break;
						}
					}
				}
			}
		}

		return "modules/wshbj/examinationRecordItem_set_result";
	}

}