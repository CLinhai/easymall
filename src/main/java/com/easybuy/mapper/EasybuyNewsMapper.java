package com.easybuy.mapper;

import com.easybuy.entity.EasybuyNews;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EasybuyNewsMapper {
    int deleteByPrimaryKey(Integer enId);

    int insert(EasybuyNews record);

    EasybuyNews selectByPrimaryKey(Integer enId);

    List<EasybuyNews> selectAll();

    int updateByPrimaryKey(EasybuyNews record);

    int selectAllCount();

    List<EasybuyNews> listByPage(@Param("start") Integer start, @Param("size") Integer size);

}