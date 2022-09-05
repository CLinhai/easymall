package com.easybuy.mapper;

import com.easybuy.entity.EasybuyProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EasybuyProductMapper {
    int deleteByPrimaryKey(Integer epId);

    int insert(EasybuyProduct record);

    EasybuyProduct selectByPrimaryKey(Integer epId);

    List<EasybuyProduct> selectAll();

    int updateByPrimaryKey(EasybuyProduct record);

    List<EasybuyProduct> listByPage(@Param("start") Integer start, @Param("size") Integer size, @Param("epcChildId") Integer epcChildId);

    int selectCount(@Param("epcChildId") Integer epcChildId);

    int selectAllCount();

    int updateStock(@Param("epId") Integer epId,@Param("num")Integer num);

}