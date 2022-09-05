package com.easybuy.service.imp;

import com.easybuy.entity.*;
import com.easybuy.mapper.*;
import com.easybuy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
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
    public List getUserList() {
        return this.easybuyUserMapper.selectAll();
    }

    @Override
    public EasybuyUser getUser(int euUserId) {
        return this.easybuyUserMapper.selectByPrimaryKey(euUserId);
    }
    @Override
    public int addOrUpdateUser(EasybuyUser user) {
        int i = 0;
        if (user.getEuUserId()!= null && user.getEuUserId()!= 0) {
            i = this.easybuyUserMapper.updateByPrimaryKey(user);
        } else {
            i = this.easybuyUserMapper.insert(user);
        }
        return i;
    }

    @Override
    public int deleteUser(int euUserId) {
        return this.easybuyUserMapper.deleteByPrimaryKey(euUserId);
    }

    @Override
    public Map getCategoryList() {
        Map map=new HashMap();
        List<EasybuyProductCategory> categories = this.easybuyProductCategoryMapper.selectAll();
        map.put("categories", categories);
        for (EasybuyProductCategory category : categories) {
            int childCount = this.easybuyProductCategoryMapper.selectChildCount(category.getEpcId());
            int productCount = this.easybuyProductMapper.selectCount(category.getEpcId());
            Map map1=new HashMap();
            map1.put("childCount",childCount);
            map1.put("productCount",productCount);
            map.put(category.getEpcId(), map1);
        }
        return map;
    }

    @Override
    public List getgetParentList() {
        return this.easybuyProductCategoryMapper.selectParentList();
    }

    @Override
    public EasybuyProductCategory getCategory(int epcId) {
        return this.easybuyProductCategoryMapper.selectByPrimaryKey(epcId);
    }

    @Override
    public int addOrUpdateCategory(EasybuyProductCategory easybuyProductCategory) {
        Integer epcId=easybuyProductCategory.getEpcId();
        int i=0;
        if (epcId==null) {
            i = this.easybuyProductCategoryMapper.insert(easybuyProductCategory);
        }else {
           i= this.easybuyProductCategoryMapper.updateByPrimaryKey(easybuyProductCategory);
        }
        return i;
    }

    @Override
    public int deleteCategory(int epcId) {
        return this.easybuyProductCategoryMapper.deleteByPrimaryKey(epcId);
    }

    @Override
    public PageBean productList(int currentPage) {
        PageBean<EasybuyProduct> pageBean = new PageBean<EasybuyProduct>();
        // 封装当前页数
        pageBean.setCurrPage(currentPage);
        // 每页显示的数据
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = this.easybuyProductMapper.selectAllCount();
        pageBean.setTotalCount(totalCount);
        // 封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);// 向上取整
        pageBean.setTotalPage(num.intValue());

        List<EasybuyProduct> products = this.easybuyProductMapper.listByPage((currentPage - 1) * pageSize, pageBean.getPageSize(), null);
        pageBean.setLists(products);

        return pageBean;
    }

    @Override
    public Map getChildList() {
        Map map=new HashMap();
        List<EasybuyProductCategory> childCategoryList= this.easybuyProductCategoryMapper.selectChildList();
        List<EasybuyProductCategory> parentCategoryList=this.easybuyProductCategoryMapper.selectParentList();
        map.put("childCategoryList",childCategoryList);
        map.put("parentCategoryList",parentCategoryList);
        return map;
    }

    @Override
    public Map getProductAdmin(int epId) {
        Map map=new HashMap();
        List<EasybuyProductCategory> childCategoryList= this.easybuyProductCategoryMapper.selectChildList();
        List<EasybuyProductCategory> parentCategoryList=this.easybuyProductCategoryMapper.selectParentList();
        map.put("childCategoryList",childCategoryList);
        map.put("parentCategoryList",parentCategoryList);
        EasybuyProduct product = this.easybuyProductMapper.selectByPrimaryKey(epId);
        map.put("product", product);
        return map;
    }

    @Override
    public int addOrUpdateProduct(EasybuyProduct easybuyProduct) {
        EasybuyProductCategory childCategory = this.easybuyProductCategoryMapper.selectByPrimaryKey(easybuyProduct.getEpcChildId());
        easybuyProduct.setEpcId(childCategory.getEpcParentId());
        int i = 0;
        if (easybuyProduct.getEpId() != null ) {
            i = this.easybuyProductMapper.updateByPrimaryKey(easybuyProduct);
        } else {
            i = this.easybuyProductMapper.insert(easybuyProduct);
        }
        return i;
    }

    @Override
    public int deleteProduct(int epId) {
        return this.easybuyProductMapper.deleteByPrimaryKey(epId);
    }

    @Override
    public PageBean getNewsList(int currentPage) {
        PageBean<EasybuyNews> pageBean = new PageBean<EasybuyNews>();
        // 封装当前页数
        pageBean.setCurrPage(currentPage);
        // 每页显示的数据
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = this.easybuyNewsMapper.selectAllCount();
        pageBean.setTotalCount(totalCount);
        // 封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);// 向上取整
        pageBean.setTotalPage(num.intValue());

        List<EasybuyNews> products = this.easybuyNewsMapper.listByPage((currentPage - 1) * pageSize, pageBean.getPageSize());
        pageBean.setLists(products);

        return pageBean;
    }

    @Override
    public EasybuyNews getNews(int enId) {

        return this.easybuyNewsMapper.selectByPrimaryKey(enId);
    }

    @Override
    public int addOrUpdateNews(EasybuyNews easybuyNews) {
        Integer enId=easybuyNews.getEnId();
        int i=0;
        if (enId==null) {
            i = this.easybuyNewsMapper.insert(easybuyNews);
        }else {
            i= this.easybuyNewsMapper.updateByPrimaryKey(easybuyNews);
        }
        return i;
    }

    @Override
    public int deleteNews(int enId) {
        return this.easybuyNewsMapper.deleteByPrimaryKey(enId);
    }

    @Override
    public PageBean<EasybuyOrder> getOrderList(int currentPage) {
        PageBean<EasybuyOrder> pageBean = new PageBean<EasybuyOrder>();
        // 封装当前页数
        pageBean.setCurrPage(currentPage);
        // 每页显示的数据
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = this.easybuyOrderMapper.selectAllCount();
        pageBean.setTotalCount(totalCount);
        // 封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);// 向上取整
        pageBean.setTotalPage(num.intValue());

        List<EasybuyOrder> orders = this.easybuyOrderMapper.listByPage((currentPage - 1) * pageSize, pageBean.getPageSize());
        pageBean.setLists(orders);

        return pageBean;
    }

    @Override
    public EasybuyOrder getOrderByForm(int eoId, String eoUserName) {
        return this.easybuyOrderMapper.getOrderByForm(eoId, eoUserName);
    }

    @Override
    public EasybuyOrder getOrder(int eoId) {
        return this.easybuyOrderMapper.selectByPrimaryKey(eoId);
    }

    @Override
    public int updateOrder(EasybuyOrder easybuyOrder) {

        return this.easybuyOrderMapper.updateByPrimaryKey(easybuyOrder);
    }

    @Override
    public int deleteOrder(int eoId) {
        int i = this.easybuyOrderDetailMapper.deleteByForeign(eoId);
        int i1=0;
        if (i>0){
          i1 = this.easybuyOrderMapper.deleteByPrimaryKey(eoId);
        }
        return i1;
    }
}
