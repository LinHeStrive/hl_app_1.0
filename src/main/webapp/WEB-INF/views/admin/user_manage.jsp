<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/boot.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />
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
<script type="text/javascript"
	src="${APP_PATH }/model/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${APP_PATH }/model/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${APP_PATH }/model/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="${APP_PATH }/model/vendors/js/vendor.bundle.base.js"></script>
<script src="${APP_PATH }/model/vendors/js/vendor.bundle.addons.js"></script>
<script src="${APP_PATH }/model/js/off-canvas.js"></script>
<script src="${APP_PATH }/model/js/misc.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${APP_PATH }/model/laydate/laydate.js"></script>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="same_top.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="same_side.jsp"></jsp:include>
			<div class="main-panel">
				<div class="content-wrapper">

					<!-- 发送 -->
					<div class="modal fade" id="urlUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-lg" role="document"
							id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #c79af7; height: 525px">
								<div class="modal-header" style="background-color: #c79af7;">
									<h4 class="modal-title" style="color: #ffffff;">系统消息发送</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<div class="modal-body">
									<div class="grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<div class="col-md-6">
													<div class="form-group">
														<label for="title_input">标题</label> <input type="text"
															class="form-control" name="title" id="title_input">
														<span class="help-block"></span>
													</div>
													<div class="form-group ">
														<label for="setitle_input">副标题</label> <input type="text"
															class="form-control" name="setitle" id="setitle_input">
														<span class="help-block"></span>
													</div>
													<script id="editor" type="text/plain"
														style="width: 900px; height: 400px; margin: 0 auto;"></script>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="url_update_btn"
										style="background-color: #c79af7; border-color: #c79af7;">发送</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 批量发送 -->
					<div class="modal fade" id="userMassages" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-lg" role="document"
							id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #c79af7; height: 525px">
								<div class="modal-header" style="background-color: #c79af7;">
									<h4 class="modal-title" style="color: #ffffff;">系统消息发送</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<div class="modal-body">
									<div class="grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<div class="col-md-6">
													<div class="form-group">
														<label for="title_all_input">标题</label> <input type="text"
															class="form-control" name="title" id="title_all_input">
														<span class="help-block"></span>
													</div>
													<div class="form-group ">
														<label for="setitle_all_input">副标题</label> <input
															type="text" class="form-control" name="setitle"
															id="setitle_all_input"> <span class="help-block"></span>
													</div>
													<script id="editor_all" type="text/plain"
														style="width: 900px; height: 400px; margin: 0 auto;"></script>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="massage_save"
										style="background-color: #c79af7; border-color: #c79af7;">发送</button>
								</div>
							</div>
						</div>
					</div>



					<div style="margin-left: 715px; margin-bottom: 20px;">
						<button id="lock_all_user_btn"
							class="btn btn-gradient-primary btn-sm" style="width: 55px;">锁定</button>
						<button id="to_all_user_btn"
							class="btn btn-outline-dark btn-sm" style="width: 55px;">发送</button>
					</div>
					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<table class="table table-bordered" id="user_table">
										<thead>
											<tr>
												<th><input type="checkbox" id="check_all" /></th>
												<th><b>用户头像</b></th>
												<th><b>用户名</b></th>
												<th><b>密码</b></th>
												<th><b>距离上次登录时间</b></th>
												<th><b>状态</b>
												<th><b>操作</b></th>
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
				<div class="row" style="background-color: #f2edf3">
					<div class="col-md-5 " id="page_nav_area" style="margin: 0 auto;"></div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		var totalRecord;
		var currentPage;

		$(function() {
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH }/users",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					build_users_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}

		function build_users_table(result) {
			//清空table表格
			$("#user_table tbody").empty();
			var user = result.extend.pageInfo.list;
			$.each(user,function(index, item) {
				var checkBoxTd = $("<td></td>").append($("<input type='checkbox' class='check_item'/>").attr("id", item.id));
				//checkBoxTd.attr("id", item.id);
				var picTd = $("<td></td>").append($("<img></img>").attr("src","${APP_PATH }/model/images/faces/"+ item.pic));
				var usernameTd = $("<td></td>").append(item.username);
				var passwordTd = $("<td></td>").addClass("pwd").append($("<input>").attr("type","password").attr("style","border-top:0;border-left:0;border-right:0;border-bottom:0;width:100px;").val(item.password));
				passwordTd.append($("<span></span>").addClass("mdi mdi-lock-outline"));
				var myDate = new Date();
				var year_now = myDate.getFullYear();    //获取完整的年份(4位,1970-????)
				var month_now = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
				var date_now = myDate.getDate();        //获取当前日(1-31)
				var timeTd = $("<td></td>");
				var day = 0;
				if((date_now-item.day)>=0){
					day += date_now-item.day;
				}else{
					if((month_now==1)||(month_now==3)||(month_now==5)||(month_now==7)||(month_now==8)||(month_now==10)||(month_now==12)){
						day += date_now + 31 - item.day;
					}
					if((month_now==4)||(month_now==6)||(month_now==9)||(month_now==11)){
						day += date_now + 30 -item.day;
					}
					if((month_now==2) && (year_now%4==0)){
						day += date_now + 29 - item.day;
					}
					if(month_now==2 && year_now%4!=0){
						day += date_now + 28 - item.day;
					}
					month_now = month_now - 1;
				}
				var month = 0;
				if((month_now-item.month)>=0){
					month += month_now - item.month;
				}else{
					month += month_now + 12 - item.month;
					year_now = year_now -1;
				}
				var year = year_now - item.year;
				if(year>0){
					timeTd.append(year+"年");
				}
				if(month>0){
					timeTd.append(month+"个月");
				}
				if((year==0)&&(month==0)&&day>0){
					timeTd.append(day+"天");
				}
				if((year>0)||(month>0)&&day>0){
					timeTd.append("零"+day+"天");
				}
				if((year==0)&&(month==0)&&(day==0)){
					timeTd.append("0天");
				}
				var stateTd = $("<td></td>");
				if (item.state == 1) {
					stateTd.append("激活");
				} else {
					stateTd.append("锁定");
				}
				var lockBtn = $("<button></button>").addClass("btn btn-gradient-primary btn-sm").append("锁定").attr("id","lock_user_btn").attr("year",year).attr("month",month).attr("day",day);
				lockBtn.attr("lock-id", item.id).attr("lock-name", item.username);
				var sendBtn = $("<button></button>").addClass("btn btn-outline-dark btn-sm").append("发送").attr("id", "to_user_btn");
				sendBtn.attr("touser-id", item.id);
				var btnTd = $("<td></td>").append(lockBtn).append(" ").append(sendBtn);
				$("<tr></tr>").append(checkBoxTd).append(picTd).append(usernameTd).append(passwordTd).append(timeTd).append(stateTd).append(btnTd).appendTo("#user_table tbody");
				/*密码显示隐藏*/
				$(".pwd").on("click",".mdi-lock-outline",function() {
						$(this).removeClass("mdi mdi-lock-outline").addClass("mdi mdi-lock-open");
						$(this).prev().attr("type","text");
				});
				$(".pwd").on("click",".mdi-lock-open",function() {
					$(this).removeClass("mdi mdi-lock-open").addClass("mdi mdi-lock-outline");
					$(this).prev().attr("type","password");
					});
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

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active").attr("style", "color:#553597");
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
		$(document).on("click", "#lock_user_btn", function() {
			var userName = $(this).attr("lock-name");
			var year = $(this).attr("year");
			var month = $(this).attr("month");
			if (confirm("确认锁定【" + userName + "】吗？")) {
				if((year>0)||(month>2)){
					$.ajax({
						url : "${APP_PATH}/user_lock/" + $(this).attr("lock-id"),
						type : "POST",
						data : "state=" + 0,
						success : function(result) {
							alert("锁定成功！");
							window.location.reload();

						}
					});
				}else{
					alert(userName+"未登录天数少于3个月，不能对其进行锁定！");
				}
				
			}

		});
		//全选/全不选
		$("#check_all").click(function() {
			//attr获取自定义属性:attr获取checked是undefined
			//prop获取我们这些dom原生的属性
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
		//批量锁定
		$("#lock_all_user_btn")
				.click(
						function() {

							var userNames = "";
							var lock_idstr = "";
							//$(".check_item:checked")
							$.each($(".check_item:checked"), function() {
								userNames += $(this).parents("tr").find(
										"td:eq(2)").text()
										+ ",";
								lock_idstr += this.id + "-";
							});
							//去除empNames多余的逗号
							userNames = userNames.substring(0,
									userNames.length - 1);
							lock_idstr = lock_idstr.substring(0,
									lock_idstr.length - 1);
							if (confirm("确认锁定【" + userNames + "】吗？")) {
								//发送ajax请求
								$
										.ajax({
											url : "${APP_PATH}/user_lock/"
													+ lock_idstr,
											type : "POST",
											data : "state=" + 0,
											success : function(result) {
												alert(result.msg);
												window.location.reload();
											}
										});
							}
						})

		$(document).on("click", "#to_user_btn", function() {
			//getUrl($(this).attr("edit-id"));
			//3、把员工的id传递给模态框的更新按钮
			$("#url_update_btn").attr("touser-id", $(this).attr("touser-id"));
			$("#urlUpdateModal").modal({
				backdrop : "static"
			});
		});
		var ue = UE.getEditor('editor');
		$("#url_update_btn").click(function() {
			var title = document.getElementById("title_input").value;
			var setitle = document.getElementById("setitle_input").value;
			var content = ue.getContent();
			console.log("content:" + content);
			$.ajax({
				type : "POST",
				url : "${APP_PATH }/note/" + $(this).attr("touser-id"),
				data : {
					"title" : title,
					"Content" : content,
					"setitle" : setitle
				},
				success : function(result) {
					alert(ue.getContent());
					alert(result.msg);
					$("#urlUpdateModal").modal('hide');
				},
				error : function(result) {
					alert(result.msg);
					$("#urlUpdateModal").modal('hide');
				}
			});
		});
		//批量发送
		$("#to_all_user_btn").click(function() {
			$("#userMassages").modal({
				backdrop : "static"
			});
		})
		var editor_all = UE.getEditor('editor_all');
		$("#massage_save").click(
			function() {
				var title = document.getElementById("title_all_input").value;
				var setitle = document.getElementById("setitle_all_input").value;
				var content = editor_all.getContent();
				console.log("content:" + content);
				var userNames = "";
				var lock_idstr = "";
				//$(".check_item:checked")
				$.each($(".check_item:checked"), function() {
						userNames += $(this).parents("tr").find("td:eq(2)").text()+ ",";
						lock_idstr += this.id + "-";
					});
				//去除empNames多余的逗号
				userNames = userNames.substring(0,userNames.length - 1);
				lock_idstr = lock_idstr.substring(0,lock_idstr.length - 1);
				if (confirm("确认发送至【" + userNames + "】吗？")) {
						//发送ajax请求
						$.ajax({
								url : "${APP_PATH}/to_user_notes/"+ lock_idstr,
								type : "POST",
								data : {
									"title" : title,
									"Content" : content,
									"setitle" : setitle
								},
								success : function(result) {
									alert(editor_all.getContent());
									alert(result.msg);
									$("#userMassages").modal('hide');
								},
								error : function(result) {
									alert(result.msg);
									$("#userMassages").modal('hide');
								}
							});
						}
					})
	</script>


</body>
</html>