package com.easybuy.service;

import com.easybuy.entity.EasybuyNews;
import com.easybuy.entity.EasybuyUser;

import java.util.Map;

public interface UserService {
   Map<String,Object> index();
//   EasybuyUser checkLogin(String euUserLoginid);
   EasybuyUser checkLoginOrRegister(String euUserLoginid);

   int register(EasybuyUser user);

   Map productListPage(int currentPage,Integer epcChildId);

   Map getProductById(int epId);

   EasybuyNews getNewsById(int enId);

}
