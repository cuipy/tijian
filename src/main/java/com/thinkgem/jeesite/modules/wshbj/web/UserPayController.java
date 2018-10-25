/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.PinyinUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.dao.UserPayDao;
import com.thinkgem.jeesite.modules.wshbj.entity.JobPost;
import com.thinkgem.jeesite.modules.wshbj.entity.UserPay;
import com.thinkgem.jeesite.modules.wshbj.service.JobPostService;
import com.thinkgem.jeesite.modules.wshbj.service.UserPayService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 工作岗位Controller
 * @author zhxl
 * @version 2018-03-11
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/userPay")
public class UserPayController extends BaseController {

	@Autowired
	private UserPayService userPayService;
	@Autowired
	private UserPayDao userPayDao;


	@ResponseBody
	@GetMapping(value = "ispay")
	public String ispay(String idNumber) {
		if(StringUtils.isEmpty(idNumber)){
			return "false";
		}
		UserPay userPay=userPayDao.findByIdnumber(idNumber);
		if(userPay!=null){
			return "true";
		}else {
			return "false";
		}


 	}
	@ResponseBody
	@GetMapping(value = "add_user_pay")
	public String addUserPay(String idNumber) {
		if(StringUtils.isEmpty(idNumber)){
			return "false";
		}
		UserPay userPay=new UserPay();
		userPay.setIdnumber(idNumber);
		userPay.setState(0);
		UserPay isPayserPay=userPayDao.findByIdnumber(idNumber);
		if(isPayserPay==null){
			return "false";
		}

		if(userPayDao.insert(userPay)!=0){
			return "true";
 		}else {
			return "false";
		}


	}


	@ResponseBody
	@GetMapping(value = "find_user_pay")
	public UserPay findUserPay(String idNumber) {
		UserPay userPay= new UserPay();
		if(StringUtils.isEmpty(idNumber)){
			return userPay;
		}
		userPay=userPayDao.findByIdnumber(idNumber);
 		return userPay;
	}

	@ResponseBody
	@GetMapping(value = "delete_user_pay")
	public String deleteUserPay(String idNumber) {
		if(StringUtils.isEmpty(idNumber)){
			return "false";
		}
		UserPay userPay=new UserPay();
		userPay.setIdnumber(idNumber);
		userPay.setState(0);
		if(userPayDao.delete(userPay)!=0){
			return "true";
		}else {
			return "false";
		}


	}

}