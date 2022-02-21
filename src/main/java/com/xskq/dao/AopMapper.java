package com.xskq.dao;

import com.xskq.model.Aop;

public interface AopMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Aop record);

    int insertSelective(Aop record);

    Aop selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Aop record);

    int updateByPrimaryKey(Aop record);
}