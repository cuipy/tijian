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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemService;
import org.apache.commons.collections.map.HashedMap;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
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
import java.util.List;
import java.util.Map;
import javax.validation.ConstraintViolationException;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationSamples;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationSamplesService;

/**
 * 体检样本Controller
 * @author zhxl
 * @version 2018-03-25
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationSamples")
public class ExaminationSamplesController extends BaseController {

	@Autowired
	private ExaminationSamplesService examinationSamplesService;
	@Autowired
	private ExaminationItemService examinationItemService;
	
	@ModelAttribute
	public ExaminationSamples get(@RequestParam(required=false) String id) {
		ExaminationSamples entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationSamplesService.get(id);
		}
		if (entity == null){
			entity = new ExaminationSamples();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationSamples examinationSamples, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationSamples> page = examinationSamplesService.findPage(new Page<ExaminationSamples>(request, response), examinationSamples); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationSamplesList";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = "view")
	public String view(ExaminationSamples examinationSamples, Model model) {
		model.addAttribute("examinationSamples", examinationSamples);
		return "modules/wshbj/examinationSamplesPage";
	}

	@RequiresPermissions("wshbj:examinationRecordItem:view")
	@RequestMapping(value = "form")
	public String form(ExaminationSamples examinationSamples, Model model) {
		model.addAttribute("examinationSamples", examinationSamples);

		Office company = UserUtils.getUser().getCompany();
		ExaminationItem examinationItem = new ExaminationItem();
		examinationItem.setOwner(company.getId());
		examinationItem.setNeedSamples("1");

		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		List<ExaminationItem> examinationItemList1 = new ArrayList<ExaminationItem>();
		if(examinationItemList!=null){
			Subject subject = SecurityUtils.getSubject();
			for (ExaminationItem item:examinationItemList) {
				if (subject.isPermitted(item.getPermission())){
					examinationItemList1.add(item);
				}
			}
		}

		model.addAttribute("itemList", examinationItemList1);

		return "modules/wshbj/examinationSamplesForm";
	}

//	@RequiresPermissions("wshbj:examinationRecordItem:edit")
//	@RequestMapping(value = "save")
//	public String save(ExaminationSamples examinationSamples, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, examinationSamples)){
//			return form(examinationSamples, model);
//		}
//		examinationSamples.setOwner(UserUtils.getUser().getCompany().getId());
//        ResponseResult result = examinationSamplesService.saveSamples(examinationSamples);
//        if(!ResponseResult.SUCCESS.equals(result.getCode())){
//            List<String> resultMessages = (List<String>) result.getData();
//            addMessage(redirectAttributes, resultMessages.toArray(new String[]{}));
//            return form(examinationSamples, model);
//        }
//
//		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationSamples/form";
//	}

    @RequiresPermissions("wshbj:examinationRecordItem:edit")
    @RequestMapping(value = "saveSamples")
    @ResponseBody
    public ResponseResult saveSamples(ExaminationSamples examinationSamples, Model model, RedirectAttributes redirectAttributes) {
        examinationSamples.setOwner(UserUtils.getUser().getCompany().getId());
        ResponseResult result = examinationSamplesService.saveSamples(examinationSamples);
        return result;
    }


	
	@RequiresPermissions("wshbj:examinationRecordItem:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationSamples examinationSamples, RedirectAttributes redirectAttributes) {
		examinationSamplesService.delete(examinationSamples);
		addMessage(redirectAttributes, "删除体检样本成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationSamples/?repage";
	}


	@ResponseBody
	@RequestMapping(value = "getListMap4Result")
	public List<Map> getListMap4Result(String startDate,String endDate,String startCode,String endCode,String orgId,String orgName,
							 String itemId,String sampleCode,String examinationCode) {


		return examinationSamplesService.getListMap4Result(startDate,endDate,startCode,endCode,orgId,orgName,itemId,sampleCode,examinationCode);
	}


}