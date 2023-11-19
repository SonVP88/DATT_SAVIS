<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../../../../resources/css/login.css">
    <style>
        .github-corner:hover .octo-arm {
            animation: octocat-wave 560ms ease-in-out
        }

        @keyframes octocat-wave {

            0%,
            100% {
                transform: rotate(0)
            }

            20%,
            60% {
                transform: rotate(-25deg)
            }

            40%,
            80% {
                transform: rotate(10deg)
            }
        }

        @media (max-width: 500px) {
            .github-corner:hover .octo-arm {
                animation: none
            }

            .github-corner .octo-arm {
                animation: octocat-wave 560ms ease-in-out
            }
        }

        * {
            margin: 0;
            padding: 0;
        }

        html,
        body {
            height: 100%;
            touch-action: none;
        }

        body {
            overflow: hidden;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            background: #111;
            -webkit-perspective: 1000px;
            perspective: 1000px;
            -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
        }

        #drag-container,
        #spin-container {
            position: relative;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            margin: auto;
            -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
            -webkit-transform: rotateX(-10deg);
            transform: rotateX(-10deg);
        }

        #drag-container img,
        #drag-container video {
            -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            line-height: 200px;
            font-size: 50px;
            text-align: center;
            -webkit-box-shadow: 0 0 8px #fff;
            box-shadow: 0 0 8px #fff;
            -webkit-box-reflect: below 10px linear-gradient(transparent, transparent, #0005);
        }

        #drag-container img:hover,
        #drag-container video:hover {
            -webkit-box-shadow: 0 0 15px #fffd;
            box-shadow: 0 0 15px #fffd;
            -webkit-box-reflect: below 10px linear-gradient(transparent, transparent, #0007);
        }

        #drag-container p {
            font-family: Serif;
            position: absolute;
            top: 100%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%) rotateX(90deg);
            transform: translate(-50%, -50%) rotateX(90deg);
            color: #fff;
        }

        #ground {
            width: 900px;
            height: 900px;
            position: absolute;
            top: 100%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%) rotateX(90deg);
            transform: translate(-50%, -50%) rotateX(90deg);
            background: -webkit-radial-gradient(center center, farthest-side, #9993, transparent);
        }

        #music-container {
            position: absolute;
            top: 0;
            left: 0;
        }

        @-webkit-keyframes spin {
            from {
                -webkit-transform: rotateY(0deg);
                transform: rotateY(0deg);
            }

            to {
                -webkit-transform: rotateY(360deg);
                transform: rotateY(360deg);
            }
        }

        @keyframes spin {
            from {
                -webkit-transform: rotateY(0deg);
                transform: rotateY(0deg);
            }

            to {
                -webkit-transform: rotateY(360deg);
                transform: rotateY(360deg);
            }
        }

        @-webkit-keyframes spinRevert {
            from {
                -webkit-transform: rotateY(360deg);
                transform: rotateY(360deg);
            }

            to {
                -webkit-transform: rotateY(0deg);
                transform: rotateY(0deg);
            }
        }

        @keyframes spinRevert {
            from {
                -webkit-transform: rotateY(360deg);
                transform: rotateY(360deg);
            }

            to {
                -webkit-transform: rotateY(0deg);
                transform: rotateY(0deg);
            }
        }
    </style>
</head>

<body>
<div id="drag-container">
    <div id="spin-container">
        <img src="/images/test1.jpg" alt="">
        <img src="/images/test.jpg" alt="">
        <img src="/images/test2.jpg" alt="">
        <img src="/images/test3.jpg" alt="">
        <img src="/images/test4.jpg" alt="">
        <img src="/images/test5.jpg" alt="">
        <img src="/images/test6.jpg" alt="">
    </div>
    <div id="ground"></div>
</div>

<div id="music-container" style="display: none;"></div>

