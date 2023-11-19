<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="utf-8">


    <title>chat app - Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <style type="text/css">
        body {
            background-color: #f4f7f6;
            margin-top: 20px;
        }

        .card {
            background: #fff;
            transition: .5s;
            border: 0;
            margin-bottom: 30px;
            border-radius: .55rem;
            position: relative;
            width: 100%;
            box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
        }

        .chat-app .people-list {
            width: 280px;
            position: absolute;
            left: 0;
            top: 0;
            padding: 20px;
            z-index: 7
        }

        .chat-app .chat {
            /*margin-left: 280px;*/
            border-left: 1px solid #eaeaea
        }

        .people-list {
            -moz-transition: .5s;
            -o-transition: .5s;
            -webkit-transition: .5s;
            transition: .5s
        }

        .people-list .chat-list li {
            padding: 10px 15px;
            list-style: none;
            border-radius: 3px
        }

        .people-list .chat-list li:hover {
            background: #efefef;
            cursor: pointer
        }

        .people-list .chat-list li.active {
            background: #efefef
        }

        .people-list .chat-list li .name {
            font-size: 15px
        }

        .people-list .chat-list img {
            width: 45px;
            border-radius: 50%
        }

        .people-list img {
            float: left;
            border-radius: 50%
        }

        .people-list .about {
            float: left;
            padding-left: 8px
        }

        .people-list .status {
            color: #999;
            font-size: 13px
        }

        .chat .chat-header {
            padding: 15px 20px;
            border-bottom: 2px solid #f4f7f6
        }

        .chat .chat-header img {
            float: left;
            border-radius: 40px;
            width: 40px
        }

        .chat .chat-header .chat-about {
            float: left;
            padding-left: 10px
        }

        .chat .chat-history {
            padding: 20px;
            border-bottom: 2px solid #fff
        }

        .chat .chat-history ul {
            padding: 0
        }

        .chat .chat-history ul li {
            list-style: none;
            margin-bottom: 30px
        }

        .chat .chat-history ul li:last-child {
            margin-bottom: 0px
        }

        .chat .chat-history .message-data {
            margin-bottom: 15px
        }

        .chat .chat-history .message-data img {
            border-radius: 40px;
            width: 40px
        }

        .chat .chat-history .message-data-time {
            color: #434651;
            padding-left: 6px
        }

        .chat .chat-history .message {
            color: #444;
            padding: 18px 20px;
            line-height: 26px;
            font-size: 16px;
            border-radius: 7px;
            display: inline-block;
            position: relative
        }

        .chat .chat-history .message:after {
            bottom: 100%;
            left: 7%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-bottom-color: #fff;
            border-width: 10px;
            margin-left: -10px
        }

        .chat .chat-history .my-message {
            background: #efefef
        }

        .chat .chat-history .my-message:after {
            bottom: 100%;
            left: 30px;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-bottom-color: #efefef;
            border-width: 10px;
            margin-left: -10px
        }

        .chat .chat-history .other-message {
            background: #e8f1f3;
            text-align: right
        }

        .chat .chat-history .other-message:after {
            border-bottom-color: #e8f1f3;
            left: 93%
        }

        .chat .chat-message {
            padding: 20px
        }

        .online,
        .offline,
        .me {
            margin-right: 2px;
            font-size: 8px;
            vertical-align: middle
        }

        .online {
            color: #86c541
        }

        .offline {
            color: #e47297
        }

        .me {
            color: #1d8ecd
        }

        .float-right {
            float: right
        }

        .clearfix:after {
            visibility: hidden;
            display: block;
            font-size: 0;
            content: " ";
            clear: both;
            height: 0
        }

        @media only screen and (max-width: 767px) {
            .chat-app .people-list {
                height: 465px;
                width: 100%;
                overflow-x: auto;
                background: #fff;
                left: -400px;
                display: none
            }

            .chat-app .people-list.open {
                left: 0
            }

            .chat-app .chat {
                margin: 0
            }

            .chat-app .chat .chat-header {
                border-radius: 0.55rem 0.55rem 0 0
            }

            .chat-app .chat-history {
                height: 300px;
                overflow-x: auto
            }
        }

        @media only screen and (min-width: 768px) and (max-width: 992px) {
            .chat-app .chat-list {
                height: 650px;
                overflow-x: auto
            }

            .chat-app .chat-history {
                height: 600px;
                overflow-x: auto
            }
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
            .chat-app .chat-list {
                height: 480px;
                overflow-x: auto
            }

            .chat-app .chat-history {
                height: calc(100vh - 350px);
                overflow-x: auto
            }
        }

        #scroll-container {
            width: 100%; /* Độ rộng của phần tử cuộn */
            height: 170px; /* Độ cao của phần tử cuộn */
            overflow: auto; /* Hiển thị thanh cuộn khi nội dung vượt quá kích thước của phần tử */
        }
    </style>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<div class="container">
    <div class="row clearfix">
        <div class="col-lg-12">
            <div class="card chat-app">
                <div class="chat">
                    <div class="chat-header clearfix">
                        <div class="row">
                            <div class="col-lg-6">
                                <a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar">
                                </a>
                                <div class="chat-about">
                                    <h6 class="m-b-0">ADMIN</h6>
                                    <small>Thường trả lời sau 5 phút</small>
                                    <input value="${check}" type="hidden" id="ma">
                                </div>
                            </div>
                            <div class="col-lg-6 hidden-sm text-right">
                                <a href="javascript:void(0);" class="btn btn-outline-primary"><i
                                        class="fa fa-image"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="chat-history" id="scroll-container">
                        <ul class="m-b-0">
                            <c:forEach items="${messages}" var="message">
                                <li class="clearfix">
                                    <div class="${message.users.ma==check?"message other-message float-right":"message my-message"}">
                                            ${message.content}
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        <div id="chat-content"></div>
                    </div>
                    <div class="chat-message clearfix">
                        <div class="input-group mb-0" id="chat">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="send"><i class="fa fa-send"></i></span>
                            </div>
                            <input type="text" id="message"  placeholder="Nhập vào đây để viết . . ."
                                   class="form-control">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

