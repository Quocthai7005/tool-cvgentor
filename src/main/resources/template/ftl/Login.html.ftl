<#ftl encoding="utf-8">.
<!DOCTYPE html>
<html>
<head>
	<title>CV Generator</title>
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/cvgentor.css" />
	<link rel="stylesheet" type="text/css" media="print" href="resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" media="print" href="resources/css/cvgentor-print.css" />
	<script src="resources/js/jquery-3.5.1.min.js"></script> 
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/html2pdf.bundle.min.js"></script> 
	<script src="resources/js/titles.js"></script> 
	<meta charset="UTF-8"> 
</head>
<body>
	<#include "navbar.html.ftl">
	<div class="container printArea">
		<div class="row mt-60 printArea">
			<div class="col-sm-4 mt-xxl-1 mb-xxl-1">
			</div>
			<div class="col-sm-4 mt-xxl-1 mb-xxl-1">
				<div class="card shadow">
					<div class="card-header bg-green text-light text-center">
						Login
					</div>
					<div class="card-body" id="themes" style="max-height: 500px; overflow-y: auto; scrollbar-width: thin;">
						<form>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Username</label>
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="text-center">
								<button type="submit" class="btn bg-green text-light">Login</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html> 