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
	<#include "navbar.html.ftl">
	<div class="container printArea">
		<div class="row mt-60 printArea">
			<div class="col-sm-4 mt-xxl-1 mb-xxl-1">
				<div class="card">
					<div class="card-header bg-green text-light">
						Modify style and print!
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
				data: {
					cvId: cvId
				},
				success: function( html ) {
					$('#cv-contents').html(html);
				}
			});
		});
	</script>
</body>
</html> 