</script>
<script>
    var stompClient = null;
    function connect() {
        var socket = new SockJS('/chat');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            var index = document.getElementById("ma").value;
            stompClient.subscribe('/topic/privateRoomName/'+index, function (message) {
                showMessage(JSON.parse(message.body));
            });
        });
    }

    function showMessage(message) {
        // Tạo các phần tử HTML cho tin nhắn và thời gian
        var chatContent = document.getElementById('chat-content');
        var scrollContainer = document.getElementById('scroll-container');
        var listItem = document.createElement('li');
        var messageText = document.createElement('div');
        var check = document.getElementById("ma").value;
        // Đặt lớp CSS cho tin nhắn dựa trên người gửi và người nhận
        listItem.className = "clearfix";
        listItem.style.listStyleType = 'none'; // Loại bỏ dấu chấm (bullet)
        listItem.style.marginBottom = "35px";
        if (message.users.ma===check) {
            messageText.className = "message other-message float-right";

        } else {
            messageText.className = "message my-message";
        }
        // Đặt nội dung tin nhắn
        messageText.textContent = message.content;
        // Gắn các phần tử HTML vào cấu trúc DOM
        listItem.appendChild(messageText);
        chatContent.appendChild(listItem);
        scrollContainer.scrollTop = scrollContainer.scrollHeight;
    }

    function sendMessage() {
        var messageInput = document.getElementById('message');
        var message = messageInput.value;
        var check = document.getElementById("ma").value;
        if (message.trim() === "") {
            alert("không nhập gì thì đừng gửi");
        }else{
            stompClient.send("/app/chat.sendPrivateMessage", {}, JSON.stringify({'content': message, 'users': {'ma': check},'bientrunggian':check}));
            messageInput.value = '';
        }
    }

    connect();

    document.getElementById('send').addEventListener('click', function () {
        sendMessage();
    });
</script>
<script>
    // Đảm bảo rằng trang đã tải xong trước khi cuộn xuống cuối trang
    window.onload = function() {
        // Lấy đối tượng "scroll-container"
        var scrollContainer = document.getElementById('scroll-container');

        // Cuộn xuống cuối trang
        scrollContainer.scrollTop = scrollContainer.scrollHeight;
    };
</script>
</body>
</html>