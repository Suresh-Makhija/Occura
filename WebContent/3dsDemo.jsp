<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="3ds/demo-styles.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body>
	<div class="row">

		<div class="col-md-4" style="padding: 0;margin: 0;width: 25%;">
			<model-viewer class="a" src="3ds\look_diamond.glb"
				alt="" background-color="black"
				shadow-intensity="1" camera-controls auto-rotate
				animation-name="Running"></model-viewer>
		</div>
		<div class="col-md-4" style="padding: 0;margin: 0;width: 25%;">
			<model-viewer class="a" src="3ds\look_inclusion.glb"
				alt="" background-color="black"
				shadow-intensity="1" camera-controls auto-rotate
				animation-name="Running"></model-viewer>
		</div>
		<div class="col-md-4" style="padding: 0;margin: 0;width: 25%;">
			<model-viewer class="a" src="3ds\look_stone.glb"
				alt="" background-color="black"
				shadow-intensity="1" camera-controls auto-rotate
				animation-name="Running"></model-viewer>
		</div>
	</div>


	<script type="module"
		src="https://unpkg.com/@google/model-viewer@v0.3.1/dist/model-viewer.js">
  </script>

	<script nomodule
		src="https://unpkg.com/@google/model-viewer@v0.3.1/dist/model-viewer-legacy.js">
  </script>




</body>
</html>