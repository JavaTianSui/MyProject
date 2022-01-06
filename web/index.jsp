<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2022/1/3
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${PATH}/static/js/jquery-3.4.1.js"></script>
    <link href="${PATH}/static/dist/css/bootstrap-theme.css" rel="stylesheet">
    <link href="${PATH}/static/dist/css/bootstrap.css" rel="stylesheet">
    <script src="${PATH}/static/dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>

                </tbody>

<%--                <c:forEach items="${list.list}" var="emp">--%>
<%--                    <tr>--%>
<%--                        <th>${emp.empId}</th>--%>
<%--                        <th>${emp.empName}</th>--%>
<%--                        <th>${emp.gender == "M"?"男":"女"}</th>--%>
<%--                        <th>${emp.email}</th>--%>
<%--                        <th>${emp.department.daptName}</th>--%>
<%--                        <th>--%>
<%--                            <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil--%>
<%--"></span>编辑</button>--%>
<%--                            <button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button>--%>
<%--                        </th>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>

            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">
<%--            当前页,总页,总条记录数--%>
        </div>
        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">
<%--            <nav aria-label="Page navigation">--%>
<%--                <ul class="pagination">--%>
<%--                    <li><a href="${PATH}/staff/emps?pn=1">首页</a></li>--%>
<%--                    <c:if test="${list.hasPreviousPage}">--%>
<%--                        <li>--%>
<%--                            <a href="${PATH}/staff/emps?pn=${list.pageNum-1}" aria-label="Previous">--%>
<%--                                <span aria-hidden="true">&laquo;</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>
<%--                    <c:forEach items="${list.navigatepageNums}" var="pages">--%>
<%--                        <c:if test="${pages == list.pageNum}">--%>
<%--                            &lt;%&ndash;高亮显示&ndash;%&gt;--%>
<%--                            <li class="active"><a href="#">${pages}</a></li>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${pages != list.pageNum}">--%>
<%--                            <li><a href="${PATH}/staff/emps?pn=${pages}">${pages}</a></li>--%>
<%--                        </c:if>--%>
<%--                    </c:forEach>--%>

<%--                    <c:if test="${list.hasNextPage}">--%>
<%--                        <li>--%>
<%--                            <a href="${PATH}/staff/emps?pn=${list.pageNum+1}" aria-label="Next">--%>
<%--                                <span aria-hidden="true">&raquo;</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>