<div id="login-form"
     style="display: none;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);color: white;">
    <h2>Login Form</h2>
    <form action="/login" method="post">

        <label for="username">Username:</label>
        <input type="text"id="username" name="taiKhoan" placeholder="Email"><br><br>

        <label for="password">Password:</label>
        <input type="password" name="matKhau" id="password" placeholder="Password" style="margin-left: 3px;"><br><br>

        <input type="submit" value="Login">
    </form>
</div>

<script>
    var radius = 240;
    var autoRotate = true;
    var rotateSpeed = -60;
    var imgWidth = 120;
    var imgHeight = 170;
    var bgMusicURL = 'https://api.soundcloud.com/tracks/143041228/stream?client_id=587aa2d384f7333a886010d5f52f302a';
    var bgMusicControls = true;
    var showLoginFormAfter = 5000;

    setTimeout(init, 1000);

    var odrag = document.getElementById('drag-container');
    var ospin = document.getElementById('spin-container');
    var aImg = ospin.getElementsByTagName('img');
    var aVid = ospin.getElementsByTagName('video');
    var aEle = [...aImg, ...aVid];

    ospin.style.width = imgWidth + "px";
    ospin.style.height = imgHeight + "px";

    var ground = document.getElementById('ground');
    ground.style.width = radius * 3 + "px";
    ground.style.height = radius * 3 + "px";

    function init(delayTime) {
        for (var i = 0; i < aEle.length; i++) {
            aEle[i].style.transform = "rotateY(" + (i * (360 / aEle.length)) + "deg) translateZ(" + radius + "px)";
            aEle[i].style.transition = "transform 1s";
            aEle[i].style.transitionDelay = delayTime || (aEle.length - i) / 4 + "s";
        }

        // Hiển thị biểu mẫu đăng nhập sau khoảng thời gian showLoginFormAfter (ms)
        setTimeout(function () {
            var loginForm = document.getElementById('login-form');
            loginForm.style.display = 'block';
        }, showLoginFormAfter);
    }

    function applyTranform(obj) {
        if (tY > 180) tY = 180;
        if (tY < 0) tY = 0;

        obj.style.transform = "rotateX(" + (-tY) + "deg) rotateY(" + (tX) + "deg)";
    }

    function playSpin(yes) {
        ospin.style.animationPlayState = (yes ? 'running' : 'paused');
    }

    var sX, sY, nX, nY, desX = 0,
        desY = 0,
        tX = 0,
        tY = 10;

    if (autoRotate) {
        var animationName = (rotateSpeed > 0 ? 'spin' : 'spinRevert');
        ospin.style.animation = (animationName + ' ' + Math.abs(rotateSpeed) + 's infinite linear');
    }

    if (bgMusicURL) {
        document.getElementById('music-container').innerHTML += `
                <audio src="${bgMusicURL}" ${bgMusicControls ? 'controls' : ''} autoplay loop>
                    <p>If you are reading this, it is because your browser does not support the audio element.</p>
                </audio>
            `;
    }

    document.onpointerdown = function (e) {
        clearInterval(odrag.timer);
        e = e || window.event;
        var sX = e.clientX,
            sY = e.clientY;

        this.onpointermove = function (e) {
            e = e || window.event;
            var nX = e.clientX,
                nY = e.clientY;
            desX = nX - sX;
            desY = nY - sY;
            tX += desX * 0.1;
            tY += desY * 0.1;
            applyTranform(odrag);
            sX = nX;
            sY = nY;
        };

        this.onpointerup = function (e) {
            odrag.timer = setInterval(function () {
                desX *= 0.95;
                desY *= 0.95;
                tX += desX * 0.1;
                tY += desY * 0.1;
                applyTranform(odrag);
                playSpin(false);
                if (Math.abs(desX) < 0.5 && Math.abs(desY) < 0.5) {
                    clearInterval(odrag.timer);
                    playSpin(true);
                }
            }, 17);
            this.onpointermove = this.onpointerup = null;
        };
    };

    document.onmousewheel = function (e) {
        e = e || window.event;
        var d = e.wheelDelta / 20 || -e.detail;
        radius += d;
        init(1);
    };

</script>

</body>

</html>
