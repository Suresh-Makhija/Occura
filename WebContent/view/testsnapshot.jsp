<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">


/* #results { float:right; margin:20px; padding:20px; border:1px solid; background:#ccc; } */


</style>

</head>
<body>

	<!-- 1  -->
	<!-- <video id="v" width="300" height="300"></video>
	<input id="b" type="button" disabled="true" value="Take Picture"></input>
	<canvas id="c" style="display:none;" width="300" height="300"></canvas> -->
	<!-- 1  -->
	
	
	
	<!-- 2  -->
	<!--  <video id="video" width="213" height="160" autoplay></video>
    <button id="snap">Capture Photo</button>
    <canvas id="canvas" width="213" height="160"  name="ImageFile1" style="display: none;"></canvas>
    <img id="canvasImg" name="ImageFile"><img> -->
    <!-- <input type="hidden" name="ImageData" id="ImageData" /> -->
    <!-- 2  -->
    
    
    
    <!-- 3  -->
    
     <!--  <div id="results"></div>
      
      <div id="my_camera"></div>
      
      <input type=button value="Take Snapshot" onClick="take_snapshot()"> -->
    <!-- 3  -->
    
  
  
   <!-- 4  -->
   
   <%-- <video id="video" width="213" height="160" autoplay></video>
    <canvas id="canvas" width="213" height="160"  name="ImageFile1" style="display: none;"></canvas>
    <input type=button value="Take Snapshot" onClick="takeSnapshot()"> 
      <img id="photo" src="<%=request.getContextPath()%>/images/user1.png" alt="The screen capture will appear in this box."> --%>
      
    <!-- 4  -->
    
    
    <!-- 5  -->
    <div class="contentarea">
        <h1>
            Using Javascript to capture Photo
        </h1>
        <div class="camera">
            <video id="video">Video stream not available.</video>
        </div>
        <div><button id="startbutton">Take photo</button></div>
        <canvas id="canvas"></canvas>
        <div class="output">
            <img id="photo" alt="The screen capture will appear in this box.">
        </div>
    </div>
    <!-- 5  -->
    
    
    
    
</body>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/webcam.min.js"></script> --%>
<script>
/* 1 */
/* 	navigator.getUserMedia({video: true}, function(stream) {
		var video = document.getElementById("v");
		var canvas = document.getElementById("c");
		var button = document.getElementById("b");

		video.src = stream;
		button.disabled = false;
		button.onclick = function() {
			canvas.getContext("2d").drawImage(video, 0, 0, 300, 300, 0, 0, 300, 300);
			var img = canvas.toDataURL("image/png");
			alert("done");
		};
	}, function(err) { alert("there was an error " + err)}); */
	
	/* 1 */
	
	
	/* 2 */
	
 	 // Put event listeners into place
      /*   window.addEventListener("DOMContentLoaded", function () {
            // Grab elements, create settings, etc.
            var canvas = document.getElementById("canvas"),
                    context = canvas.getContext("2d"),
                    video = document.getElementById("video"),
                    videoObj = {"video": true},
            errBack = function (error) {
                console.log("Video capture error: ", error.code);
            };

            // Put video listeners into place
            if (navigator.getUserMedia) { // Standard
                navigator.getUserMedia(videoObj, function (stream) {
                    video.src = stream;
                    video.play();
                }, errBack);
            } else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
                navigator.webkitGetUserMedia(videoObj, function (stream) {
                    video.src = window.webkitURL.createObjectURL(stream);
                    video.play();
                }, errBack);
            } else if (navigator.mozGetUserMedia) { // WebKit-prefixed
                navigator.mozGetUserMedia(videoObj, function (stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                }, errBack);
            }

            // Trigger photo take
            document.getElementById("snap").addEventListener("click", function () {
                context.drawImage(video, 0, 0, 213, 160);
                document.getElementById('canvasImg').src = canvas.toDataURL("image/png");
				
                //document.getElementById('ImageData').value = canvas.toDataURL("image/png");
                
                
//                    document.getElementById('video').style.display = "none";  // hide the live image video portin after click on take picture
            });

        }, false); 	 */
	
	
	/* 2 */
	
	
	
	
	/* 3 */
