<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>注册</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/boot.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />


<script src="${APP_PATH }/model/vendors/js/vendor.bundle.base.js"></script>
<script src="${APP_PATH }/model/vendors/js/vendor.bundle.addons.js"></script>
<script src="${APP_PATH }/model/js/off-canvas.js"></script>
<script src="${APP_PATH }/model/js/misc.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${APP_PATH }/model/laydate/laydate.js"></script>
<script charset="utf-8" type="text/javascript">
	laydate.render({
		elem : '#birthday_add_input'//指定元素
	});
</script>
</head>

<body>
	<nav
		class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<div style="margin: 0 auto;"
			class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
			<a class="navbar-brand brand-logo" href="#"> <img
				src="${APP_PATH }/model/images/logo.png" alt="logo" />
			</a> <a class="navbar-brand brand-logo-mini" href="index.html"><img
				src="images/logo-mini.svg" alt="logo" /></a>

		</div>
	</nav>
	<div id="userAdd" class="content-wrapper  align-items-center auth"
		style="margin-top: 100px;">
		<div class="row">
			<div class="col-6 grid-margin stretch-card mx-auto">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">注册</h4>
						<p class="card-description"></p>
						<form class="forms-sample">
							<div class="form-group">
								<label for="username_add_input">用户名：</label> <input type="text"
									name="username" class="form-control" id="username_add_input"
									placeholder="Name"><span class="help-block"></span>
							</div>

							<div class="form-group">
								<label for="email_add_input">邮箱：</label> <input type="text"
									name="email" class="form-control" id="email_add_input"
									placeholder="Name"><span class="help-block"></span>
							</div>

							<div class="form-group">
								<label for="password_add_input">密码：</label> <input
									type="password" name="password" class="form-control"
									id="password_add_input" placeholder="Password"><span
									class="help-block"></span>
							</div>
							<div class="col-md-6">
								<div class="form-group row">
									<label class="col-form-label">性别：</label>
									<div class="col-sm-4">
										<div class="form-check">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="sex" id="sex1_update_input"
												value="1" checked="checked"> 男
											</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-check">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="sex" id="sex2_update_input"
												value="0"> 女
											</label>
										</div>
									</div>
								</div>
							</div>


							<div class="form-group form-inline">
								<label class=" control-label ">常用地址：</label>&nbsp;&nbsp;&nbsp;

								<div data-toggle="distpicker">
									<select id="province" name="province" class="form-control"
										data-province="选择省"></select>
								</div>
							</div>
							<div class="form-group">
								<label for="sign_update_input">密码提示<span style="color:red;">（用于找回密码，十分重要！！！）</span></label>
								<textarea name="sign" class="form-control"
									id="sign_update_input" rows="4"></textarea>
							</div>
						</form>
						<button id="user_save_btn" type="button"
							class="btn btn-gradient-primary mr-2">注册</button>
						<a class="btn btn-light" href="${APP_PATH }/jump/login.php">取消</a>


					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#distpicker").distpicker({});

		});
		function validate_add_form() {
			var username = $("#username_add_input").val();
			var reguser = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!reguser.test(username)) {
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				//清空之前的样式
				show_validate_msg("#username_add_input", "error",
						"用户名可以是2-5位中文或者6-16位英文和数字的组合");
				return false;
			} else {
				show_validate_msg("#username_add_input", "success", "");
			}
			;
			//1、拿到要校验的数据，使用正则表达式
			var password = $("#password_add_input").val();
			var regpwd = /(^[a-zA-Z0-9_-]{8,20}$)/;
			if (!regpwd.test(password)) {
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				//清空之前的样式
				show_validate_msg("#password_add_input", "error",
						"密码是8-16位英文大小写、数字、符号的组合");
				return false;
			} else {
				show_validate_msg("#password_add_input", "success", "");
			}
			;
			//2、校验邮箱信息
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				//alert("邮箱格式不正确");
				show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");
			}
			return true;
		}

		//显示校验结果的提示信息
		function show_validate_msg(ele, status, msg) {
			//清除当前元素校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		$("#username_add_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var username = this.value;
					$.ajax({
						url : "${APP_PATH}/user/checkuser",
						data : "username=" + username,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#username_add_input",
										"success", "用户名可用");
								$("#user_save_btn").attr("ajax_va", "success");
							} else {
								show_validate_msg("#username_add_input",
										"error", result.extend.va_msg);
								$("#user_save_btn").attr("ajax_va", "error");
							}
						}
					});

				});
		$("#email_add_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var email = this.value;
					$.ajax({
						url : "${APP_PATH}/user/checkemail",
						data : "email=" + email,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#email_add_input",
										"success", "邮箱可用");
								$("#user_save_btn").attr("ajax_va", "success");
							} else {
								show_validate_msg("#email_add_input", "error",
										result.extend.va_msg);
								$("#user_save_btn").attr("ajax_va", "error");
							}
						}
					});

				});
		$("#password_add_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var password = this.value;
					$.ajax({
						url : "${APP_PATH}/user/checkpwd",
						data : "password=" + password,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#password_add_input",
										"success", "密码可用");
								$("#user_save_btn").attr("ajax_va", "success");
							} else {
								show_validate_msg("#password_add_input",
										"error", result.extend.va_msg);
								$("#user_save_btn").attr("ajax_va", "error");
							}
						}
					});

				});

		$("#user_save_btn")
				.click(
						function() {
							if (!validate_add_form()) {
								return false;
							}
							;
							if ($(this).attr("ajax_va") == "error") {
								return false;
							}
							$
									.ajax({
										url : "${APP_PATH}/user/doRegist",
										type : "POST",
										data : $("#userAdd form").serialize(),
										success : function(result) {
											if (result.code == 100) {
												alert(result.msg);
												window.location.href = "${APP_PATH }/jump/logout.php";
											} else {
												//显示失败信息
												//console.log();
												//有哪个字段的错误信息就显示哪个
												if (undefined != result.extend.errorFields.password) {
													//显示邮箱错误信息
													show_validate_msg(
															"#password_add_input",
															"error",
															result.extend.errorFields.password);
												}
												if (undefined != result.extend.errorFields.email) {
													//显示员工名字的错误信息
													show_validate_msg(
															"#email_add_input",
															"error",
															result.extend.errorFields.email);
												}

											}

										}

									});
						});
	</script>
	<script type="text/javascript" charset="UTF-8"
		src="${APP_PATH }/model/dist/distpicker.js"></script>
</body>

</html>
