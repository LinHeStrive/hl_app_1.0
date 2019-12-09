<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
        
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/user_manage.php">
              <span class="menu-title">用户管理</span>
              <i class="mdi mdi-account menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">系统消息管理</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi-tooltip-text menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${APP_PATH }/jump/massage.php">消息发送</a></li>
                <!--  
                <li class="nav-item"> <a class="nav-link" href="${APP_PATH }/jump/massage_del.php">消息删除</a></li>
                -->
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/pwd_change.php">
              <span class="menu-title">修改密码</span>
              <i class="mdi mdi-wrench menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/logout.php">
              <span class="menu-title">退出登录</span>
              <i class="mdi mdi-arrow-right menu-icon"></i>
            </a>
          </li>
          
        </ul>
      </nav>
</body>
</html>