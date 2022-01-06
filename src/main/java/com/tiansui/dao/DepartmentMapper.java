package com.tiansui.dao;

import com.tiansui.pojo.Department;

import java.util.List;

public interface DepartmentMapper {
    //插入部门数据
    int insertDepartment(Department department);
    //查询部门信息
    List<Department> queryDepart();
}
