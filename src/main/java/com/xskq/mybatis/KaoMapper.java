package com.xskq.mybatis;

import com.xskq.model.Kao;

public interface KaoMapper {
    int deleteByPrimaryKey(Integer kaoid);

    int insert(Kao record);

    int insertSelective(Kao record);

    Kao selectByPrimaryKey(Integer kaoid);

    int updateByPrimaryKeySelective(Kao record);

    int updateByPrimaryKey(Kao record);
}