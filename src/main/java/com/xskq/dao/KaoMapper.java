package com.xskq.dao;

import com.xskq.model.Kao;
import com.xskq.model.KaoExt;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface KaoMapper {
    int deleteByPrimaryKey(Integer kaoid);

    int insert(Kao record);

    int insertSelective(Kao record);

    Kao selectByPrimaryKey(Integer kaoid);

    int updateByPrimaryKeySelective(Kao record);

    int updateByPrimaryKey(Kao record);

    List<KaoExt> getKao(KaoExt kao);

    int selectCount(KaoExt kao);

    List<Kao> getKaoByUser(Kao kao);

    int selCountByNumber(Kao kao);

    List<Map<String, Object>> getNumberByName(@Param("name") String name);

    List<Map<String, Object>> getNumberByBanji();
}