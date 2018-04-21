/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

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
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@RequestMapping(value = {"list_need_sample"})
	public String list_need_sample(ExaminationRecordItem examinationRecordItem, HttpServletRequest request, HttpServletResponse response, Model model) {

		examinationRecordItem.setNeedSamples("1");
		Page<ExaminationRecordItem> page = examinationRecordItemService.findPage(new Page<ExaminationRecordItem>(request, response), examinationRecordItem);
		model.addAttribute("page", page);
		return "modules/wshbj/examinationRecordItem_list_need_sample";
	}


}