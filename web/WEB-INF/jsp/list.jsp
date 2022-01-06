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
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <%--表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${list.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender == "M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.daptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil
"></span>编辑</button>
                                <button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <%--分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6">
                当前${list.pageNum}页,总${list.pages}页,总${list.total}条记录数
            </div>
            <%--分页条信息--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${PATH}/staff/emps?pn=1">首页</a></li>
                        <c:if test="${list.hasPreviousPage}">
                            <li>
                                <a href="${PATH}/staff/emps?pn=${list.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${list.navigatepageNums}" var="pages">
                            <c:if test="${pages == list.pageNum}">
                                <%--高亮显示--%>
                                <li class="active"><a href="#">${pages}</a></li>
                            </c:if>
                            <c:if test="${pages != list.pageNum}">
                                <li><a href="${PATH}/staff/emps?pn=${pages}">${pages}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${list.hasNextPage}">
                            <li>
                                <a href="${PATH}/staff/emps?pn=${list.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="${PATH}/staff/emps?pn=${list.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>


    </div>

</body>
</html>
