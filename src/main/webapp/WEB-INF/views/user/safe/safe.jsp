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
<title>安全挑战</title>
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
	color: #b66dff;
}

h4 {
	font-color: #b66dff;
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

					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<table class="table table-bordered" id="url_table">
										<thead>
											<tr>
												<th><b>网站名</b></th>
												<th><b>用户名</b></th>
												<th><b>密码</b></th>
												<th><b>分数</b></th>
												<th><b>修改密码</b></th>
											</tr>
										</thead>
										<tbody>
										
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>




				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				<jsp:include page="../same/same_footer.jsp"></jsp:include>
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
					url : "${APP_PATH }/urls",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						build_urls_table(result);
					}
				});
			}

			function build_urls_table(result) {
				//清空table表格
				$("#url_table tbody").empty();
				var urls = result.extend.pageInfo.list;
				$.each(urls,function(index, item) {
					var urlNameTd = $("<td></td>").append(item.urlName);
					var urlUserTd = $("<td></td>").append(item.urlUser);
					var urlPasswordTd = $("<td></td>").addClass("pwd").append($("<input>").attr("type","password").attr("style","border-top:0;border-left:0;border-right:0;border-bottom:0;width:100px;").val(item.urlPassword));
					urlPasswordTd.append($("<span></span>").addClass("mdi mdi-lock-outline"));
					var urlSafeTd = $("<td></td>");
					if(item.urlSafe==0){
						urlSafeTd.append($("<div></div>").addClass("progress").append($("<div></div>").addClass("progress-bar bg-success")
								.attr("role","progressbar").attr("style","width: 0%")
                                .attr("aria-valuenow","0").attr("aria-valuemin","0")
                                .attr("aria-valuemax","100")));
                        
					}else if(item.urlSafe==0.2){
						urlSafeTd.append($("<div></div>").addClass("progress").append($("<div></div>").addClass("progress-bar bg-danger")
								.attr("role","progressbar").attr("style","width: 20%")
                                .attr("aria-valuenow","20").attr("aria-valuemin","0")
                                .attr("aria-valuemax","100")));
					}else if(item.urlSafe==0.4){
						urlSafeTd.append($("<div></div>").addClass("progress").append($("<div></div>").addClass("progress-bar bg-warning")
								.attr("role","progressbar").attr("style","width: 40%")
                                .attr("aria-valuenow","40").attr("aria-valuemin","0")
                                .attr("aria-valuemax","100")));
					}else if(item.urlSafe==0.8){
						urlSafeTd.append($("<div></div>").addClass("progress").append($("<div></div>").addClass("progress-bar bg-info")
								.attr("role","progressbar").attr("style","width: 80%")
                                .attr("aria-valuenow","80").attr("aria-valuemin","0")
                                .attr("aria-valuemax","100")));
					}else if(item.urlSafe==1){
						urlSafeTd.append($("<div></div>").addClass("progress").append($("<div></div>").addClass("progress-bar bg-success")
								.attr("role","progressbar").attr("style","width: 100%")
                                .attr("aria-valuenow","100").attr("aria-valuemin","0")
                                .attr("aria-valuemax","100")));
					}else{
						urlSafeTd.append($("<div></div>").addClass("progress").append($("<div></div>").addClass("progress-bar bg-primary")
								.attr("role","progressbar").attr("style","width: 60%")
                                .attr("aria-valuenow","60").attr("aria-valuemin","0")
                                .attr("aria-valuemax","100")));
					}
					var editBtn = $("<td></td>").append($("<a></a>").attr("href",item.url)
							.addClass("btn btn-rounded btn-inverse-primary btn-sm")
							.append($("<i></i>").addClass(" mdi mdi-edge")));
					$("<tr></tr>").append(urlNameTd)
                                  .append(urlUserTd)
                                  .append(urlPasswordTd)
                                  .append(urlSafeTd)
                                  .append(editBtn).appendTo("#url_table tbody");
				/*密码显示隐藏*/
				$(".pwd").on("click", ".mdi-lock-outline", function() {
					$(this).removeClass("mdi mdi-lock-outline").addClass("mdi mdi-lock-open");
					$(this).prev().attr("type", "text");
				});
				$(".pwd").on("click", ".mdi-lock-open", function() {
					$(this).removeClass("mdi mdi-lock-open").addClass("mdi mdi-lock-outline");
					$(this).prev().attr("type", "password");
				});
				});
			}
		</script>
</body>
</html>