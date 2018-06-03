/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.drew.lang.StringUtil;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.common.utils.ImageUtils;
import com.thinkgem.jeesite.common.utils.PinyinUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
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
import com.thinkgem.jeesite.common.utils.DateUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import org.springframework.web.multipart.MultipartFile;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.ConstraintViolationException;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import sun.misc.BASE64Decoder;
import sun.misc.Request;

/**
 * 体检记录Controller
 * @author zhxl
 * @version 2018-03-17
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationRecord")
public class ExaminationRecordController extends BaseController {

	@Autowired
	private ExaminationRecordService examinationRecordService;

	@Autowired
	private OrganService organService;
	@Autowired
	private IndustryService industryService;
	@Autowired
	private JobPostService jobPostService;
	@Autowired
	private ExaminationItemService examinationItemService;
	@Autowired
	private ExaminationUserService examinationUserService;
	@Autowired
	private ExaminationSamplesService examinationSamplesService;

	@Autowired
	private ExaminationPackageService examinationPackageService;

	@Autowired
	private ExaminationRecordItemService examinationRecordItemService;
	
	@ModelAttribute
	public ExaminationRecord get(@RequestParam(required=false) String id) {
		ExaminationRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationRecordService.get(id);
		}
		if (entity == null){
			entity = new ExaminationRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationRecord examinationRecord, HttpServletRequest request, HttpServletResponse response, Model model) {

		// 获取分页的体检记录
		Page<ExaminationRecord> page = examinationRecordService.findPage(new Page<ExaminationRecord>(request, response), examinationRecord); 
		model.addAttribute("page", page);

		// 体检套餐列表
		ExaminationPackage examinationPackage = new ExaminationPackage();
		examinationPackage.setOwner(UserUtils.getUser().getCompany().getId());
		examinationPackage.setDelFlag("0");
		examinationPackage.setReferenceFlag("0");
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		// 单位列表
		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);
		return "modules/wshbj/examinationRecordList";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = {"list_print"})
	public String list_print(ExaminationRecord examinationRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		// 获取分页的体检记录
		Page<ExaminationRecord> page = examinationRecordService.pageForPrint(new Page<ExaminationRecord>(request, response), examinationRecord);
		model.addAttribute("page", page);

		// 体检套餐列表
		ExaminationPackage examinationPackage = new ExaminationPackage();
		examinationPackage.setOwner(UserUtils.getUser().getCompany().getId());
		examinationPackage.setDelFlag("0");
		examinationPackage.setReferenceFlag("0");
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		// 单位列表
		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);

		return "modules/wshbj/examinationRecord_list_print";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = {"list_nopass"})
	public String list_nopass(ExaminationRecord examinationRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		// 获取分页的体检记录
		Page<ExaminationRecord> page = examinationRecordService.pageForNopass(new Page<ExaminationRecord>(request, response), examinationRecord);
		model.addAttribute("page", page);

		// 体检套餐列表
		ExaminationPackage examinationPackage = new ExaminationPackage();
		examinationPackage.setOwner(UserUtils.getUser().getCompany().getId());
		examinationPackage.setDelFlag("0");
		examinationPackage.setReferenceFlag("0");
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		// 单位列表
		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);

		return "modules/wshbj/examinationRecord_list_nopass";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "ajax_start_fujian")
	@ResponseBody
	public RequestResult ajax_start_fujian(ExaminationRecord examinationRecord, Model model) {

		// 1 获得不合格的，Last的 体检项目；

		// 2 复制每个不合格的体检项目，设置为非last的状态，并保存到 ExaminationRecoredItem中

		// 3 设置每个不合格的项目 sample_code 、result_flag 为 null   examinstaion_flag 为复检 并保存。

		// 4 调用 ExaminationRecordService.updateStatus 的方法，刷新体检记录的状态。

		// 5 ajax返回，并刷新 “不合格的体检记录”列表。

		return examinationRecordService.startFujian(examinationRecord);
	}


	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "view")
	public String view(ExaminationRecord examinationRecord, Model model) {
		model.addAttribute("examinationRecord", examinationRecord);
		return "modules/wshbj/examinationRecordView";
	}

	/**
	 * 制作 体检流程表
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "print_tjb")
	public String print_tjb(String id,String format, Model model) {

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

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "form")
	public String form(ExaminationRecord examinationRecord, Model model) {

		model.addAttribute("examinationRecord", examinationRecord);

		// 获取行业列表
		Industry industry = new Industry();
		industry.setOwner(UserUtils.getUser().getCompany().getId());
		industry.setDelFlag("0");
		industry.setReferenceFlag("0");
		List<Industry> industryList = industryService.findList(industry);
		model.addAttribute("industryList", industryList);

		// 岗位类别
		JobPost jobPost = new JobPost();
		jobPost.setOwner(UserUtils.getUser().getCompany().getId());
		jobPost.setDelFlag("0");
		jobPost.setReferenceFlag("0");
		List<JobPost> postList = jobPostService.findList(jobPost);
		model.addAttribute("postList", postList);

		// 获得体检套餐
		ExaminationPackage examinationPackage = new ExaminationPackage();
		List<ExaminationPackage> packageList = examinationPackageService.findList(examinationPackage);
		model.addAttribute("packageList", packageList);

		// 获得体检项目类别
		ExaminationItem examinationItem = new ExaminationItem();
		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("examinationItemList", examinationItemList);

		// 获取条码生成 和 打印 阶段
		Integer sampleCodeCreatePoint = GlobalSetUtils.getGlobalSet().getSampleCodeCreatePoint();
		Integer sampleCodePrintPoint = GlobalSetUtils.getGlobalSet().getSampleCodePrintPoint();

		model.addAttribute("sampleCodeCreatePoint",sampleCodeCreatePoint);
		model.addAttribute("sampleCodePrintPoint",sampleCodePrintPoint);

		return "modules/wshbj/examinationRecordForm";
	}

//	@RequiresPermissions("wshbj:examinationRecord:edit")
//	@RequestMapping(value = "save")
//	public String save(ExaminationRecord examinationRecord, Model model, RedirectAttributes redirectAttributes) {
//
//		//编号在保存的时候才创建
//		if (StringUtils.isEmpty(examinationRecord.getCode())){
//			examinationRecord.setCode(GlobalSetUtils.getGlobalSet().getCodePre()+SysSequenceUtils.nextSequence(ExaminationRecord.class,"code"));
//		}
//
//		if (!beanValidator(model, examinationRecord)){
//			return RequestResult.generate(102,model.);
//		}
//
//		//如果是新创建而不是编辑的时候，则设置状态为 未检查状态
//		if(StringUtils.isBlank(examinationRecord.getId())){
//			examinationRecord.setStatus(ExaminationRecordConstant.STATUS0);
//			examinationRecord.setName(examinationRecord.getName());
//			examinationRecord.setOwner(UserUtils.getUser().getCompany().getId());
//		}
//
//		RequestResult result = examinationRecordService.saveRecord(examinationRecord);
//		List<String> resultMessages = (List<String>) result.getData();
//		addMessage(redirectAttributes, resultMessages.toArray(new String[]{}));
//		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecord/?repage";
//	}

	/**
	 * ajax方式保存体检记录
	 * @param examinationRecord
	 * @param model
	 * @return
	 */
	@RequiresPermissions("wshbj:examinationRecord:edit")
	@RequestMapping(value = "ajax_save")
	@ResponseBody
	public RequestResult ajax_save(ExaminationRecord examinationRecord, Model model) {

		//编号在保存的时候才创建
		if (StringUtils.isEmpty(examinationRecord.getCode())){

			// 如果行业上已经设置了编号规则，则按照行业编号规则生成体检编号
			Industry industry = examinationRecord.getIndustry();
			String newCode = null;
			if(industry!=null&&StringUtils.isNotEmpty(industry.getPrefixExamCode())){
				newCode=SysSequenceUtils.nextSequence(industry.getPrefixExamCode()+"{yyMMdd}[4]");
			}else{
				// 否则按照系统默认规则生成。
				newCode=GlobalSetUtils.getGlobalSet().getCodePre()+SysSequenceUtils.nextSequence(ExaminationRecord.class,"code");
			}
			examinationRecord.setCode(newCode);
		}

		// 体检时间
		if(examinationRecord.getExamTime()==null){
			examinationRecord.setExamTime(new java.util.Date());
		}

		// 设置体检类型，无套餐id，则自由选择体检项目； 有套餐id，则套餐体检
		if(StringUtils.isEmpty(examinationRecord.getPackageId())){
			examinationRecord.setItemType("2");
		}else{
			examinationRecord.setItemType("1");
		}

		// 验证数据是否合法
		if (!beanValidator(model, examinationRecord)){
			Object msg = model.asMap().get("message");
			return RequestResult.generate(102,msg.toString());
		}

		//如果是新创建而不是编辑的时候，则设置状态为 未检查状态
		if(StringUtils.isBlank(examinationRecord.getId())){
			examinationRecord.setStatus(ExaminationRecordConstant.STATUS0);
			examinationRecord.setName(examinationRecord.getName());
			examinationRecord.setOwner(UserUtils.getUser().getCompany().getId());
		}

		// 检验用户身份证号码
		ExaminationUser examUser = examinationUserService.getByIdNumberAndOwner(examinationRecord.getIdNumber(), UserUtils.getUser().getCompany().getId());
		if(examUser==null){
			// 用户不存在，则创建用户
			examUser=new ExaminationUser();
			examUser.setOwner(UserUtils.getUser().getCompany().getId());
			examUser.setIdNumber(examinationRecord.getIdNumber());
			examUser.setName(examinationRecord.getName());
			examUser.setNamePinyin(PinyinUtils.getStringPinYin(examUser.getName()));
			examUser.setPhoneNumber(examinationRecord.getPhoneNumber());
			examUser.setBirthday(examinationRecord.getBirthday());
			examUser.setAge(examinationRecord.getAge());
			examUser.setIndustryId(examinationRecord.getIndustryId());
			examUser.setOrganId(examinationRecord.getOrganId());
			examUser.setPostId(examinationRecord.getPostId());
			examUser.setCode(SysSequenceUtils.nextSequence(ExaminationUser.class,"code"));

			examUser.setHeadImgPath(examinationRecord.getHeadImg());
			examUser.setIdNumberPicHead(examinationRecord.getIdNumberPicHead());
			examUser.setIdNumberPicFore(examinationRecord.getIdNumberPicFore());
			examUser.setIdNumberPicBack(examinationRecord.getIdNumberPicBack());

			examinationUserService.save(examUser);

			if(examinationRecord.getUser()==null){
				examinationRecord.setUser(examUser);
			}else{
				examinationRecord.getUser().setId(examUser.getId());
			}
		}

		if(StringUtils.isEmpty(examinationRecord.getHeadImg())){
			examinationRecord.setHeadImg(examUser.getHeadImgPath());
		}

		RequestResult result = examinationRecordService.saveRecord(examinationRecord);
		return result;
	}

	
	@RequiresPermissions("wshbj:examinationRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationRecord examinationRecord, RedirectAttributes redirectAttributes) {
		RequestResult rr = examinationRecordService.delRecord(examinationRecord);
		addMessage(redirectAttributes, rr.getMsg());
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecord/?repage";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "export",method=RequestMethod.POST)
	public String exportFile(ExaminationRecord examinationRecord,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "体检记录数据"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            List<ExaminationRecord> list = examinationRecordService.findList(examinationRecord);
    		new ExportExcel("examinationRecord数据", ExaminationRecord.class).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出体检记录失败！失败信息："+e.getMessage());
		}
		return "redirect:" + Global.getAdminPath() + "/wshbj/examinationRecord/list?repage";
	}


	@RequiresPermissions("wshbj:examinationRecord:collectSamples")
	@RequestMapping(value = "collectSamples")
	public String collectSamples(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		Office company = UserUtils.getUser().getCompany();
		ExaminationItem examinationItem = new ExaminationItem();
		examinationItem.setOwner(company.getId());
		examinationItem.setNeedSamples("1");

		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("itemList", examinationItemList);
		return "modules/wshbj/collectSamples";
	}


	@RequiresPermissions("wshbj:examinationRecord:inputSamplesResult")
	@RequestMapping(value = "inputSamplesResult")
	public String inputSamplesResult(ExaminationRecord examinationRecord,HttpServletRequest request, HttpServletResponse response,Model model, RedirectAttributes redirectAttributes) {
		Office company = UserUtils.getUser().getCompany();
		ExaminationItem examinationItem = new ExaminationItem();
		examinationItem.setOwner(company.getId());
		examinationItem.setNeedSamples("1");

		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("itemList", examinationItemList);
		return "modules/wshbj/inputSamplesResult";
	}


	@RequiresPermissions("wshbj:examinationRecord:inputSamplesResult")
	@RequestMapping(value = "saveSamplesResult")
	@ResponseBody
	public ResponseResult saveSamplesResult(@RequestParam(name="samplesIdArray[]") String[] samplesIdArray
			,@RequestParam(name="resultDictIdArray[]")String[] resultDictIdArray
			,@RequestParam(name="resultRemarksArray[]")String[] resultRemarksArray) {
		ResponseResult result = examinationSamplesService.saveSamplesResult(samplesIdArray,resultDictIdArray,resultRemarksArray);
		return result;
	}

	/**
	 * 录入体检结果
	 * @param examinationRecord
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("wshbj:examinationRecord:inputResult")
	@RequestMapping(value = "inputResult")
	public String inputResult(ExaminationRecord examinationRecord,HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);
		return "modules/wshbj/inputResult";
	}



//	/**
//	* @author zhxl
//	* @Description
//	* @Date 2018/4/16 00:30:12
//	* @Param [examinationRecord, request, response, model, redirectAttributes]
//	* @return java.lang.String
//	*/
//	@RequiresPermissions("wshbj:certRecord:edit")
//	@RequestMapping(value = "recordResultDetailPop")
//	public String recordResultDetailPop(String recordId,HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
//		ExaminationRecord record = examinationRecordService.get(recordId);
//		model.addAttribute("record", record);
//
//		/**
//		 * 获取体检记录所有体检项目
//		 */
//		List<ExaminationRecordItem> recordItemList = examinationRecordItemService.listByRecordId(recordId);
//		model.addAttribute("recordItemList", recordItemList);
//
//		return "modules/wshbj/recordResultDetailPop";
//	}
//
//
//
//
//	@ResponseBody
//	@RequestMapping(value = "getMapByCode4Result")
//	public Map getMapByCode4Result(@RequestParam(required=true) String code,@RequestParam()String examinationFlag, HttpServletResponse response) {
//		if (org.apache.commons.lang3.StringUtils.isBlank(code)){
//			return new HashedMap();
//		}
//		return examinationRecordService.getMapByCode4Result(code,examinationFlag);
//	}
//
//
//	@ResponseBody
//	@RequestMapping(value = "getListMap4Result")
//	public List<ExaminationRecord> getListMap4Result(String startDate,String endDate,String examinationCode,String organId) {
//
//		return examinationRecordService.getList4Result(startDate,endDate,examinationCode,organId);
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "getItemListMap4Result")
//	public List<Map> getItemListMap4Result(String recordId) {
//
//		return examinationRecordService.getItemListMap4Result(recordId);
//	}
//
//
//	@ResponseBody
//	@RequestMapping(value = "getList4CertForm")
//	public List<Map> getList4CertForm(String startDate,String endDate,String examinationCode
//			,String organId, String userName, String status) {
//		return examinationRecordService.getList4CertForm(startDate,endDate,examinationCode,organId,userName,status);
//	}

	/**
	 * ajax方式获取未完成的体检记录列表，用于autocomplete
	 * @param model
	 * @return
	 */
	@RequiresPermissions("wshbj:examinationRecord:view")
	@GetMapping(value = {"ajax_no_complete_for_autocompleter"})
	@ResponseBody
	public List ajax_no_complete_for_autocompleter(String query, Model model){
		List<Map<String, String>> lstres = new ArrayList();
		try {
			ExaminationRecord er = new ExaminationRecord();

			er.setOwner(UserUtils.getUser().getCompany().getId());
			er.setCode(query);
			er.setStatus(ExaminationRecordConstant.STATUS30);
			List<ExaminationRecord> lst = examinationRecordService.listBeforeStatus(er);


			for (ExaminationRecord ertmp : lst) {
				Map<String, String> mer = new HashMap();
				mer.put("id", ertmp.getId());
				mer.put("name", ertmp.getName());
				mer.put("code", ertmp.getCode());

				mer.put("value", ertmp.getCode());
				mer.put("label", ertmp.getCode() + "[" + ertmp.getName() + "]");
				lstres.add(mer);
			}

		}catch (Exception e){
			e.printStackTrace();;
		}
		return lstres;
	}


	/**
	 * 通过记录id获取采购信息
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "ajax_get_by_record_code")
	public RequestResult ajax_get_by_record_code(ExaminationRecord examinationRecord, HttpServletResponse response) {
		if(examinationRecord==null||StringUtils.isEmpty(examinationRecord.getCode())){
			return RequestResult.generate(10,"未能获取体检记录的code");
		}

		ExaminationRecord er = examinationRecordService.getByCode(examinationRecord);
		if(er==null){
			return RequestResult.generate(12,"由于未知原因，code :"+examinationRecord.getCode()+"未能获取体检记录数据");
		}

		return RequestResult.generate(RequestResult.SUCCESS,"获取体检记录成功",er);
	}

	/**
	 * 检查体检记录是否 有合法的 采样 类型
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "ajax_check_exam_record_code_can_grab_sample")
	public RequestResult ajax_check_exam_record_code_can_grab_sample(String examRecordCode ,String specimenId) {
		ExaminationRecord er=new ExaminationRecord();
		er.setCode(examRecordCode);
		ExaminationRecord record = examinationRecordService.getByCode(er);

		if(record==null){
			return RequestResult.generate(10,"未能获得体检记录");
		}

		List<ExaminationRecordItem> recordItems = record.getItems();
		if(recordItems==null){
			return RequestResult.generate(2,"体检记录下没有体检记录");
		}

		for(ExaminationRecordItem eri:recordItems){
			if(eri.getSpecimenId().equals(specimenId) && "1".equals(eri.getLastFlag())){
				// 该体检记录 对应的体检项目，已经采样
				if(eri.getGrabSample()){
					return RequestResult.generate(3,"该体检记录已经采样，采样编号为："+eri.getSampleCode());
				}

				return RequestResult.generate(1,"该体检记录可以采样");
			}
		}

		return RequestResult.generate(8,"该体检人不需要进行该标本的采样");
	}

	@RequestMapping(value = "getHeadImg")
	public void getHeadImg(String id, HttpServletResponse response) {

		String imgStr = examinationRecordService.getHeadImg(id);

		if(imgStr==null||imgStr.length()<22){
			return;
		}
		imgStr=imgStr.substring(22);
		ImageUtils.base64OutResponse(imgStr,"jpg",response);
	}

	/**
	 * 检查体检记录是否可录入体检结果
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "ajax_check_exam_record_code_can_set_result")
	public RequestResult ajax_check_exam_record_code_can_set_result(String examRecordCode ,String examItemId) {
		ExaminationRecord er=new ExaminationRecord();
		er.setCode(examRecordCode);
		ExaminationRecord record = examinationRecordService.getByCode(er);

		if(record==null){
			return RequestResult.generate(10,"未能获得体检记录");
		}

		List<ExaminationRecordItem> recordItems = record.getItems();
		if(recordItems==null){
			return RequestResult.generate(2,"体检记录下没有体检记录");
		}

		for(ExaminationRecordItem eri:recordItems){
			if(eri.getItemId().equals(examItemId) && "1".equals(eri.getLastFlag())){
				// 该体检记录 对应的体检项目，已经采样
				if("1".equals(eri.getNeedSamples())&&!eri.getGrabSample()){
					return RequestResult.generate(4,"该体检记录需要先采样，然后才可以录入体检结果。");
				}

				// 该体检记录 对应的体检项目，已经采样
				if(StringUtils.isNotEmpty(eri.getResultFlag())){
					return RequestResult.generate(3,"该体检记录已经已经录入体检结果："+eri.getResultFlag()+":"+eri.getStrResultFlag());
				}

				return RequestResult.generate(1,"该体检记录可以录入体检结果");
			}
		}

		return RequestResult.generate(8,"该体检人不需要进行该项目的检查");
	}

	/**
	 * 检查体检记录是否可制卡
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "ajax_check_exam_record_code_can_print_card")
	public RequestResult ajax_check_exam_record_code_can_print_card(String examRecordCode ) {
		ExaminationRecord er=new ExaminationRecord();
		er.setCode(examRecordCode);
		ExaminationRecord record = examinationRecordService.getByCode(er);

		if(record==null){
			return RequestResult.generate(10,"未能获得体检记录");
		}

		if("40".equals(record.getStatus())||"45".equals(record.getStatus())||"50".equals(record.getStatus())){
			return RequestResult.generate(1,"体检记录可以制卡");
		}else{
			return RequestResult.generate(Integer.parseInt(record.getStatus()),record.getStrStatus());
		}

	}

	@RequiresPermissions("wshbj:examinationRecord:edit")
	@RequestMapping(value = {"print_card"})
	public String print_card(String examRecordCode,  Model model) {

		// 获取 采样记录Code
		if(StringUtils.isNotEmpty(examRecordCode)){
			ExaminationRecord er=new ExaminationRecord();
			er.setCode(examRecordCode);
			ExaminationRecord record = examinationRecordService.getByCode(er);

			if(record!=null) {
				// 如果是允许 制卡 则返回体检记录对象
				if("40".equals(record.getStatus())||"45".equals(record.getStatus())||"50".equals(record.getStatus())) {
					model.addAttribute("examRecord", record);
				}
			}
		}

		return "modules/wshbj/examinationRecord_print_card";
	}

	@ResponseBody
	@RequestMapping(value = "ajax_print_card")
	public RequestResult ajax_print_card(ExaminationRecord examinationRecord ) {
		return examinationRecordService.updatePrintCard(examinationRecord);
	}


}