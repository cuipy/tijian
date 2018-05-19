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
@RequestMapping(value = "${adminPath}/wshbj/exam_record_print")
public class ExamRecordPrintController extends BaseController {

	@Autowired
	private ExaminationRecordService examinationRecordService;
	

	/**
	 * 制作 体检流程表
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "tjb_jr")
	public String tjb_jr(String id,String format, Model model) {

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

	@GetMapping(value = "tjb_html")
	public String tjb_html(String[] id,Model model) {
		List<ExaminationRecord> ers=examinationRecordService.listByIds(id);
		model.addAttribute("lst",ers);
		return "modules/wshbj/tjb_html";
	}

	@GetMapping(value = "barcode_html")
	public String barcode_html(String barcode,Model model) {
		model.addAttribute("barcode",barcode);
		return "modules/wshbj/barcode_html";
	}



}