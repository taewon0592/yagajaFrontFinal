<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- Begin Head -->
<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>실시간 채팅</title>
<meta name="keywords" content="HTML5 Theme" />
<meta name="description" content="Megakit - HTML5 Theme">
<meta name="author" content="keenthemes.com">

<!-- Web Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i|Montserrat:400,700"
	rel="stylesheet">

<!-- Vendor Styles -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="../resources/css/animate.css" rel="stylesheet"
	type="text/css" />
<link href="../resources/vendor/themify/themify.css" rel="stylesheet"
	type="text/css" />
<link href="../resources/vendor/scrollbar/scrollbar.min.css"
	rel="stylesheet" type="text/css" />
<link href="../resources/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css" />
<link href="../resources/vendor/swiper/swiper.min.css" rel="stylesheet"
	type="text/css" />
<link href="../resources/vendor/cubeportfolio/css/cubeportfolio.min.css"
	rel="stylesheet" type="text/css" />

<!-- Theme Styles -->
<link href="../resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/global/global.css" rel="stylesheet"
	type="text/css" />

<!-- Favicon -->
<link rel="shortcut icon" href="../resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="../resources/img/apple-touch-icon.png">


<!-- add -->
<link href="../resources/vendor/themify/themify.css" rel="stylesheet"
	type="text/css" />


</head>
<!-- End Head -->

<!-- Body -->
<body>
	<style>
.jstalktheme {
	background-color: #9bbad8;
	padding: 4px 4px 0px 4px;
}

.jstalktheme .clear {
	clear: both;
}

.jstalktheme .blank {
	clear: both;
	height: 4px;
}

.jstalktheme .msg {
	height: calc(100% - 72px);
	overflow-y: scroll;
	font-size: 12px;
}

.jstalktheme .msg .time {
	font-size: 10px;
}

.jstalktheme .msg .mytalk {
	float: right;
	width: 100%;
}

.jstalktheme .msg .mytalk .time {
	float: right;
	bottom: 0;
}

.jstalktheme .msg .mytalk .a {
	float: right;
	position: relative;
	min-height: 24px;
	max-width: calc(100% - 64px);
	left: 2px;
	background-color: #ffec42;
	border-radius: 3px;
	z-index: 2;
	padding: 0px 4px 0px 4px;
	word-break: break-all;
}

.jstalktheme .msg .mytalk .b {
	float: right;
	position: relative;
	width: 8px;
	height: 22px;
	background: url(./resources/common/img/core-img/chat_balloon_yellow.right.png) no-repeat;
	z-index: 1;
}

.jstalktheme .msg .othertalk {
	float: left;
	width: 100%;
}

.jstalktheme .msg .othertalk .profile_image {
	float: left;
	width: 40px;
	height: 40px;
	border-radius: 14px;
}

.jstalktheme .msg .othertalk .box {
	float: left;
	width: calc(100% - 48px);
}

.jstalktheme .msg .othertalk .box .profile_name {
	font-size: 12px;
}

.jstalktheme .msg .othertalk .box .a {
	float: left;
	position: relative;
	width: 8px;
	height: 22px;
	background: url(./resources/common/img/core-img/chat_balloon_white.left.png) no-repeat;
	z-index: 1;
}

.jstalktheme .msg .othertalk .box .b {
	float: left;
	position: relative;
	min-height: 24px;
	max-width: calc(100% - 64px);
	left: -2px;
	background-color: #ffffff;
	border-radius: 3px;
	z-index: 2;
	padding: 0px 4px 0px 4px;
	word-break: break-all;
}

.jstalktheme .msg .othertalk .box .time {
	float: left;
}

.jstalktheme .sendmsg {
	
}

.jstalktheme .sendmsg .textarea {
	float: left;
	width: calc(100% - 68px);
	height: 64px;
	border-radius: 8px 0px 0px 8px;
	margin: 0px 0px 0px 0px;
	padding: 2px 2px 2px 2px;
	resize: none;
}

.jstalktheme .sendmsg .button {
	float: right;
	width: 62px;
	height: 68px;
	background-color: #ffec42;
	border-radius: 0px 8px 8px 0px;
	margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
	text-align: center;
	display: table;
	cursor: pointer;
}

