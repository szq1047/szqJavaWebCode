<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>注册页面</title>

<link href="css/normalize.css" rel="stylesheet" />
<link href="css/jquery-ui.css" rel="stylesheet" />
<link href="css/jquery.idealforms.min.css" rel="stylesheet"
	media="screen" />

<style type="text/css">
body {
	font: normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;
	color: #222;
	background: url(pattern.png);
	overflow-y: scroll;
	padding: 60px 0 0 0;
}

#my-form {
	width: 755px;
	margin: 0 auto;
	border: 1px solid #ccc;
	padding: 3em;
	border-radius: 3px;
	box-shadow: 0 0 2px rgba(0, 0, 0, .2);
}

#comments {
	width: 350px;
	height: 100px;
}

.STYLE1 {
	color: #FFCC99;
	font-weight: bold;
	font-size: x-large;
}
</style>

</head>
<body>
	<div id="Layer1"
		style="position: absolute; width: 100%; height: 684px; z-index: -1; top: 3px;">
		<img src="images/ground.jpg" height="118%" width="100%" />
	</div>
	<h1 align="center" class="STYLE1">注册界面</h1>
	<div class="row">

		<div class="eightcol last">

			<!-- Begin Form -->

			<form id="my-form" method="post" action="RegisterServlet">

				<section name="第一步">

					<div>
						<label>用户名:</label><input id="username" name="regname" type="text" />
					</div>
					<div>
						<label>真实姓名:</label><input id="realname" name="realname"
							type="text" />
					</div>
					<div>
						<label>密码:</label><input id="pwd" name="pwd" type="password" />
					</div>

					<div>
						<label>性别:</label><label><input type="radio" name="sex"
							value="M" />男 </label> <label> <input type="radio" name="sex"
							value="F" />女
						</label>
					</div>
					<div>
						<label>出生日期:</label><input name="date" class="datepicker"
							data-ideal="date" type="text" placeholder="月/日/年" />
					</div>
				</section>

				<section name="第二步">
					<div>
						<label>学院:</label> <select id="colloge" name="colloge">
							<option value="default">&ndash; 选择学院 &ndash;</option>
							<option value="计算机学院">计算机学院</option>
							<option value="自动化学院">自动化学院</option>
							<option value="机电学院">机电学院</option>
							<option value="数学学院">数学学院</option>
							<option value="艺术设计学院">艺术设计学院</option>

						</select>
					</div>
					<div>
						<label>专业:</label><input id="major" name="major" type="text" />
					</div>
					<div>
						<label>班级:</label><input id="class" name="class" type="text" />
					</div>
					<div>
						<label>学号:</label><input id="stuno" name="stuno" type="text" />
					</div>
				</section>

				<section name="第三步">
					<div>
						<label>电话:</label><input type="tel" name="phone"
							data-ideal="phone" />
					</div>
					<div>
						<label>邮箱:</label><input id="email" name="email"
							data-ideal="required email" type="email" />
					</div>
					<div>
						<label>QQ:</label><input type="text" name="QQ" />
					</div>
					<div>
						<label>备注:</label>
						<textarea id="comments" name="comments"></textarea>
					</div>
				</section>
				<div>
					<hr />
				</div>
				<div>
					<button type="submit">提交</button>
					<button id="reset" type="button">重置</button>
				</div>
			</form>

			<!-- End Form -->

		</div>

	</div>


	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/jquery.idealforms.js"></script>
	<script type="text/javascript">
		var options = {
			onFail : function() {
				alert($myform.getInvalid().length + ' 个无效字段.');
			},

			inputs : {
				'pwd' : {
					filters : 'required pwd',
				},
				'regname' : {
					filters : 'required regname',
					data : {
					//ajax: { url:'validate.php' }
					}
				},
				'realname' : {
					filters : 'required realname',
					data : {
					//ajax: { url:'validate.php' }
					}
				},
				'class' : {
					filters : 'required class',
					data : {
					//ajax: { url:'validate.php' }
					}
				},
				'major' : {
					filters : 'required major',
					data : {
					//ajax: { url:'validate.php' }
					}
				},
				'stuno' : {
					filters : 'required stuno',
					data : {
					//ajax: { url:'validate.php' }
					}
				},
				'phone' : {
					filters : 'required phone',
					data : {
					//ajax: { url:'validate.php' }
					}
				},
				'file' : {
					filters : 'extension',
					data : {
						extension : [ 'jpg' ]
					}
				},
				'comments' : {
					filters : 'min max',
					data : {
						min : 0,
						max : 200
					}
				},
				'colloge' : {
					filters : 'exclude',
					data : {
						exclude : [ 'default' ]
					},
					errors : {
						exclude : '选择学院.'
					}
				},
				'langs[]' : {
					filters : 'min max',
					data : {
						min : 2,
						max : 3
					},
					errors : {
						min : 'Check at least <strong>2</strong> options.',
						max : 'No more than <strong>3</strong> options allowed.'
					}
				}
			}

		};

		var $myform = $('#my-form').idealforms(options).data('idealforms');

		$('#reset').click(function() {
			$myform.reset().fresh().focusFirst()
		});

		$myform.focusFirst();
	</script>
	<div style="text-align: center;"></div>
</body>
</html>