<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chat</title>
    <script src="/webjars/sockjs-client/1.0.2/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/2.3.3/stomp.min.js"></script>
    <style>
        body {
            background: white;
        }

        #message-container {
            position: fixed;
            bottom: 20px;
            left: 40%;
            transform: translateX(-50%);
        }

        #message {
            width: 50%;
            font-size: 15px;
            flex: 1;
        }

        button {
            padding: 10px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        #chat {
            max-height: 70vh; /* Giới hạn chiều cao của chat để có thanh cuộn */
            overflow-y: auto; /* Cho phép cuộn khi nội dung vượt qua kích thước hiển thị */
        }
    </style>
    <script type="text/javascript">
        var stompClient = null;

        function connect() {
            var socket = new SockJS('/chat');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                stompClient.subscribe('/topic/public', function (message) {
                    showMessage(message.body);
                });
            });
        }

        function sendMessage() {
            var message = document.getElementById('message').value;
            stompClient.send("/app/sendMessage", {}, message);
            document.getElementById('message').value = '';
        }

        function showMessage(message, sender) {
            var chat = document.getElementById('chat');
            var messageDiv = document.createElement('div');
            messageDiv.textContent = message;

            if (sender === 'A') {
                messageDiv.className = 'message right'; // Tin nhắn của người A
            } else if (sender === 'B') {
                messageDiv.className = 'message left'; // Tin nhắn của người B
            }

            chat.appendChild(messageDiv);

            // Cuộn tự động xuống dòng cuối cùng
            chat.scrollTop = chat.scrollHeight;
        }


        window.onload = connect;
    </script>
</head>
<body>
<div id="chat"></div>
<div id="message-container">
    <input type="text" id="message">
    <button onclick="sendMessage()">Send</button>
</div>
</body>
</html>
