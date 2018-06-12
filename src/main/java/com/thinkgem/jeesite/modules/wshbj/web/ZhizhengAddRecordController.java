/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import com.alibaba.druid.support.json.JSONUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.ZhizhengAddRecord;
import com.thinkgem.jeesite.modules.wshbj.service.ZhizhengAddRecordService;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			model.addAttribute("currAddCode",record.getAddCode());
			model.addAttribute("currResultCount",record.getResultCount());
		}else {
			model.addAttribute("currAddCode","空");
			model.addAttribute("currResultCount",0);
		}


		return "modules/wshbj/zhizhengAddRecord_form";
	}

	@RequiresPermissions("wshbj:zhizhengAddRecord:edit")
	@RequestMapping(value = {"ajax_add"})
	@ResponseBody
	public RequestResult ajax_add(String add_code) {

		// 判断格式
		if(StringUtils.isEmpty(add_code)||add_code.length()<=32){
			return RequestResult.generate(101,"编号 "+add_code+" 不合法。");
		}

		// 分解真正的add_code和数字
		String strCount=StringUtils.substring(add_code,32);
		if(!NumberUtils.isNumber(strCount)){
			return RequestResult.generate(121,"编号 "+add_code+"新增的数量不合法。");
		}

		Integer addCount = Integer.valueOf(strCount);

		String addCode = StringUtils.substring(add_code,0,32);

		String ownerId = UserUtils.getUser().getCompany().getId();

		// 获取最新的记录
		String newCode = zhizhengAddRecordService.buildNewCode(ownerId,addCount);

		System.out.println(newCode);
		if(newCode.equals(addCode)){
			zhizhengAddRecordService.addCode(ownerId,addCode,addCount);

			return RequestResult.generate(1,"新增制证数量成功");
		}else {
			return RequestResult.generate(131,"编号"+add_code+"不合法。");
		}



	}

}