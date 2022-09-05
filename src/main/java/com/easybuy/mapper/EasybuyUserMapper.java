package com.easybuy.mapper;

import com.easybuy.entity.EasybuyUser;

import java.util.List;

public interface EasybuyUserMapper {
    int deleteByPrimaryKey(Integer euUserId);

    int insert(EasybuyUser easybuyUser);

    EasybuyUser selectByPrimaryKey(Integer euUserId);

    List<EasybuyUser> selectAll();

    int updateByPrimaryKey(EasybuyUser easybuyUser);
    //
//    EasybuyUser checkLogin(@Param("euUserLoginid")String euUserLoginid,@Param("euPassword")String euPassword);

    EasybuyUser checkLoginOrRegister(String euUserLoginid);


}