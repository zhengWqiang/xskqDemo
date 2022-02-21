package com.xskq.dao;

import com.xskq.model.Cls;

public interface ClsMapper {
    int deleteByPrimaryKey(Integer classid);

    int insert(Cls record);

    int insertSelective(Cls record);

    Cls selectByPrimaryKey(Integer classid);

    int updateByPrimaryKeySelective(Cls record);

    int updateByPrimaryKey(Cls record);
}