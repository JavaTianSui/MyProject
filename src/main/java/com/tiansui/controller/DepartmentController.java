package com.tiansui.controller;

import com.tiansui.pojo.Department;
import com.tiansui.pojo.Msg;
import com.tiansui.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/dept")
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;
    @RequestMapping("deptinfo")
    @ResponseBody
    public Msg getDept(){
        List<Department> depart = departmentService.queryDepart();

        return Msg.success().add("depart",depart);
    }

}
