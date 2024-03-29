/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import com.drew.lang.StringUtil;
import java.text.*;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;
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

	@Autowired
	private SpecimenService specimenService;

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

		// 获得体检项目类别
 		ExaminationItem examinationItem = new ExaminationItem();
		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("examinationItemList", examinationItemList);
		if(examinationRecordItem.getBeginDate()==null||examinationRecordItem.getEndDate()==null){
			examinationRecordItem.setItemId("0");
		}

		examinationRecordItem.setUserName("");

		// 读取已经有采样，但还没有输入结果的项目
		Page<ExaminationRecordItem> page = examinationRecordItemService.pageResulting(new Page<ExaminationRecordItem>(request, response), examinationRecordItem);

		model.addAttribute("page", page);
		return "modules/wshbj/examinationRecordItem_list_resulting";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = {"list_resulted"})
	public String list_resulted(ExaminationRecordItem examinationRecordItem, HttpServletRequest request, HttpServletResponse response, Model model) {
		// 获得体检项目类别
		ExaminationItem examinationItem = new ExaminationItem();
		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("examinationItemList", examinationItemList);
		if(examinationRecordItem.getBeginDate()==null||examinationRecordItem.getEndDate()==null){
			examinationRecordItem.setItemId("0");
		}

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
/*待录结果项目是否合格
* */
	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@PostMapping(value = "ajax_update_result_flag")
	@ResponseBody
	public RequestResult ajax_update_result_flag(String resultFlag,String resultRemarks , Model model){

        String res = "";
        Integer state=0;
		if(StringUtils.isNotEmpty(resultFlag)){
			String[] arrResultFlag = StringUtils.split(resultFlag,'|');

			if(arrResultFlag.length>0){
				for(String strResultFlag : arrResultFlag){
					if(StringUtils.isEmpty(strResultFlag)){
						continue;
					}
					/*分割itemId和是否合格*/
					String[] arrRf=StringUtils.split(strResultFlag,',');
					if(arrRf.length!=2||StringUtils.isEmpty(arrRf[0])||StringUtils.isEmpty(arrRf[1])){
						continue;
					}
					/*修改检查结果是否合格*/
					String itemId=arrRf[0];
					String strFlag=arrRf[1];

					ExaminationRecordItem examinationRecordItem = new ExaminationRecordItem();
					examinationRecordItem.setId(itemId);
					examinationRecordItem.setResultFlag(strFlag);
					examinationRecordItem.setResultRemarks(resultRemarks);


					RequestResult rr = examinationRecordItemService.updateResultFlagById(examinationRecordItem);
					res+=rr.getState()+":"+rr.getMsg()+"<br>";
					state=rr.getState();
				}
			}

		}
		return RequestResult.generate(state,res);

	}
	/*待录结果项目批量是否合格
	 * */
	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@PostMapping(value = "ajax_update_allresult_flag")
	@ResponseBody
	public RequestResult ajax_update_allresult_flag(String ids,String resultFlag, Model model){
		String res = "";
		//判断是id串是否为空
		if(StringUtils.isNotEmpty(ids)){
			//用,分隔id字符串
			String[] id = StringUtils.split(ids,',');
			if(id.length>0){
				//循环录入结果
				for(String strid : id){
					if(StringUtils.isEmpty(strid)){
						continue;
					}
					//修改检查结果是否合格
					String recordId=strid;
					String strFlag=resultFlag;

					ExaminationRecordItem examinationRecordItem = new ExaminationRecordItem();
					examinationRecordItem.setRecordId(recordId);
					examinationRecordItem.setResultFlag(strFlag);

					RequestResult rr = examinationRecordItemService.updateResultFlag(examinationRecordItem);
					res+=rr.getState()+":"+rr.getMsg()+"<br>";
				}
			}

		}
		return RequestResult.generate(1,res);

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

		Integer count = examinationRecordItemService.updateSampleCodePrintCount(examinationRecordItem);
		return RequestResult.generate(1,"更新成功");
	}

	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@RequestMapping(value = "ajax_update_grab_sample")
	@ResponseBody
	public RequestResult ajax_update_grab_sample(String examRecordId, String specimenId , Model model){
		/* 储存取样本的时间*/
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(dateString, pos);

 		Integer count = examinationRecordItemService.updateGrabSample(examRecordId, specimenId,strtodate);
		return RequestResult.generate(1,"更新成功");
	}

	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@PostMapping(value = "ajax_cancel_grab_sample")
	@ResponseBody
	public RequestResult ajax_cancel_grab_sample(String examRecordId, String specimenId ){
		/* 储存取样本的时间*/
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(dateString, pos);
 		Integer count = examinationRecordItemService.cancelGrabSample(examRecordId, specimenId,strtodate);
		return RequestResult.generate(1,"撤销成功");
	}


	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@RequestMapping(value = {"grab_sample"})
	public String grab_sample(String currSpecimenId,String examRecordCode , Model model) {

		String myDeptId=UserUtils.getUser().getOffice().getId();
		model.addAttribute("myDeptId",myDeptId);

		// 获取 什么阶段生成 样本编号 ；获取 什么阶段打印 样本编号
		Integer sampleCodeCreatePoint =GlobalSetUtils.getGlobalSet().getSampleCodeCreatePoint();
		Integer sampleCodePrintPoint  =GlobalSetUtils.getGlobalSet().getSampleCodePrintPoint();

		model.addAttribute("sampleCodeCreatePoint",sampleCodeCreatePoint);
		model.addAttribute("sampleCodePrintPoint",sampleCodePrintPoint);

		// 加载当前用户所在部门的采样标本
		String deptId = UserUtils.getUser().getOffice().getId();
		Specimen sp=new Specimen();
		sp.setGrabDeptId(deptId);
		List<Specimen> specimens = specimenService.findList(sp);

		model.addAttribute("specimens",specimens);

		// 如果只有一个标本，则默认选中
		if(specimens.size()>0&&StringUtils.isEmpty(currSpecimenId)){
			currSpecimenId=specimens.get(0).getId();
		}

		// 如果没有设置 currSpecimenId 参数
		if(StringUtils.isEmpty(currSpecimenId)){
			return "modules/wshbj/examinationRecordItem_grab_sample";
		}

		model.addAttribute("currSpecimenId",currSpecimenId);

		String newSampleCode = null;
		boolean autoPrint = false;
		Integer sampleCodeCount = 0;
		// 获取 采样记录Code
		if(StringUtils.isNotEmpty(examRecordCode)){
			ExaminationRecord er=new ExaminationRecord();
			er.setCode(examRecordCode);
			ExaminationRecord record = examinationRecordService.getByCode(er);

			if(record!=null) {
				List<ExaminationRecordItem> recordItems = record.getItems();
				if (recordItems != null) {
					for (ExaminationRecordItem eri : recordItems) {
						// 1类型与当前类型 currSpecimenId 相同， 2 最新的体检记录项目
						if (eri.getSpecimenId().equals(currSpecimenId) && "1".equals(eri.getLastFlag())) {
							model.addAttribute("examRecord",record);
							sampleCodeCount++;

							// 如果没有样本编号，则生成样本编号
							String sampleCode = eri.getSampleCode();
							if(StringUtils.isEmpty(sampleCode)) {

								if(StringUtils.isEmpty(newSampleCode)) {
									String itemId = eri.getItemId();
									ExaminationItem examItem = examinationItemService.get(itemId);
									// 样本编号前缀
									String prefixSampleCode = examItem.getPrefixSampleCode();
									newSampleCode = SysSequenceUtils.nextSequence(prefixSampleCode + "{yyMMdd}[4]");
								}
								eri.setSampleCode(newSampleCode);
								/* 储存取样本的时间*/
								Date currentTime = new Date();
								SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								String dateString = formatter.format(currentTime);
								ParsePosition pos = new ParsePosition(0);
								Date strtodate = formatter.parse(dateString, pos);
								eri.setGrabSampleTime(strtodate);
								examinationRecordItemService.save(eri);
								if(record.getStatus().equals("0")) {
                                    record.setStatus("10");
                                }
                                examinationRecordService.updateStatus(record);
								autoPrint=true;
							}else{
								// 已经有样本编号，则使用之前生产的样本编号
								if(StringUtils.isEmpty(newSampleCode)) {
									newSampleCode = sampleCode;
								}
								if(record.getStatus().equals("0")) {
									record.setStatus("10");
								}
								examinationRecordService.updateStatus(record);
							}

						}
					}
				}
			}
		}

		// 是否自动打印
		model.addAttribute("autoPrint",autoPrint);

		model.addAttribute("sampleCode",newSampleCode);

		model.addAttribute("sampleCodeCount",sampleCodeCount);

		return "modules/wshbj/examinationRecordItem_grab_sample";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@RequestMapping(value = {"set_result"})
	public String set_result(String examRecordCode,  Model model) {
        ExaminationItem   examinationItem=new ExaminationItem();

		String myDeptId=UserUtils.getUser().getOffice().getId();
		model.addAttribute("myDeptId",myDeptId);

		ExaminationRecord record = null;
		List <ExaminationRecordItem> examinationRecordItem=null;
		// 获取 采样记录Code
		if(StringUtils.isNotEmpty(examRecordCode)){
			ExaminationRecord er=new ExaminationRecord();
			er.setCode(examRecordCode);
			record = examinationRecordService.getByCode(er);
			String deptId = UserUtils.getUser().getOffice().getId();
			if(record!=null){
				examinationRecordItem=examinationRecordItemService.listByRecordIdAndDetId(record.getId(),deptId);
			}else{
				examinationRecordItem=examinationRecordItemService.listByRecordIdAndDetId(examRecordCode,deptId);
				if(examinationRecordItem!=null){
					record = examinationRecordService.get(examinationRecordItem.get(0).getRecordId());
				}

			}

		}
		model.addAttribute("examinationRecordItem",examinationRecordItem);

		model.addAttribute("examRecord",record);
		return "modules/wshbj/examinationRecordItem_set_result";
	}

 	@RequestMapping(value = "ajax_examinationRecordItem")
	@ResponseBody
	public List<ExaminationRecordItem>  ajax_examinationRecordItem(String recordId,String code, Model model){
		List<ExaminationRecordItem> list =null;
		if(!StringUtils.isEmpty(code)){
			ExaminationRecord examinationRecord=new ExaminationRecord();
			examinationRecord.setCode(code);
			examinationRecord=examinationRecordService.getByCode(examinationRecord);
			if(examinationRecord!=null) {
				recordId = examinationRecord.getId();
				list=examinationRecordItemService.listByRecordId(recordId);
			}
 		}
		if(!StringUtils.isEmpty(recordId)){

			list=examinationRecordItemService.listByRecordId(recordId);

		}

 		return list;
	}
	@RequestMapping(value = "ajax_examinationRecordItem2")
	@ResponseBody
	public List<ExaminationRecordItem>  ajax_examinationRecordItem2(String recordId, Model model){
		List<ExaminationRecordItem> list =null;
		if(!StringUtils.isEmpty(recordId)){

				list=examinationRecordItemService.listByRecordId(recordId);

		}

		return list;
	}



}