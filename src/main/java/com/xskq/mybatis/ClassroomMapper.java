package com.xskq.mybatis;

import com.xskq.model.Classroom;

public interface ClassroomMapper {
    int deleteByPrimaryKey(Integer classroomid);

    int insert(Classroom record);

    int insertSelective(Classroom record);

    Classroom selectByPrimaryKey(Integer classroomid);

    int updateByPrimaryKeySelective(Classroom record);

    int updateByPrimaryKey(Classroom record);
}