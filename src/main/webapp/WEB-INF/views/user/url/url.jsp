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
<title>站点管理</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />

<link rel="stylesheet" href="${APP_PATH }/model/css/boot.css">
<style type="text/css">
.r {
	position: fixed;
	right: 40px;
	bottom: 40px;
}

.mdi_in {
	color: #ffffff;
}

h4 {
	font-color: #b66dff;
}

#HelpUpdateModal {
	margin-top: 20px;
	height: 525px;
	overflow-y: hidden;
}

.modal-body {
	overflow: auto;
	max-height: 525px;
}

#HelpAddModal {
	margin-top: 15px;
	height: 525px;
	overflow-y: hidden;
}
</style>


<script src="${APP_PATH }/model/vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="${APP_PATH }/model/js/off-canvas.js"></script>
<script src="${APP_PATH }/model/js/misc.js"></script>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../same/same_top.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../same/same_side.jsp"></jsp:include>


			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 修改 -->
					<div class="modal fade" id="urlUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #95d3f2; height: 525px">
								<div class="modal-header" style="background-color: #95d3f2;">
									<h4 class="modal-title" style="color: #ffffff;">站点修改</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<div class="modal-body">
									<div class="grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<form class="forms-sample">
													<div class="form-group">
														<label for="urlName_update_input">网站名</label> <input
															type="text" class="form-control" name="urlName"
															id="urlName_update_input" placeholder="Username">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="url_update_input">网址</label> <input
															type="text" class="form-control" name="url"
															id="url_update_input" placeholder="http://xxx.xxx.xxx">
														<span class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="urlUser_update_input">用户名</label> <input
															type="text" name="urlUser" class="form-control"
															id="urlUser_update_input" placeholder="用户名"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="urlPassword_update_input">密码</label> <input
															type="password" class="form-control" name="urlPassword"
															id="urlPassword_update_input" placeholder="密码"> <span
															class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="urlMassage_update_input">信息</label> <input
															type="text" name="urlMassage" class="form-control"
															id="urlMassage_update_input" placeholder="信息"> <span
															class="help-block"></span>
													</div>

												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="url_update_btn"
										style="background-color: #95d3f2; border-color: #95d3f2;">更新</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 添加 -->
					<div class="modal fade" id="urlAddModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" id="HelpAddModal" role="document">
							<div class="modal-content"
								style="border-color: #95d3f2; height: 525px">
								<div class="modal-header" style="background-color: #95d3f2;">
									<h3 class="modal-title" style="color: #ffffff;">站点添加</h3>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<form class="forms-sample">
													<div class="form-group">
														<label for="urlName_add_input">网站名</label> <input
															type="text" class="form-control" name="urlName"
															id="urlName_add_input" placeholder="Username"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="url_add_input">网址</label> <input type="text"
															class="form-control" name="url" id="url_add_input"
															placeholder="http://xxx.xxx.xxx"> <span
															class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="urlUser_add_input">用户名</label> <input
															type="text" name="urlUser" class="form-control"
															id="urlUser_add_input" placeholder="用户名"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="urlPassword_add_input">密码</label> <input
															type="password" class="form-control" name="urlPassword"
															id="urlPassword_add_input" placeholder="密码"> <span
															class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="urlMassage_add_input">信息</label> <input
															type="text" name="urlMassage" class="form-control"
															id="urlMassage_add_input" placeholder="信息"> <span
															class="help-block"></span>
													</div>

												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="url_save_btn" style="background-color: #95d3f2;border-color: #95d3f2;">保存</button>
								</div>
							</div>
						</div>
					</div>

					<div class="content">
						<div class="animated fadeIn">
							<div class="row" id="card"></div>
						</div>
					</div>

				</div>

				<div class="row" style="background-color: #f2edf3">
					<div class="col-md-5 " id="page_nav_area" style="margin: 0 auto;"></div>
				</div>



				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				<jsp:include page="../same/same_footer.jsp"></jsp:include>
				<div class="r ">
					<button id="url_add_btn"
						class="btn btn-social-icon btn-google btn-rounded"
						style="background: #95d3f2; font-size: 24px">+</button>
				</div>
			</div>

		</div>
	</div>
	</div>
	<div>


		<script type="text/javascript">
			var totalRecord;
			var currentPage;

			$(function() {
				to_page(1);
			});

			function to_page(pn) {
				$.ajax({
					url : "${APP_PATH }/url1",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						build_urls_table(result);
						build_page_info(result);
						build_page_nav(result)
					}
				});
			}
			function build_urls_table(result) {
				$("#card").empty();
				var urls = result.extend.pageInfo.list;
				$.each(urls, function(index, item) {

					var img_1 = $("<img></img>").addClass("card-img-top").attr(
							"src", "${APP_PATH }/model/images/url/url2.png")
							.attr("alt", "Card image cap");
					var urlNameH5 = $("<h5></h5>").addClass(
							"text-sm-center mt-2 mb-1").append(item.urlName);

					var a_1 = $("<i></i>").addClass(
							"mdi_in mdi mdi-lead-pencil");
					a_1.attr("edit-id", item.urlId);
					var a_2 = $("<i></i>").addClass(
							"mdi_in mdi mdi-close-circle-outline");
					a_2.attr("del-id", item.urlId).attr("del-name",
							item.urlName);
					var a_3 = $("<a></a>").attr("href","${APP_PATH }/urlLogin?id=" + item.urlId)
							.append($("<i></i>").addClass("mdi_in mdi mdi-edge"));
					var div_2 = $("<div></div>").attr("style",
							"background-color:#95d3f2;").addClass(
							"card-text text-sm-center").append(a_1).append(a_2)
							.append(a_3);

					var div_card = $("<div></div>").addClass("card").append(
							img_1).append(urlNameH5).append(div_2);

					$("<div></div>").addClass("col-md-4").attr("style",
							"margin-top:40px").append(div_card).appendTo(
							"#card");
				});
			}

			function build_page_info(result) {
				$("#page_info_area").empty();
				$("#page_info_area").append(
						"当前" + result.extend.pageInfo.pageNum + "页，总"
								+ result.extend.pageInfo.pages + "页，总共"
								+ result.extend.pageInfo.total + "条记录");
				totalRecord = result.extend.pageInfo.total;
				currentPage = result.extend.pageInfo.pageNum;
			}
			//解析显示分页条，点击分页条能去下一页...
			function build_page_nav(result) {
				//page_nav_area
				$("#page_nav_area").empty();
				var ul = $("<ul></ul>").addClass("pagination");
				//构建元素
				var firstPageLi = $("<li></li>").append(
						$("<a></a>").append("首页").attr("href", "#"));
				var prePageLi = $("<li></li>").append(
						$("<a></a>").append("&laquo;"));
				if (result.extend.pageInfo.hasPreviousPage == false) {
					firstPageLi.addClass("disabled");
					prePageLi.addClass("disabled");
				} else {
					//为元素添加点击翻页的事件
					firstPageLi.click(function() {
						to_page(1);
					});
					prePageLi.click(function() {
						to_page(result.extend.pageInfo.pageNum - 1);
					});
				}

				var nextPageLi = $("<li></li>").append(
						$("<a></a>").append("&raquo;"));
				var lastPageLi = $("<li></li>").append(
						$("<a></a>").append("尾页").attr("href", "#"));
				if (result.extend.pageInfo.hasNextPage == false) {
					nextPageLi.addClass("disabled");
					lastPageLi.addClass("disabled");
				} else {
					nextPageLi.click(function() {
						to_page(result.extend.pageInfo.pageNum + 1);

					});
					lastPageLi.click(function() {
						to_page(result.extend.pageInfo.pages);
					});
				}
				//添加首页和前一页 的提示
				ul.append(firstPageLi).append(prePageLi);
				//1,2，3遍历给ul中添加页码提示
				$.each(result.extend.pageInfo.navigatepageNums, function(index,
						item) {

					var numLi = $("<li></li>")
							.append($("<a></a>").append(item));
					if (result.extend.pageInfo.pageNum == item) {
						numLi.addClass("active");
					}
					numLi.click(function() {
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

			$(document).on("click", ".mdi-close-circle-outline", function() {
				var urlId = $(this).attr("del-id");
				var urlName = $(this).attr("del-name");
				//alert($(this).parents("tr").find("td:eq(1)").text());
				if (confirm("确认删除【" + urlName + "】吗？")) {
					//确认，发送ajax请求删除即可
					$.ajax({
						url : "${APP_PATH}/url/" + urlId,
						type : "DELETE",
						success : function(result) {
							alert(result.msg);
							to_page(currentPage);
						}
					});
				}

			});

			$(document).on("click", ".mdi-lead-pencil", function() {
				getUrl($(this).attr("edit-id"));
				//3、把员工的id传递给模态框的更新按钮
				$("#url_update_btn").attr("edit-id", $(this).attr("edit-id"));
				$("#urlUpdateModal").modal({
					backdrop : "static"
				});
			});

			function getUrl(id) {
				$
						.ajax({
							url : "${APP_PATH}/url/" + id,
							type : "GET",
							success : function(result) {
								var urlData = result.extend.url;
								$("#urlName_update_input").val(urlData.urlName);
								$("#url_update_input").val(urlData.url);
								$("#urlUser_update_input").val(urlData.urlUser);
								$("#urlPassword_update_input").val(
										urlData.urlPassword);
								$("#urlMassage_update_input").val(
										urlData.urlMassage);

							}
						});
			}
			$("#url_update_btn").click(function() {
				$.ajax({
					url : "${APP_PATH}/url/" + $(this).attr("edit-id"),
					type : "PUT",
					data : $("#urlUpdateModal form").serialize(),
					success : function(result) {
						$("#urlUpdateModal").modal('hide');
						alert(result.msg);
						//2、回到页面
						to_page(currentPage);

					}
				});
			});

			function reset_form(ele) {
				$(ele)[0].reset();
				//清空表单样式
				$(ele).find("*").removeClass("has-error has-success");
				$(ele).find(".help-block").text("");
			}
			$("#url_add_btn").click(function() {
				//清除表单数据(表单完整重置(数据、样式))
				reset_form("#urlAddModal form");

				//发送ajax请求，查出部门信息，显示在下拉列表中
				//getDepts("#empAddModal select");

				//弹出模态框
				$("#urlAddModal").modal({
					backdrop : "static"
				});
			});
			$("#url_save_btn").click(function() {

				$.ajax({
					url : "${APP_PATH}/url",
					type : "POST",
					data : $("#urlAddModal form").serialize(),
					success : function(result) {
						alert(result.msg);
						if (result.code == 100) {
							$("#urlAddModal").modal('hide');
							to_page(totalRecord);
						}

					}
				});
			});
		</script>
</body>
</html>