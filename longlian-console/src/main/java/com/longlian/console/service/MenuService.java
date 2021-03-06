package com.longlian.console.service;

import java.util.List;

import com.longlian.model.MRes;

public interface MenuService {
    /**
     * 取得所有的菜单 
     * @return
     */
    public List<MRes> getList() ;
    /**
     * 根据id取得相关菜单
     * @param ids
     * @return
     */
    public List<MRes> getListByIds(String ids);

    /**
     * 删除redis里的菜单
     */
    public void delAll();
    
}
