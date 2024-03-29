<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<link href="${APP_PATH }/model/upface/boot.css" rel="stylesheet">
<link href="${APP_PATH }/model/upface/head/cropper.min.css"
	rel="stylesheet">
<link href="${APP_PATH }/model/upface/head/sitelogo.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script src="${APP_PATH }/model/upface/head/cropper.js"></script>
<script src="${APP_PATH }/model/upface/head/sitelogo.js"></script>
<style type="text/css">
.avatar-btns button {
	height: 35px;
	text-align: center;
}

#btn-in,#img1{
	display: block;
	margin: 0 auto;
	width: 150px;
	height: 150px;
	border: 1px dashed #D0D0D0;
	background-color: #fff;
	color: #D0D0D0;
	text-align:center;
	line-height: 100px;
	font-size:14px;
}
</style>
</head>
<body>
	<div id="btn-in" data-toggle="modal" data-target="#avatar-modal">
	    <img id="img1" alt="头像" src="${APP_PATH }/model/images/faces/face1.jpg" >
	</div>
	<div class="user_pic" style="display: block; margin: 0 auto;">
		<img src="" />
	</div>

	<div class="modal fade" id="avatar-modal" aria-hidden="true"
		aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">-->
				<form class="avatar-form">
					<div class="modal-header">
						<h4 class="modal-title" id="avatar-modal-label">上传图片</h4>
						<button class="close" data-dismiss="modal" type="button">&times;</button>
					</div>
					<div class="modal-body">
						<div class="avatar-body">
							<div class="avatar-upload">
								<input class="avatar-src" name="avatar_src" type="hidden">
								<input class="avatar-data" name="avatar_data" type="hidden">
								<label for="avatarInput" style="line-height: 35px;">图片上传</label>
								<button class="btn-boot btn-danger" type="button"
									style="height: 35px;"
									onclick="$('input[id=avatarInput]').click();">请选择图片</button>
								<span id="avatar-name"></span> <input class="avatar-input hide"
									id="avatarInput" name="avatar_file" type="file">
							</div>
							<div class="row">
								<div class="col-md-9">
									<div class="avatar-wrapper"></div>
								</div>
								<div class="col-md-3">
									<div class="avatar-preview preview-lg" id="imageHead"></div>
									<!--<div class="avatar-preview preview-md"></div>
								<div class="avatar-preview preview-sm"></div>-->
								</div>
							</div>
							<div class="row avatar-btns">
								<div class="col-md-4">
									<div class="btn-group-boot">
										<button class="btn-boot btn-danger mdi mdi-refresh"
											data-method="rotate" data-option="-90" type="button"
											title="Rotate -90 degrees">向左旋转</button>
									</div>
									<div class="btn-group-boot">
										<button class="btn-boot  btn-danger mdi mdi-replay"
											data-method="rotate" data-option="90" type="button"
											title="Rotate 90 degrees">向右旋转</button>
									</div>
								</div>
								<div class="col-md-5" style="text-align: right;">
									<button class="btn-boot btn-danger mdi mdi-cursor-move"
										data-method="setDragMode" data-option="move" type="button"
										title="移动">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
										</span>
									</button>
									<button type="button"
										class="btn-boot btn-danger mdi mdi-magnify-plus"
										data-method="zoom" data-option="0.1" title="放大图片">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
											<!--<span class="fa fa-search-plus"></span>-->
										</span>
									</button>
									<button type="button"
										class="btn-boot btn-danger mdi mdi-magnify-minus"
										data-method="zoom" data-option="-0.1" title="缩小图片">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
											<!--<span class="fa fa-search-minus"></span>-->
										</span>
									</button>
									<button type="button" class="btn-boot btn-danger mdi mdi-sync"
										data-method="reset" title="重置图片">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper(&quot;reset&quot;)"
											aria-describedby="tooltip866214">
									</button>
								</div>
								<div class="col-md-3">
									<button
										class="btn-boot btn-danger btn-block avatar-save mdi mdi-content-save"
										type="button" data-dismiss="modal">保存修改</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
	<script src="${APP_PATH }/model/upface/head/html2canvas.min.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		//做个下简易的验证  大小 格式 
		$('#avatarInput').on('change', function(e) {
			var filemaxsize = 1024 * 5;//5M
			var target = $(e.target);
			var Size = target[0].files[0].size / 1024;
			if (Size > filemaxsize) {
				alert('图片过大，请重新选择!');
				$(".avatar-wrapper").childre().remove;
				return false;
			}
			if (!this.files[0].type.match(/image.*/)) {
				alert('请选择正确的图片!')
			} else {
				var filename = document.querySelector("#avatar-name");
				var texts = document.querySelector("#avatarInput").value;
				var teststr = texts; //你这里的路径写错了
				testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的
				filename.innerHTML = testend;
			}

		});

		$(".avatar-save").on("click", function() {
			var img_lg = document.getElementById('imageHead');
			// 截图小的显示框内的内容
			html2canvas(img_lg, {
				allowTaint : true,
				taintTest : false,
				onrendered : function(canvas) {
					canvas.id = "mycanvas";
					//生成base64图片数据
					var dataUrl = canvas.toDataURL("image/jpeg");
					var newImg = document.createElement("img");
					newImg.src = dataUrl;
					imagesAjax(dataUrl)
				}
			});
		})

		function imagesAjax(src) {
			var data = {};
			data.img = src;
			data.jid = $('#jid').val();
			$.ajax({
				url : "upload-logo.php",
				data : data,
				type : "POST",
				dataType : 'json',
				success : function(re) {
					if (re.status == '1') {
						$('.user_pic img').attr('src', src);
					}
				}
			});
		}
	</script>
</body>
</html>