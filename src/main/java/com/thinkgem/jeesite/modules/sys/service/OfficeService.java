/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 机构Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class OfficeService extends TreeService<OfficeDao, Office> {

	@Override
	@Cacheable(value = "officeCache",key="'office_get_'+#id")
	public Office get(String id) {
		return super.get(id);
	}

	public List<Office> findAll(){
		return UserUtils.getOfficeList();
	}

	public List<Office> findList(Boolean isAll){
		if (isAll != null && isAll){
			return UserUtils.getOfficeAllList();
		}else{
			return UserUtils.getOfficeList();
		}
	}
	
	@Transactional(readOnly = true)
	public List<Office> findList(Office office){
		if(office != null){
			office.setParentIds(office.getParentIds()+"%");
			return dao.findByParentIdsLike(office);
		}
		return  new ArrayList<Office>();
	}
	
	@Transactional(readOnly = false)
	@CacheEvict(value="officeCache",allEntries=true)
	public void save(Office office) {
		office.setDefaultRecord("0");
		super.save(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	
	@Transactional(readOnly = false)
	@CacheEvict(value="officeCache",allEntries=true)
	public void delete(Office office) {
		super.delete(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}

	/**
	 * 我的公司节点的数量
	 * @return
	 */
	public Integer countMyCompany(){
		Office office=new Office();
		office.setType("1");  // 1 代表公司
		office.setDefaultRecord("0");

		return dao.countByType(office);
	}


	@Cacheable(value = "officeCache",key="'office_getMyCompany'")
	public Office getMyCompany(){
		Office office=new Office();
		office.setType("1");  // 1 代表公司
        office.setDefaultRecord("0");   // 代表是自定义的。

		List<Office> lst = dao.findList(office);
		if(lst!=null&&lst.size()>0){
			return lst.get(0);
		}
		return null;
	}

}
