package com.xskq.dao;

import com.xskq.model.Admin;

import java.util.List;

public interface AdminMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin selectAdmin(Admin admin);

    List<Admin> getAdmin();
}