/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import com.thinkgem.jeesite.modules.wshbj.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

	@GetMapping(value = "tjb1_html")
	public String tjb_html(String id,Model model) {
		ExaminationRecord er = examinationRecordService.get(id);
		model.addAttribute("examRecord",er);
		return "modules/wshbj/examRecordPrint_tjb1_html";
	}
	@GetMapping(value = "tjb2_html")
	public String tjb2_html(String id,Model model) {
		ExaminationRecord er = examinationRecordService.get(id);
		model.addAttribute("examRecord",er);
		return "modules/wshbj/examRecordPrint_tjb2_html";
	}
	@GetMapping(value = "tjb3_html")
	public String tjb3_html(String id,Model model) {
		ExaminationRecord er = examinationRecordService.get(id);
		model.addAttribute("examRecord",er);
		model.addAttribute("examinationRecord",er);


		return "modules/wshbj/examRecordPrint_tjb3_html";
	}

	@GetMapping(value = "barcode_html")
	public String barcode_html(String barcode,Model model) {
		model.addAttribute("barcode",barcode);
		return "modules/wshbj/examRecordPrint_barcode_html";
	}

	@GetMapping(value = "zhizheng_html")
	public String zhizheng_html(String id,Model model) {
		ExaminationRecord er=examinationRecordService.get(id);
		String headImg=examinationRecordService.getHeadImg(id);

		er.setHeadImg(headImg);
		model.addAttribute("examRecord",er);

		return "modules/wshbj/examRecordPrint_zhizheng_html";
	}
	@GetMapping(value = "zhizheng_html2")
	public String zhizheng_html2(String id,Model model) {
		ExaminationRecord er=examinationRecordService.get(id);
		String headImg=examinationRecordService.getHeadImg(id);

		er.setHeadImg(headImg);
		model.addAttribute("examRecord",er);

		return "modules/wshbj/examRecordPrint_zhizheng_html2";
	}


}