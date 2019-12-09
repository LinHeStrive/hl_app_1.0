<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>密码生成</title>





<link rel="stylesheet" href="${APP_PATH }/password/css/dragdealer.css">
<link rel="stylesheet" href="${APP_PATH }/password/css/style.css">

<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />


<script src="${APP_PATH }/password/js/dragdealer.js"></script>
<script src="${APP_PATH }/password/js/script.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../same/same_top.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../same/same_side.jsp"></jsp:include>


			<div class="main-panel">
				<div class="content-wrapper">
					<div class="content">

						<div align="center" style="padding-top: 60px; padding-bottom:110px">
							<table cellpadding=0 cellspacing=0 border=0 align=center
								class="h100">
								<tr>
									<td valign="middle" align="center" heihgt="100%">
										<div class=main align=center>
											<input type=text id=pw class=input1>
											<div id="my-slider" class="dragdealer"
												title="Password length">
												<div class="red-bar handle" id="drag-helper">drag me</div>
											</div>
											<div id="boxes">
												<label id="l1" title="Use small letters"><input
													onChange="refreshpw();" type="checkbox" id=arg1 name=arg1
													checked>小写字母</label> <label id="l2" title="Use big letters"><input
													onChange="refreshpw();" type="checkbox" id=arg2 name=arg2>大写字母</label>
												<label id="l3" title="Use numbers"><input
													onChange="refreshpw();" type="checkbox" id=arg3 name=arg3
													checked>数字</label> <label id="l4" title="Use punctuation"><input
													onChange="refreshpw();" type="checkbox" id=arg4 name=arg4>符号</label>
											</div>
											<button id=re class="input2"
												onClick="refreshpw();return false;" title="Generate!">生成随机密码</button>
									</td>
								</tr>
							</table>

						</div>
					</div>
					<jsp:include page="../same/same_footer.jsp"></jsp:include>

				</div>
				
			</div>

		</div>
	</div>
	<script type="text/javascript">
		var pw_len;
		function refreshpw() {
			genpw('pw', pw_len, 'arg1', 'arg2', 'arg3', 'arg4');
		}
		new Dragdealer('my-slider', {
			x : 0.09,
			steps : 57,
			snap : true,
			animationCallback : function(x, y) {
				pw_len = parseInt(3 + x * 57);
				document.getElementById('drag-helper').innerHTML = pw_len
						+ ' 位';
				refreshpw('pw');
			}
		});
		labels = [ 'l1', 'l2', 'l3', 'l4' ];
		labels.forEach(function(el_id) {
			el = document.getElementById(el_id);
			el.onselectstart = function() {
				return false;
			} // ie
			el.onmousedown = function() {
				return false;
			} // mozilla
		});
	</script>
</body>
</html>