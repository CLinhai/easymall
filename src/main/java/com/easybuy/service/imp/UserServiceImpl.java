package com.easybuy.service.imp;

import com.easybuy.entity.*;
import com.easybuy.mapper.*;
import com.easybuy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private EasybuyProductCategoryMapper easybuyProductCategoryMapper;
    @Autowired
    private EasybuyProductMapper easybuyProductMapper;
    @Autowired
    private EasybuyCommentMapper easybuyCommentMapper;
    @Autowired
    private EasybuyNewsMapper easybuyNewsMapper;
    @Autowired
    private EasybuyOrderDetailMapper easybuyOrderDetailMapper;
    @Autowired
    private EasybuyUserMapper easybuyUserMapper;
    @Autowired
    private  EasybuyOrderMapper easybuyOrderMapper;

    @Override
    public Map<String, Object> index() {
        Map<String,Object>map=new HashMap<>();
        List<EasybuyProductCategory> childCategoryList= this.easybuyProductCategoryMapper.selectChildList();
        List<EasybuyProductCategory> parentCategoryList=this.easybuyProductCategoryMapper.selectParentList();
        List<EasybuyProduct> productList= this.easybuyProductMapper.selectAll();
        List<EasybuyNews> newsList= this.easybuyNewsMapper.selectAll();
        map.put("childCategoryList",childCategoryList);
        map.put("parentCategoryList",parentCategoryList);
        map.put("productList",productList);
        map.put("newsList",newsList);
        return map;
    }
    //
  /*  @Override
    public EasybuyUser checkLogin(String euUserLoginid) {
        return this.easybuyUserMapper.checkLoginOrRegister(euUserLoginid);
    }*/



    @Override
    public EasybuyUser checkLoginOrRegister(String euUserLoginid) {
        return this.easybuyUserMapper.checkLoginOrRegister(euUserLoginid);
    }

    @Override
    public int register(EasybuyUser user) {
        return this.easybuyUserMapper.insert(user);
    }



    @Override
    public Map productListPage(int currentPage, Integer epcChildId) {

        PageBean<EasybuyProduct> pageBean = new PageBean<EasybuyProduct>();

        // 封装当前页数
        pageBean.setCurrPage(currentPage);

        // 每页显示的数据
        int pageSize = 5;
        pageBean.setPageSize(pageSize);

        // 封装总记录数
        int totalCount = this.easybuyProductMapper.selectCount(epcChildId);
        pageBean.setTotalCount(totalCount);

        // 封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);// 向上取整
        pageBean.setTotalPage(num.intValue());

        List<EasybuyProduct> products = this.easybuyProductMapper.listByPage((currentPage - 1) * pageSize, pageBean.getPageSize(), epcChildId);
        pageBean.setLists(products);

        Map map=new HashMap();
        map.put("pageBean", pageBean);
        EasybuyProductCategory epcChild = this.easybuyProductCategoryMapper.selectByPrimaryKey(epcChildId);
        map.put("epcChild",epcChild);
        EasybuyProductCategory epcParent= this.easybuyProductCategoryMapper.selectByPrimaryKey(epcChild.getEpcParentId());
        map.put("epcParent", epcParent);
        return map;
    }

    @Override
    public Map getProductById(int epId) {
        Map map=new HashMap();
        EasybuyProduct product = this.easybuyProductMapper.selectByPrimaryKey(epId);
        EasybuyProductCategory epcChild = this.easybuyProductCategoryMapper.selectByPrimaryKey(product.getEpcChildId());
        EasybuyProductCategory epcParent = this.easybuyProductCategoryMapper.selectByPrimaryKey(product.getEpcId());
        map.put("product",product);
        map.put("epcChild",epcChild);
        map.put("epcParent",epcParent);
        return map;
    }

    @Override
    public EasybuyNews getNewsById(int enId) {
        return this.easybuyNewsMapper.selectByPrimaryKey(enId);
    }
}
