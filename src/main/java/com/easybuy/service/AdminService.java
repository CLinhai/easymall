package com.easybuy.service;

import com.easybuy.entity.*;

import java.util.List;
import java.util.Map;

public interface AdminService {
    List getUserList();

    EasybuyUser getUser(int euUserId);

    int addOrUpdateUser(EasybuyUser user);

    int deleteUser(int euUserId);

    Map getCategoryList();

    List getgetParentList();

    EasybuyProductCategory getCategory(int epcId);

    int addOrUpdateCategory(EasybuyProductCategory easybuyProductCategory);

    int deleteCategory(int epcId);

    PageBean productList(int currentPage);

    Map getChildList();

    Map getProductAdmin(int epId);

    int addOrUpdateProduct(EasybuyProduct easybuyProduct);

    int deleteProduct(int epId);

    PageBean getNewsList(int currentPage);

    EasybuyNews getNews(int enId);

    int deleteNews(int enId);

    int addOrUpdateNews(EasybuyNews easybuyNews);

    PageBean<EasybuyOrder> getOrderList(int currentPage);

    EasybuyOrder getOrderByForm( int eoId,  String eoUserName);

    int deleteOrder(int eoId);

    EasybuyOrder getOrder(int eoId);

    int updateOrder(EasybuyOrder easybuyOrder);



}
