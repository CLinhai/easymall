package com.easybuy.mapper;

import com.easybuy.entity.EasybuyOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EasybuyOrderMapper {
    int deleteByPrimaryKey(Integer eoId);

    int insert(EasybuyOrder record);

    EasybuyOrder selectByPrimaryKey(Integer eoId);

    List<EasybuyOrder> selectAll();

    int updateByPrimaryKey(EasybuyOrder record);

    int selectAllCount();

    List<EasybuyOrder> listByPage(@Param("start") Integer start, @Param("size") Integer size);

    EasybuyOrder getOrderByForm(@Param("eoId") int eoId, @Param("eoUserName") String eoUserName);
}