<%--                    <li><a href="${PATH}/staff/emps?pn=${list.pages}">末页</a></li>--%>
<%--                </ul>--%>
<%--            </nav>--%>
        </div>
    </div>
        <script type="text/javascript">
            var totalRecord;
            var currentPage;
            $(function (){
                to_page(1);
                $("#emp_add_modal_btn").click(function(){
                    //清除表单数据（表单完整重置（表单的数据，表单的样式））
                    reset_form("#empAddModal form");
                    getDepart("#empAddModal select");
                    $("#empAddModal").modal({
                        backdrop:"static"
                    })
                });
            });
            function reset_form(ele){
                $(ele)[0].reset();
                //清空表单样式
                $(ele).find("*").removeClass("has-error has-success");
                $(ele).find(".help-block").text("");
            }
            function getDepart(ele){
                $(ele).empty();
                $.ajax({
                    url: "${PATH}/dept/deptinfo",
                    type: "get",
                    success:function(result){
                        var info = result.extend.depart;
                        $.each(info,function(index,item){
                            var optionEle = $("<option></option>").append(this.daptName).attr("value",this.deptId);
                            optionEle.appendTo(ele);
                        });
                    }
                })
            }

            function to_page(pn){
                $.ajax({
                    url:"${PATH}/staff/emps1",
                    data:"pn="+pn,
                    type:"Get",
                    success:function (result){
                        //1、解析并显示员工数据
                        build_emps_table(result);
                        //2.解析并显示分页信息
                        build_page_info(result);
                        //3.解析显示分页条信息
                        build_page_nav(result);
                    }
                });
            }

            function build_emps_table(result){
                //清空table表格
                $("#emps_table tbody").empty();
                var emps = result.extend.pageInfo.list;
                $.each(emps,function(index,item){
                    var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                    var empIdTd = $("<td></td>").append(item.empId);
                    var empNameTd = $("<td></td>").append(item.empName);
                    var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
                    var emailTd = $("<td></td>").append(item.email);
                    var deptNameTd = $("<td></td>").append(item.department.daptName);
                    /**
                     <button class="">
                     <span class="" aria-hidden="true"></span>
                     编辑
                     </button>
                     */
                    var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                    //为编辑按钮添加一个自定义的属性，来表示当前员工id
                    editBtn.attr("edit-id",item.empId);
                    var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                    //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                    delBtn.attr("del-id",item.empId);
                    var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                    //var delBtn =
                    //append方法执行完成以后还是返回原来的元素
                    $("<tr></tr>").append(checkBoxTd)
                        .append(empIdTd)
                        .append(empNameTd)
                        .append(genderTd)
                        .append(emailTd)
                        .append(deptNameTd)
                        .append(btnTd)
                        .appendTo("#emps_table tbody");
                });
            }

            function build_page_info(result){
                $("#page_info_area").empty();
                $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页," +
                    "总"+result.extend.pageInfo.pages+"页," +
                    "总"+result.extend.pageInfo.total+"条记录数")
                totalRecord = result.extend.pageInfo.pages+1;
                currentPage = result.extend.pageInfo.pageNum;
            }

            function build_page_nav(result){
                //page_nav_area
                $("#page_nav_area").empty();
                var ul = $("<ul></ul>").addClass("pagination");

                //构建元素
                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
                if(result.extend.pageInfo.hasPreviousPage == false){
                    firstPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                }else{
                    //为元素添加点击翻页的事件
                    firstPageLi.click(function(){
                        to_page(1);
                    });
                    prePageLi.click(function(){
                        to_page(result.extend.pageInfo.pageNum -1);
                    });
                }

                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
                var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
                if(result.extend.pageInfo.hasNextPage == false){
                    nextPageLi.addClass("disabled");
                    lastPageLi.addClass("disabled");
                }else{
                    nextPageLi.click(function(){
                        to_page(result.extend.pageInfo.pageNum +1);
                    });
                    lastPageLi.click(function(){
                        to_page(result.extend.pageInfo.pages);
                    });
                }

                //添加首页和前一页 的提示
                ul.append(firstPageLi).append(prePageLi);
                //1,2，3遍历给ul中添加页码提示
                $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

                    var numLi = $("<li></li>").append($("<a></a>").append(item));
                    if(result.extend.pageInfo.pageNum == item){
                        numLi.addClass("active");
                    }
                    numLi.click(function(){
                        to_page(item);
                    });
                    ul.append(numLi);
                });
                //添加下一页和末页 的提示
                ul.append(nextPageLi).append(lastPageLi);

                //把ul加入到nav
                var navEle = $("<nav></nav>").append(ul);
                navEle.appendTo("#page_nav_area");
            }

            //表单数据进行校验
            function validate_add_form(){
                //获取用户名的值
                var empName = $("#empName_add_input").val();
                var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
                if (!regName.test(empName)){
                   // alert("用户名可以是6-16位英文和数字的组合或者2-5位中文");
                    //$("#empName_add_input").parent().addClass("has-error");
                   // $("#empName_add_input").next("span").text("用户名可以是6-16位英文和数字的组合或者2-5位中文");
                    show_validate_msg("error","#empName_add_input","用户名可以是6-16位英文和数字的组合或者2-5位中文")
                    return false;
                }else {
                    // $("#empName_add_input").parent().addClass("has-success");
                    // $("#empName_add_input").next("span").text("");
                    show_validate_msg("success","#empName_add_input","")
                }
                //获取邮箱的值
                var email = $("#email_add_input").val();
                var regEmail =  /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if (!regEmail.test(email)){
                   // alert("邮箱格式不正确");
                   //  $("#email_add_input").parent().addClass("has-error");
                   //  $("#email_add_input").next("span").text("邮箱格式不正确");
                    show_validate_msg("error","#email_add_input","邮箱格式不正确")
                    return false;
                }else {
                    // $("#email_add_input").parent().addClass("has-success");
                    // $("#email_add_input").next("span").text("");
                    show_validate_msg("success","#email_add_input","")

                }
                return true;
            }

            /**
             * 封装校验的方法
             * @param status,ele,msg
             */
            function show_validate_msg(status,ele,msg){
                //首先清除样式
                $(ele).parent().removeClass("has-success has-error");
                $(ele).next("span").text("");
                if ("success" == status){
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg);
                }else if ("error" == status){
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }
            }

            //点击保存，新增员工数据
            $("#emp_save_btn").click(function (){
                //1.先对数据进行校验
                if(!validate_add_form()){
                    return false;
                };

                $.ajax({
                    url:"${PATH}/staff/emps1",
                    type:"POST",
                    data:$("#empAddModal form").serialize(),
                    success:function(result){
                        //alert(result.msg);
                        //1、关闭模态框
                        $("#empAddModal").modal('hide');
                        //2.来到最后一页
                        to_page(totalRecord);
                    }
                });
            });

            $("#empName_add_input").change(function(){
                var empName = $("#empName_add_input").val();
                alert(empName);
                $.ajax({
                    url:"${PATH}/staff/checkuser",
                    data:"empName="+empName,
                    type:"GET",
                    success:function (result){
                        if (result.code == 100){
                            alert(result.code);
                           // show_validate_msg("success","#empName_add_input","用户名可用");
                            show_validate_msg("success","#empName_add_input","用户名可用")
                        }else {
                            show_validate_msg("error","#empName_add_input","用户名不可用");
                        }
                    }
                });
            });
            //单个删除
            $(document).on("click",".delete_btn",function(){
                //1、弹出是否确认删除对话框
                var empName = $(this).parents("tr").find("td:eq(2)").text();
                var empId = $(this).attr("del-id");
                alert(empName+empId);
                //alert($(this).parents("tr").find("td:eq(1)").text());
                if(confirm("确认删除【"+empName+"】吗？")){
                    //确认，发送ajax请求删除即可
                    $.ajax({
                        url:"${PATH}/staff/emp/"+empId,
                        type:"DELETE",
                        success:function(result){
                            alert(result.msg);
                            //回到本页
                            to_page(currentPage);
                        }
                    });
                }
            });

            $("#check_all").click(function (){
                $(".check_item").prop("checked",$(this).prop("checked"));
            });

            //check_item
            $(document).on("click",".check_item",function(){
                //判断当前选择中的元素是否5个
                var flag = $(".check_item:checked").length==$(".check_item").length;
                $("#check_all").prop("checked",flag);
            });

            //批量删除
            $("#emp_delete_all_btn").click(function (){
                //1.首先需要获取选中的id
                var empNames = "";
                var del_idstr = "";
                $.each($(".check_item:checked"),function(){
                    //this
                    empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                    //组装员工id字符串
                    del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
                });
                //去除empNames多余的,
                empNames = empNames.substring(0, empNames.length-1);
                //去除删除的id多余的-
                del_idstr = del_idstr.substring(0, del_idstr.length-1);
                //2.发送ajax请求
                if (confirm("确认删除【"+empNames+"】吗?")){
                    $.ajax({
                        url:"${PATH}/staff/emp/"+del_idstr,
                        type:"DELETE",
                        success:function(result){
                            alert(result.msg);
                            //回到当前页面
                            to_page(currentPage);
                        }
                    })
                }
            })


        </script>


</div>

</body>
</html>
