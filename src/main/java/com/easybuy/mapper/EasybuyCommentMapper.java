package com.easybuy.mapper;

import com.easybuy.entity.EasybuyComment;

import java.util.List;

public interface EasybuyCommentMapper {
    int deleteByPrimaryKey(Integer ecId);

    int insert(EasybuyComment record);

    EasybuyComment selectByPrimaryKey(Integer ecId);

    List<EasybuyComment> selectAll();

    int updateByPrimaryKey(EasybuyComment record);
}