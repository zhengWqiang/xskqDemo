package com.xskq.mybatis;

import com.xskq.model.Qing;

public interface QingMapper {
    int deleteByPrimaryKey(Integer qingid);

    int insert(Qing record);

    int insertSelective(Qing record);

    Qing selectByPrimaryKey(Integer qingid);

    int updateByPrimaryKeySelective(Qing record);

    int updateByPrimaryKey(Qing record);
}