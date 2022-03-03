package com.xskq.dao;

import com.xskq.model.Aop;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AopMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Aop record);

    int insertSelective(Aop record);

    Aop selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Aop record);

    int updateByPrimaryKey(Aop record);

    List<Aop> getAop(@Param("name") String name, @Param("beginTimeStr") String beginTimeStr,
                     @Param("endTimeStr") String endTimeStr);

    int getAopCount(@Param("name") String name, @Param("beginTimeStr") String beginTimeStr,
                     @Param("endTimeStr") String endTimeStr);
}