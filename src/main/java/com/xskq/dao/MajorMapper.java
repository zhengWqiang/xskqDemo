package com.xskq.dao;

import com.xskq.model.Major;

public interface MajorMapper {
    int deleteByPrimaryKey(Integer majorid);

    int insert(Major record);

    int insertSelective(Major record);

    Major selectByPrimaryKey(Integer majorid);

    int updateByPrimaryKeySelective(Major record);

    int updateByPrimaryKey(Major record);
}