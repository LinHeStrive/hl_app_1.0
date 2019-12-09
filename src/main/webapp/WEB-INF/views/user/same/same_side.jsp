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
          <li class="nav-item nav-profile">
            <a href="#" class="nav-link">
              <div class="nav-profile-image">
                <img src="${APP_PATH }/model/images/faces/${user1.pic}" alt="profile">
                <span class="login-status online"></span> <!--change to offline or busy as needed-->              
              </div>
              <div class="nav-profile-text d-flex flex-column">
                <span id="user" class="font-weight-bold mb-2">${user1.username }</span>
              </div>
              <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH}/jump/showItems.php">
              <span class="menu-title">主页</span>
              <i class="mdi mdi-home menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/url.php">
              <span class="menu-title">站点</span>
              <i class="mdi mdi-earth menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">安全笔记</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi-book-open menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${APP_PATH }/jump/db.php">数据库</a></li>
                <li class="nav-item"> <a class="nav-link" href="${APP_PATH }/jump/bank.php">银行</a></li>
                <li class="nav-item"> <a class="nav-link" href="${APP_PATH }/jump/address.php">地址</a></li>
                <li class="nav-item"> <a class="nav-link" href="${APP_PATH }/jump/wifi.php">无线网</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/pwd.php">
              <span class="menu-title">生成随机密码</span>
              <i class="mdi mdi-dots-horizontal menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/safe.php">
              <span class="menu-title">安全挑战</span>
              <i class="mdi mdi-security menu-icon"></i>
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
            <a class="nav-link" href="${APP_PATH }/jump/user.php">
              <span class="menu-title">账户设置</span>
              <i class="mdi mdi-account-settings-variant menu-icon"></i>
            </a>
          </li>
        </ul>
      </nav>
</body>
</html>