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
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-green">
		<div class="container">
			<a class="navbar-brand" href="#">
				<img src="resources/img/cvgentor_image.png" width="25" height="25" class="d-inline-block align-top" alt="">
				Curri-Vitae Gentor
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Style
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<#list model["categoryList"] as category>
								<li><div class="dropdown-item category" value="${category.id}">${category.name}</div></li>
							</#list>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="about">About</a>
					</li>
				</ul>
				<div class="d-flex">
					<button class="btn btn-outline-success text-light print">Print</button>
				</div>
			</div>
		</div>
	</nav>
	<div class="container printArea">
		<div class="row mt-60 printArea">
			<div class="col-sm-2 mt-xxl-1 mb-xxl-1 overflow-auto">
				<div class="card">
					<div class="card-header bg-green text-light">
						CV themes
					</div>
					<div class="card-body text-center" id="themes">
						<p>Please select a "Style" at the top menu to see themes</p>
					</div>
				</div>
			</div>
			<div class="col-sm-7 mt-xxl-1 mb-xxl-1 printArea">
				<div class="card printArea">
					<div class="card-header bg-green text-light">
						CV contents
					</div>
					<div class="card-body printArea" id="cv-contents">
						Please select a theme at the left menu to see cv details
					</div>
				</div>
			</div>
			<div class="col-sm-3 mt-xxl-1 mb-xxl-1">
				<div class="card">
					<div class="card-header bg-green text-light">
						Description
					</div>
					<div class="card-body" id="description">

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade bd-preview-modal-xl" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Preview</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
	 				</button>
	 			</div>
				<div class="modal-body">
					<p>Modal body text goes here.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary close" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary print">Print</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('.category').on('click', function() {
				var value = $(this).attr('value');
				$.ajax({
					url: "themes",
					data: {
						categoryId: value
					},
					success: function( result ) {
						$('#themes').empty();
						if (result.length > 0) {
							for (var i = 0; i < result.length; i++) {
								var element = '<button type="button" value="' + result[i].id + '" class="btn btn-light theme w-100 mb-xxl-2">' + result[i].name + '</button>';
								$('#themes').append(element);
							}
						} else {
							var element = '<p>Please select a "Style" at the top menu to see themes</p>';
							$('#themes').append(element);
						}

						$('.theme').on('click', function() {
							var cvId = $(this).attr('value');
							$.ajax({
								url: "theme",
								data: {
									cvId: cvId
								},
								success: function( html ) {
									$('#cv-contents').html(html);
								}
							});
						});
					}
				});
			});
			
			$('.print').on('click', function() {
				if (typeof printCv !== "undefined") { 
    				printCv();
    				$('.bd-preview-modal-xl').modal('hide');
				} else {
					console.log('Please define print method');
				}
			});
			
			$('#preview').on('click', function() {
				if (typeof previewCv !== "undefined") { 
    				previewCv();
				} else {
					$('.modal-body').html('Please define preview method');
				}
				$('.bd-preview-modal-xl').modal('show');
			});
			
			$('.close').on('click', function() {
				$('.bd-preview-modal-xl').modal('hide');
			});
		});
	</script>
</body>
</html> 