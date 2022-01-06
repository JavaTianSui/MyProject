package com.tiansui.service;

import com.tiansui.pojo.Department;

import java.util.List;

public interface DepartmentService {
    //插入部门数据
    int insertDepartment(Department department);
    //查询部门信息
    List<Department> queryDepart();
}
