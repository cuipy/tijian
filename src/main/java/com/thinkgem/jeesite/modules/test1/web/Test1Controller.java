/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test1.web;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.fastjson.JSONArray;
import com.ckfinder.connector.utils.PathUtils;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.annotation.SequenceBean;
import com.thinkgem.jeesite.common.utils.*;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.web.Servlets;
import com.thinkgem.jeesite.modules.sys.service.SysSequenceService;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterContext;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.*;
import net.sf.jasperreports.export.annotations.ExporterParameter;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.ConstraintViolationException;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.test1.entity.Test1;
import com.thinkgem.jeesite.modules.test1.service.Test1Service;

/**
 * 测试1 描述Controller
 * @author 崔鹏宇
 * @version 2018-03-13
 */
@Controller
@RequestMapping(value = "${adminPath}/test1/test1")
public class Test1Controller extends BaseController {

	@Autowired
	private Test1Service test1Service;

	@ModelAttribute
	public Test1 get(@RequestParam(required=false) String id) {
		Test1 entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = test1Service.get(id);
		}
		if (entity == null){
			entity = new Test1();
		}
		return entity;
	}

	@RequiresPermissions("test1:test1:view")
	@RequestMapping(value = {"lr1"})
	public String lr1(String format,HttpServletResponse resp,Model m) {

		m.addAttribute("format",format);
		m.addAttribute("url","/WEB-INF/jasper/test3.jasper");

		return "jr";
	}
	
	@RequiresPermissions("test1:test1:view")
	@RequestMapping(value = {"list", ""})
	public String list(Test1 test1, HttpServletRequest request, HttpServletResponse response, Model model) {

		Page<Test1> page = test1Service.findPage(new Page<Test1>(request, response), test1);
		model.addAttribute("page", page);
		return "modules/test1/test1List";
	}

	@RequiresPermissions("test1:test1:view")
	@RequestMapping(value = "view")
	public String view(Test1 test1, Model model) {
		model.addAttribute("test1", test1);
		return "modules/test1/test1Page";
	}

	@RequiresPermissions("test1:test1:view")
	@RequestMapping(value = "form")
	public String form(Test1 test1, Model model) {
		model.addAttribute("test1", test1);
		return "modules/test1/test1Form";
	}

	@RequiresPermissions("test1:test1:edit")
	@RequestMapping(value = "save")
	public String save(Test1 test1, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, test1)){
			return form(test1, model);
		}
		test1Service.save(test1);
		addMessage(redirectAttributes, "保存测试1成功");
		return "redirect:"+Global.getAdminPath()+"/test1/test1/?repage";
	}
	
	@RequiresPermissions("test1:test1:edit")
	@RequestMapping(value = "delete")
	public String delete(Test1 test1, RedirectAttributes redirectAttributes) {
		test1Service.delete(test1);
		addMessage(redirectAttributes, "删除测试1成功");
		return "redirect:"+Global.getAdminPath()+"/test1/test1/?repage";
	}

	@RequiresPermissions("test1:test1:view")
	@RequestMapping(value = "export",method=RequestMethod.POST)
	public String exportFile(Test1 test1,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "测试1数据"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            List<Test1> list = test1Service.findList(test1);
    		new ExportExcel("test1数据", Test1.class).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出测试1失败！失败信息："+e.getMessage());
		}
		return "redirect:" + Global.getAdminPath() + "/test1/test1/list?repage";
	}


	/**
	 * 导入测试1数据
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("test1:test1:edit")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + Global.getAdminPath() + "/test1/test1/list?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<Test1> list = ei.getDataList(Test1.class);
			for (Test1 test1 : list){
				try{
					BeanValidators.validateWithException(validator, test1);
					test1Service.save(test1);
					successNum++;

				}catch(ConstraintViolationException ex){
					failureMsg.append("<br/>测试1 导入失败：");
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList){
						failureMsg.append(message+"; ");
						failureNum++;
					}
				}catch (Exception ex) {
					failureMsg.append("<br/>测试1 导入失败："+ex.getMessage());
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条测试1，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条测试1"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入测试1失败！失败信息："+e.getMessage());
		}
		return "redirect:" + Global.getAdminPath() + "/test1/test1/list?repage";
    }

	/**
	 * 下载导入测试1数据模板
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("test1:test1:view")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "测试1数据导入模板.xlsx";
    		List<Test1> list = Lists.newArrayList();
    		new ExportExcel("测试1数据", Test1.class, 2).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:" + Global.getAdminPath() + "/test1/test1/list?repage";
    }


}