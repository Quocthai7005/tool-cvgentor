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
	<meta charset="UTF-8"> 
</head>
<body>
	<#include "navbar.html.ftl">
	<div class="container printArea">
		<div class="row mt-60 printArea">
			<div class="col-sm-4 mt-xxl-1 mb-xxl-1">
				<div class="card">
					<div class="card-header bg-green text-light">
						Modify style and print! chỉnh sửa
					</div>
					<div class="card-body" id="description">

					</div>
				</div>
			</div>
			<div class="col-sm-8 mt-xxl-1 mb-xxl-1 printArea">
				<div class="card printArea">
					<div class="card-header bg-green text-light">
						CV contents
					</div>
					<div class="card-body printArea">
						<button class="btn btn-primary" onclick="printCv()">Save as PDF</button>
						<div id="cv-contents">Please select a theme at the left menu to see cv details</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="cvId" value="${model["cv"].id}">
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
			var cvId = $('#cvId').attr('value');
			$.ajax({
				url: "theme",
				contentType : 'application/json; charset=UTF-8',
				data: {
					cvId: cvId
				},
				success: function( html ) {
					$('#cv-contents').html(html);
				}
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
</body>
</html> 