package com.easybuy.mapper;

import com.easybuy.entity.EasybuyProductCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EasybuyProductCategoryMapper {
    int deleteByPrimaryKey(Integer epcId);

    int insert(EasybuyProductCategory record);

    EasybuyProductCategory selectByPrimaryKey(Integer epcId);

    List<EasybuyProductCategory> selectAll();

    int updateByPrimaryKey(EasybuyProductCategory record);

    List<EasybuyProductCategory> selectChildList();

    List<EasybuyProductCategory> selectParentList();

    int selectChildCount(@Param("epcParentId") Integer epcParentId);




}