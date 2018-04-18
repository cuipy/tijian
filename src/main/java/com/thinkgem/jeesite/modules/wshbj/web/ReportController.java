/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.oned.Code128Writer;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.wshbj.service.CertRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * 首页Controller
 * @author cuipengyu
 * @version 2018-04-14
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/report")
public class ReportController extends BaseController {

	@RequestMapping(value = {"test1"})
	public String test1(Model m) {
		m.addAttribute("format","pdf");
		return "test1";
	}

	@RequestMapping(value = {"test3"})
	public String test3(Model m) {
		m.addAttribute("format","pdf");
		return "test3";
	}

	@RequestMapping(value = {"test2"})
	public String test2(Model m) {
		m.addAttribute("format","pdf");
		m.addAttribute("tjsj","25");
		return "test2";
	}


	@RequestMapping(value = {"test4"})
	@ResponseBody
	public String test4(Model m) {

		try {
			BufferedImage mtw = MatrixToImageWriter.toBufferedImage(new Code128Writer().encode("ADD123333444400001", BarcodeFormat.CODE_128, 260, 46));

			java.io.File f=new java.io.File("/work/apps/tomcat8/webapps/wshbj/static/a.jpg");
			ImageIO.write(mtw,"jpg",f);

		} catch (WriterException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "http://xn.jiisb.com:8051/wshbj/static/a.jpg";

	}

}