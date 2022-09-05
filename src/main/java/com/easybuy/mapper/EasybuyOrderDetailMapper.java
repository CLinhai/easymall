package com.easybuy.mapper;

import com.easybuy.entity.EasybuyOrderDetail;

import java.util.List;

public interface EasybuyOrderDetailMapper {
    int deleteByPrimaryKey(Integer eodId);

    int insert(EasybuyOrderDetail record);

    EasybuyOrderDetail selectByPrimaryKey(Integer eodId);

    List<EasybuyOrderDetail> selectAll();

    int updateByPrimaryKey(EasybuyOrderDetail record);

    int deleteByForeign(int eoId);
}