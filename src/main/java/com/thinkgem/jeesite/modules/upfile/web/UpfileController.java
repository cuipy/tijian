/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.upfile.web;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.security.shiro.session.SessionDAO;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.*;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.web.Servlets;
import com.thinkgem.jeesite.modules.sys.security.FormAuthenticationFilter;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.upfile.bean.UpfileResp;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Map;

/**
 * 登录Controller
 * @author ThinkGem
 * @version 2013-5-31
 */
@Controller
@RequestMapping(value = "${adminPath}/upfile")
public class UpfileController extends BaseController{
	
	@Autowired
	private SessionDAO sessionDAO;
	
	/**
	 * 管理登录
	 */
	@RequestMapping(value = "upbase64", method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult upbase64(String base64) {

		if(StringUtils.isEmpty(base64)){
			return null;
		}

		Principal principal = UserUtils.getPrincipal();

		String relaPath="/"+principal.getId()+"/images/"+StringUtils.formatDate(new java.util.Date(),"/yyyy/MM/dd/");
		String savePath=FileUtils.path(Global.getUserfilesBaseDir()+ Global.USERFILES_BASE_URL +relaPath);
		String relaUrlPath= Servlets.getRequest().getContextPath() + Global.USERFILES_BASE_URL+relaPath;

		String newFileName=StringUtils.rand(new java.util.Date(),"HHmmss",4)+".jpg";

		Boolean state=FileUtils.saveBase64(base64,savePath,newFileName);
		if(state){
			UpfileResp resp=new UpfileResp();
			resp.setSourceType("base64");
			resp.setSaveUrl(FileUtils.path(relaUrlPath+newFileName));

			return new ResponseResult("0","上传成功",resp);
		}

		return new ResponseResult("1001","由于未知原因，上传失败",null);
	}


}
