/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import com.thinkgem.jeesite.common.utils.ZxingHandler;
import com.thinkgem.jeesite.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 标签Controller
 * @author ThinkGem
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/zxing")
public class ZxingController extends BaseController {

	@GetMapping(value = "encode.jpg")
	public void encode(String code,Integer width,Integer height, HttpServletRequest req, HttpServletResponse resp, Model model) {

		try {
			if(code==null){
				code= "1001-10201805070002";
			}
			if(width==null){
				width=150;
			}
			if(height==null){
				height=30;
			}

			resp.setContentType("image/jpeg");
			ServletOutputStream os = resp.getOutputStream();

			ZxingHandler.encode(code,width,height,os);

			os.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
