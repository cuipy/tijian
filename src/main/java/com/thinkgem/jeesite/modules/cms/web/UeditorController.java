/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import com.baidu.ueditor.ActionEnter;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Ueditor Controller
 * @author cuipengyu
 * @version 2018-3-22
 */
@Controller
@RequestMapping(value = "${adminPath}/ueditor/")
public class UeditorController extends BaseController {



	@RequestMapping(value = "/upload")
	public String upload(HttpServletRequest req) {

		String id=UserUtils.getPrincipal().getId();

		String rootPath = Global.getUserfilesBaseDir()+"userfiles/"+id+"/";
		String jsonConfigPath = Global.getProjectRealPath()+"static/ueditor/config.json";

        ActionEnter ae = new ActionEnter(req, rootPath);

        String res= ae.exec();

        return res;

	}


}