.jstalktheme .sendmsg .button p {
	display: table-cell;
	vertical-align: middle;
}
</style>
	<script>
		
		function jstalktheme_addmsg(name, time, msg) {
			var ocontainer = document.getElementById("jstalktheme_test");
			var ocontainer_msg = ocontainer.getElementsByClassName("msg")[0];

			var onewmsg = document.createElement("div");
			var onewblank = document.createElement("div");
			
			if (name==="admin") {
				onewmsg.className = "othertalk";
				onewmsg.innerHTML = "<div class=\"profile_image\" style=\"background: url(./resources/common/img/core-img/admin.png) no-repeat;\">\n"
						+ "</div>\n"
						+ "<div class=\"box\">\n"
						+ "<div class=\"profile_name\">\n"
						+ name
						+ "\n"
						+ "</div>\n"
						+ "<div class=\"a\">\n"
						+ "</div>\n"
						+ "<div class=\"b\">\n"
						+ msg
						+ "\n"
						+ "</div>\n"
						+ "<div class=\"time\">\n"
						+ time
						+ "\n"
						+ "</div>\n"
						+ "</div>\n";
			} else {
				onewmsg.className = "mytalk";
				onewmsg.innerHTML = "<div class=\"b\">\n" + "</div>\n"
						+ "<div class=\"a\">\n" + msg + "\n" + "</div>\n"
						+ "<div class=\"time\">\n" + time + "\n" + "</div>\n"
						+ "";
			}

			onewmsg.innerHTML += "<div class=\"clear\">\n" + "</div>";

			onewblank.className = "blank";

			ocontainer_msg.appendChild(onewmsg);
			ocontainer_msg.appendChild(onewblank);

			ocontainer_msg.scrollTop = ocontainer_msg.scrollHeight;
		}

		function jstalktheme_testfunc(name, text) {
			var otxtmsg = document.getElementById("jstalktheme_testmsg");

			var d = new Date();
			var ampm = (d.getHours() > 12 ? "PM" : "AM");
			var h = (d.getHours() > 12 ? d.getHours() - 12 : d.getHours());
			var m = d.getMinutes();

			jstalktheme_addmsg(name, ampm + " " + h + ":" + m, text);
		}
	</script>
		
    <div>
        <!-- <button type="button" onclick="openSocket();">Open</button>
        <button type="button" onclick="closeSocket();">Close</button>  -->
        <input type="hid-den" id="sender" value="${param.id }"/>
        
        <c:choose>
        	<c:when test="${param.id eq 'admin' }">
        		<input type="hid-den" id="roomId" value="45"/>
        	</c:when>
        	<c:otherwise>
        		<input type="hidden" id="roomId" value="${param.member_no }"/>
        	</c:otherwise>
        </c:choose>
        
    </div>
	<div class="jstalktheme" id="jstalktheme_test"
		style="width: 320px; height: 480px;">

		<div class="msg"></div>

		<div class="sendmsg">
			<textarea class="textarea" id="jstalktheme_testmsg"
				onkeypress="if(event.keyCode==13){ send(); this.value=''; return false; }else if(event.keyCode==10){ this.value+='\n'; }"></textarea>
			<div class="button" onclick="send()">
				<p>전송</p>
			</div>
			<div class="clear"></div>
		</div>

	</div>	
	


    <!-- Script to utilise the WebSocket -->
    <script type="text/javascript">
        var webSocket;
        var messages = document.getElementById("messages");
      
        window.onload = function() {
        	
        	  var roomTest = document.getElementById("roomId").value;
      		  var roomId = '';	
              console.log("room"+roomTest);
              if(roomTest) {
              	roomId = roomTest;
              } else {
              	roomId = "11";
              }
        	
        	
            // Ensures only one connection is open at a time
            if (webSocket !== undefined && webSocket.readyState !== WebSocket.CLOSED) {
                writeResponse("WebSocket is already opened.");
                return;
            }
            
            
            
            /* 본인 ip주소로 설정 */
            // Create a new instance of the websocket
            webSocket = new WebSocket('ws://192.168.0.178:8282/yagajaFinal/echo/'+roomId);

            /**
             * Binds functions to the listeners for the websocket.
             */
            webSocket.onopen = function(event) {
                // For reasons I can't determine, onopen gets called twice
                // and the first time event.data is undefined.
                // Leave a comment if you know the answer.
                if (event.data === undefined)
                    return;

                writeResponse(event.data);
            };

            webSocket.onmessage = function(event) {
                writeResponse(event.data);
            };

            webSocket.onclose = function(event) {
                writeResponse("Connection closed");
            };
        }

        /**
         * Sends the value of the text input to the server
         */
        function send() {
            var text = document.getElementById("jstalktheme_testmsg").value+","+document.getElementById("sender").value;
            webSocket.send(text);
        }

        function closeSocket() {
            webSocket.close();
        }

        function writeResponse(text) {
        	var textArr = text.split(":");
        	
        	jstalktheme_testfunc(textArr[0].trim(), textArr[1]);
        }
    </script>
	
</body>
<!-- End Body -->
</html>
