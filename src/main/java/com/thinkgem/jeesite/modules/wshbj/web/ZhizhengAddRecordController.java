package com.thinkgem.jeesite.modules.wshbj.web;

import com.alibaba.druid.support.json.JSONUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.ZhizhengAddRecord;
import com.thinkgem.jeesite.modules.wshbj.service.ZhizhengAddRecordService;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.bouncycastle.ocsp.Req;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	/**
	 * 加载体检中心的制证数变化的列表
	 * @param zhizhengAddRecord
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("wshbj:zhizhengAddRecord:view")
	@RequestMapping(value = {"list"})
	public String list(ZhizhengAddRecord zhizhengAddRecord, HttpServletRequest request, HttpServletResponse response, Model model) {

		Page<ZhizhengAddRecord> page = zhizhengAddRecordService.findPage(new Page<ZhizhengAddRecord>(request, response), zhizhengAddRecord);
		model.addAttribute("page", page);

		return "modules/wshbj/zhizhengAddRecord_list";
	}

	/**
	 * 进入新增制证数的页面
	 * @param zhizhengAddRecord
	 * @param model
	 * @return
	 */
	@RequiresPermissions("wshbj:zhizhengAddRecord:edit")
	@RequestMapping(value = {"add"})
	public String add(ZhizhengAddRecord zhizhengAddRecord, Model model) {

		// 作为种子
		String ownerId = UserUtils.getUser().getCompany().getId();
		model.addAttribute("ownerId",ownerId);

		// 获取最新的记录
		ZhizhengAddRecord record = zhizhengAddRecordService.getLastRecord();
		if(record!=null){
			// 最后一个制证数的md5的编码
			model.addAttribute("currAddCode",record.getAddCode());
			// 当前可制证数的明文
			model.addAttribute("currResultCount",record.getResultCount());
		}else {
			// 如果是第一次
			model.addAttribute("currAddCode","空");
			model.addAttribute("currResultCount",0);
		}


		return "modules/wshbj/zhizhengAddRecord_form";
	}

	@RequiresPermissions("wshbj:zhizhengAddRecord:view")
	@RequestMapping(value = {"ajax_get_last"})
	@ResponseBody
	public RequestResult ajax_get_last() {
		ZhizhengAddRecord record = zhizhengAddRecordService.getLastRecord();
		return RequestResult.generate(1,"获取最新制证数量记录",record);
	}

	/**
	 * ajax方式新增制证数
	 * @param add_code  md5 + 明文的数量   比如 eae520817e0bee80e0361a227ad3d28d + 12  = eae520817e0bee80e0361a227ad3d28d12
	 *                  是在运营服务端生成的
	 *                  生成的算法，根据 种子、最新add_code、明文的新增数量 md5加密算得的
	 * @return
	 */
	@RequiresPermissions("wshbj:zhizhengAddRecord:edit")
	@RequestMapping(value = {"ajax_add"})
	@ResponseBody
	public RequestResult ajax_add(String add_code) {

		int MD5_LEN=32;
		// 判断格式
		if(StringUtils.isEmpty(add_code)||add_code.length()<=MD5_LEN){
			return RequestResult.generate(101,"编号 "+add_code+" 不合法。");
		}

		// 分解真正的add_code和数字
		String strCount=StringUtils.substring(add_code,MD5_LEN);
		if(!NumberUtils.isNumber(strCount)){
			return RequestResult.generate(121,"编号 "+add_code+"新增的数量不合法。");
		}

		Integer addCount = Integer.valueOf(strCount);

		// 拆除 32位的 md5 的 addCode
		String addCode = StringUtils.substring(add_code,0,MD5_LEN);

		// 获得当前用户的owner  作为种子
		String ownerId = UserUtils.getUser().getCompany().getId();

		// 获取最新的记录
		String newCode = zhizhengAddRecordService.buildNewCode(ownerId,addCount);

		logger.info(newCode);
		if(newCode.equals(addCode)){
			zhizhengAddRecordService.addCode(ownerId,addCode,addCount);
			return RequestResult.generate(1,"新增制证数量成功");
		}else {
			return RequestResult.generate(131,"编号"+add_code+"不合法。");
		}

	}

}