/* 	Webcam.set({
			width: 320,
			height: 240,
			image_format: 'jpeg',
			jpeg_quality: 90
		});
		
		Webcam.on( 'load', function() {
			document.getElementById('results').innerHTML += '<p><b>EVENT FIRED:</b> Library loaded.</p>';
		} );
		Webcam.on( 'live', function() {
			document.getElementById('results').innerHTML += '<p><b>EVENT FIRED:</b> Camera is live.</p>';
		} );
		
		Webcam.attach( '#my_camera' );
		
		
		function take_snapshot() {
			// take snapshot and get image data
			Webcam.snap( function(data_uri) {
				// display results in page
				document.getElementById('results').innerHTML = 
					'<h2>Here is your image:</h2>' + 
					'<img src="'+data_uri+'"/>';
			} );
		} */
		
	
	/* 3 */
	
	
	/* 4 */

	/* var video = document.getElementById("videos");
	var canvas = document.getElementById("canvas");
	
	  if (navigator.mediaDevices) {
	      // access the web cam
	      navigator.mediaDevices.getUserMedia({video: true})
	      // permission granted:
	        .then(function(stream) {
	          video.src = window.URL.createObjectURL(stream);
	          video.addEventListener('click', takeSnapshot);
	        })
	        // permission denied:
	        .catch(function(error) {
	          document.body.textContent = 'Could not access the camera. Error: ' + error.name;
	        });
	    }
	
	  
	   function takeSnapshot() {
		      var img = document.querySelector('photo') || document.createElement('photo');
		      var context;
		      var width = video.offsetWidth
		        , height = video.offsetHeight;

		      canvas = canvas || document.createElement('canvas');
		      canvas.width = width;
		      canvas.height = height;

		      context = canvas.getContext('2d');
		      context.drawImage(video, 0, 0, width, height);

		      img.src = canvas.toDataURL('image/png');
		      document.body.appendChild(img);
		    } */
	   
	
	/* 4 */
	
	
	/* 5 */
	
	
	(function() {

        var width = 320; // We will scale the photo width to this
        var height = 0; // This will be computed based on the input stream

        var streaming = false;

        var video = null;
        var canvas = null;
        var photo = null;
        var startbutton = null;

        function startup() {
            video = document.getElementById('video');
            canvas = document.getElementById('canvas');
            photo = document.getElementById('photo');
            startbutton = document.getElementById('startbutton');

            navigator.mediaDevices.getUserMedia({
                    video: true,
                    audio: false
                })
                .then(function(stream) {
                    video.srcObject = stream;
                    video.play();
                })
                .catch(function(err) {
                    console.log("An error occurred: " + err);
                });

            video.addEventListener('canplay', function(ev) {
                if (!streaming) {
                    height = video.videoHeight / (video.videoWidth / width);

                    if (isNaN(height)) {
                        height = width / (4 / 3);
                    }

                    video.setAttribute('width', width);
                    video.setAttribute('height', height);
                    canvas.setAttribute('width', width);
                    canvas.setAttribute('height', height);
                    streaming = true;
                }
            }, false);

            startbutton.addEventListener('click', function(ev) {
                takepicture();
                ev.preventDefault();
            }, false);

            clearphoto();
        }


        function clearphoto() {
            var context = canvas.getContext('2d');
            context.fillStyle = "#AAA";
            context.fillRect(0, 0, canvas.width, canvas.height);

            var data = canvas.toDataURL('image/png');
            photo.setAttribute('src', data);
        }

        function takepicture() {
            var context = canvas.getContext('2d');
            if (width && height) {
                canvas.width = width;
                canvas.height = height;
                context.drawImage(video, 0, 0, width, height);

                var data = canvas.toDataURL('image/png');
                photo.setAttribute('src', data);
            } else {
                clearphoto();
            }
        }

        window.addEventListener('load', startup, false);
    })();
	
	
	/* 5 */
</script>

</html>