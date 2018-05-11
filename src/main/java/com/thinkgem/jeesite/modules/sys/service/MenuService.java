package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.MenuDao;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.LogUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class MenuService {

    @Autowired
    private MenuDao menuDao;

    @Cacheable(value = "menuCache",key="'menu_get_'+#id")
    public Menu getMenu(String id) {
        return menuDao.get(id);
    }

    @Cacheable(value = "menuCache",key="'menu_findAllMenu_'+#user.id")
    public List<Menu> findAllMenu(User user){

        List<Menu> menuList=new ArrayList();
        List<Menu> menuList2=new ArrayList();

        if (user.isAdmin()){
            menuList = menuDao.findAllList(new Menu());
        }else{
            Menu m = new Menu();
            m.setUserId(user.getId());
            menuList = menuDao.findByUserId(m);
        }

        Menu.sortList(menuList2,menuList,"1",true);

        // 设置顶级菜单的超级链接,如果顶级菜单没有超级链接，则将第一个可显示的子菜单的超级链接作为超级链接
        for(Menu mn:menuList2){
            if(mn.getLevel()==1&&StringUtils.isEmpty(mn.getHref())&&"1".equals(mn.getIsShow())){
                String cid=","+mn.getId()+",";
                for(Menu mn2:menuList2){
                    if("1".equals(mn2.getIsShow())&&mn2.getParentIds().contains(cid)&&StringUtils.isNotEmpty(mn2.getHref())){
                        mn.setHref(mn2.getHref());
                        break;
                    }
                }

            }
        }

        return menuList;
    }

    //@Cacheable(value = "menuCache",key="'menu_listTopMenu_'+#user.id+#uri")
    public List<Menu> listTopMenu(User user,String uri){

        List<Menu> tops=new ArrayList();
        List<Menu> menus= findAllMenu(user);

        String currRootId=null;

        Menu currm=getCurrMenuForUri(user,uri);
        Menu rootm=getRootMenuByChild(currm);
        if(rootm!=null){
            currRootId=rootm.getId();
        }

        for(Menu mn:menus){
            if("1".equals(mn.getParentId())){
                if(mn.getId().equals(currRootId)){
                    mn.setActived(true);
                }
                tops.add(mn);
            }
        }

        return tops;
    }

    //@Cacheable(value = "menuCache",key="'menu_listLeftMenu_'+#user.id+#uri")
    public List<Menu> listLeftMenu(User user,String uri){

        List<Menu> lefts=new ArrayList();
        List<Menu> menus= findAllMenu(user);

        String currRootId=null;
        Menu currm=getCurrMenuForUri(user,uri);
        Menu rootm=getRootMenuByChild(currm);
        if(rootm!=null){
            currRootId=rootm.getId();
        }

        if(currRootId==null){
            return lefts;
        }

        String currRootId2=","+currRootId+",";
        for(Menu mn:menus){
            if((currRootId.equals(mn.getId())||mn.getParentIds().contains(currRootId))&&"1".equals(mn.getIsShow())){
                lefts.add(mn);
            }
        }

        List<Menu> lefts2=new ArrayList();
        Menu.sortList(lefts2,lefts,currRootId,true);

        return lefts2;
    }

    /**
     * 根据URI获得当前操作节点
     * @param user
     * @param uri
     * @return
     */
    private Menu getCurrMenuForUri(User user,String uri){
        List<Menu> menus= findAllMenu(user);

        Menu currMenu=null;
        for(Menu mn:menus){
            if(StringUtils.isNotEmpty(mn.getHref())&&mn.getHref().endsWith(uri)){
                currMenu=mn;
                break;
            }
        }

        // 如果没有找到当前节点
        if(currMenu==null){
            uri=StringUtils.substringBeforeLast(uri,"/");
            for(Menu mn:menus){
                if(StringUtils.isNotEmpty(mn.getHref())&&mn.getHref().endsWith(uri)){
                    currMenu=mn;
                    break;
                }

                if(StringUtils.isNotEmpty(mn.getHref())&&mn.getHref().contains(uri)){
                    currMenu=mn;
                    break;
                }

            }
        }

        return currMenu;
    }

    private Menu getRootMenuByChild(Menu currMenu){
        if(currMenu==null){
            return null;
        }

        if(currMenu.getLevel()==1){
            return currMenu;
        }
        while(true) {
            currMenu = getMenu(currMenu.getParentId());
            if(currMenu==null||currMenu.getLevel()<1){
                return null;
            }

            if(currMenu.getLevel()==1){
                return currMenu;
            }
        }

    }

    @Transactional(readOnly = false)
    @CacheEvict(value = "menuCache",allEntries = true)
    public void saveMenu(Menu menu) {

        // 获取父节点实体
        menu.setParent(this.getMenu(menu.getParent().getId()));

        // 获取修改前的parentIds，用于更新子节点的parentIds
        String oldParentIds = menu.getParentIds();

        // 设置新的父节点串
        menu.setParentIds(menu.getParent().getParentIds()+menu.getParent().getId()+",");

        // 保存或更新实体
        if (StringUtils.isBlank(menu.getId())){
            menu.preInsert();
            menuDao.insert(menu);
        }else{
            menu.preUpdate();
            menuDao.update(menu);
        }

        // 更新子节点 parentIds
        Menu m = new Menu();
        m.setParentIds("%,"+menu.getId()+",%");
        List<Menu> list = menuDao.findByParentIdsLike(m);
        for (Menu e : list){
            e.setParentIds(e.getParentIds().replace(oldParentIds, menu.getParentIds()));
            menuDao.updateParentIds(e);
        }
    }

    @Transactional(readOnly = false)
    @CacheEvict(value = "menuCache",allEntries = true)
    public void updateMenuSort(Menu menu) {
        menuDao.updateSort(menu);

    }

    @Transactional(readOnly = false)
    @CacheEvict(value = "menuCache",allEntries = true)
    public void deleteMenu(Menu menu) {
        menuDao.delete(menu);

    }

}
