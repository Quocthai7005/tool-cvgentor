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
				<div class="card shadow">
					<div class="card-header bg-green text-light">
						Select a style
					</div>
					<div class="card-body text-center" id="themes" style="max-height: 50%; overflow-y: scroll">
						<#list model["curriVitaeList"] as curriVitae>
							<button type="button" value="${curriVitae.id}" class="btn btn-light theme w-100 mb-xxl-2">${curriVitae.name}</button>
						</#list>
					</div>
				</div>
			</div>
			<div id="cv-container" class="col-sm-8 mt-xxl-1 mb-xxl-1 printArea">
				<div class="card printArea shadow">
					<div class="card-header bg-green text-light">
						Preview
					</div>
					<div class="card-body printArea">
						<div id="select-this-cv"></div>
						<div id="cv-contents">Please select a theme at the left menu to see cv details</div>
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
	<#include "spinner.html.ftl">
	<script>
		$(document).ready(function() {
			$('#spinner').hide();
			$('.theme').on('click', function() {
				$('#spinner').show();
				var cvId = $(this).attr('value');
				$.ajax({
					url: "theme",
					data: {
						cvId: cvId
					},
					success: function( html ) {
						$('.editable').attr('contenteditable', 'false');
						setTimeout(() => {
							$('#select-this-cv').html('');
							$('#cv-contents').html('');
							$('#select-this-cv').html('<a type="button" class="btn btn-warning text-white" href="editCurriVitae?cvId=' + cvId + '">Select this cv</a>');
							$('#cv-contents').html(html);
							$('#blah').attr('src', 'resources/img/dummy-avatar.jpg');
							$('#spinner').hide();
						}, 2000);
					}
				});
			});
		});
		function toVietnamese() {
			$('#education').text('Học vấn');
			$('#projects').text('Dự án');
			$('#skills').text('Kỹ năng');
			$('#experience').text('Kinh nghiệm');
			$('#careerTarget').text('Mục tiêu nghề nghiệp');
			$('#name').text('Họ tên');
			$('#gender').text('Giới tính');
			$('#dob').text('Ngày sinh');
			$('#phone').text('Điện thoại');
			$('#email').text('Email');
			$('#address').text('Địa chỉ');
			$('#blah').attr('alt', 'Click vào đây để upload hình ảnh');
		}
		function toEnglish() {
			$('#education').text('Education');
			$('#projects').text('Projects');
			$('#skills').text('Skills');
			$('#experience').text('Experience');
			$('#careerTarget').text('Career Target');
			$('#name').text('Name');
			$('#gender').text('Gender');
			$('#dob').text('Date of birth');
			$('#phone').text('Phone');
			$('#email').text('Email');
			$('#address').text('Address');
			$('#blah').attr('alt', 'Click on this area to add your picture');
		}
	</script>
	<style>
		.no-print {
			display: none;
		}
	</style>
</body>
</html> 