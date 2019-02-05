<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
</head>
<body>
	<h1>Hello world</h1>
	<button onclick="send()">Send</button>

	<script>
		var socket = new SockJS('${pageContext.request.contextPath }/mysocket');
		stomClient = Stomp.over(socket);
		stomClient.connect({}, function(frame) {
			console.log(frame);
			stomClient.subscribe('/topic/abc', function(message) {
				console.log("tin nhan tu server: " + message.body);
				obj = JSON.parse(message.body);
				alert(obj.data);
			});
		})

		function send() {
			var str = JSON.stringify({
				data : 'hello server'
			});
			stomClient.send('/app/hello', {}, str);
		}
	</script>
</body>
</html>