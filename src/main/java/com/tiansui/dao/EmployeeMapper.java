package com.tiansui.dao;

import com.tiansui.pojo.Department;
import com.tiansui.pojo.Employee;

import java.util.List;

public interface EmployeeMapper {
    //插入员工数据---有选择的
    int insertSelective(Employee employee);
    //插入员工数据
    int insert(Employee employee);
    //查询所有员工数据
    List<Employee> queryAll();
    //查询部门信息
    List<Department> queryOne();
    //查询员工姓名
    int queryByName(String empName);
    //单个删除员工
    int deleteEmp(int empId);
    //批量删除
    int deleteBatch(List<Integer> list);
}
