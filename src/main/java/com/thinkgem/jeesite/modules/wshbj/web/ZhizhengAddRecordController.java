/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ZhizhengAddRecord;
import com.thinkgem.jeesite.modules.wshbj.service.ZhizhengAddRecordService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 制证数量记录Controller
 * @author cuipengyu
 * @version 2018-06-12
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/zhizhengAddRecord")
public class ZhizhengAddRecordController extends BaseController {

	@Autowired
	private ZhizhengAddRecordService zhizhengAddRecordService;


	@ModelAttribute
	public ZhizhengAddRecord get(@RequestParam(required=false) String id) {
		ZhizhengAddRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = zhizhengAddRecordService.get(id);
		}
		if (entity == null){
			entity = new ZhizhengAddRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:zhizhengAddRecord:view")
	@RequestMapping(value = {"list"})
	public String list(ZhizhengAddRecord zhizhengAddRecord, Model model) {

		return "modules/wshbj/zhizhengAddRecord_list";
	}

	@RequiresPermissions("wshbj:zhizhengAddRecord:edit")
	@RequestMapping(value = {"add"})
	public String add(ZhizhengAddRecord zhizhengAddRecord, Model model) {

		String ownerId = UserUtils.getUser().getCompany().getId();
		model.addAttribute("ownerId",ownerId);

		// 获取最新的记录
		ZhizhengAddRecord record = zhizhengAddRecordService.getLastRecord();
		if(record!=null){
			model.addAttribute("currAddCode",record.getAdd_code());
			model.addAttribute("currResultCount",record.getResult_count());
		}


		return "modules/wshbj/zhizhengAddRecord_form";
	}

}