<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Start.aspx.cs" Inherits="register.Start" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration Portal</title>

    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800;900&display=swap" rel="stylesheet" />

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Open Sans', sans-serif;
            color: #fff;
        }

        .hero-container {
            background: linear-gradient(rgba(33, 37, 41, 0.45), rgba(33, 37, 41, 0.45)),
                        url('https://images.unsplash.com/photo-1497215728101-856f4ea42174?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            width: 90%;
            max-width: 1400px;
            margin: 0 auto;
        }

        .top-bar {
            background: rgba(0, 0, 0, 0.15);
            padding: 12px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .flex-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-nav {
            padding: 20px 0;
        }

        /* ===== CINEMATIC BASE ===== */
        .cinematic {
            opacity: 0;
            transform: scale(0.3);
            filter: blur(12px);
            animation: cinematicZoom 5s ease-out forwards;
        }

        /* ===== LOGO ===== */
        .logo {
            font-size: 48px;
            font-weight: 900;
            font-style: italic;
            color: #00aeef;
            letter-spacing: 1px;
            white-space: nowrap;
        }

        /* ===== BUBBLE MENU ===== */
        .bubble-menu {
            display: grid;
            grid-template-columns: auto auto;
            grid-template-rows: auto auto auto;
            gap: 18px 30px;
            justify-items: end;
        }

        .bubble {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 14px;
            text-decoration: none;
            color: #fff;
            box-shadow: 0 10px 20px rgba(0,0,0,0.25);
            text-align: center;
        }

        .bubble-login {
            grid-column: 2;
            grid-row: 1;
            background: #ff4d4d;
        }

        .bubble-search {
            grid-column: 1;
            grid-row: 2;
            background: #28a745;
        }

        .bubble-contact {
            grid-column: 2;
            grid-row: 3;
            background: #007bff;
        }

        /* ===== HERO BODY ===== */
        .hero-body {
            flex-grow: 1;
            display: flex;
            align-items: center;
        }

        .hero-text {
            max-width: 600px;
        }

        /* ===== REGISTER BUTTON ===== */
        .btn-cta {
            background-color: #00aeef;
            color: #fff;
            padding: 16px 32px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 700;
            font-size: 14px;
            display: inline-block;
        }

        .btn-cta:hover {
            background-color: #0088cc;
        }

        /* ===== CINEMATIC KEYFRAMES ===== */
        @keyframes cinematicZoom {
            0% {
                opacity: 0;
                transform: scale(0.3);
                filter: blur(12px);
            }
            60% {
                opacity: 1;
                transform: scale(1.05);
                filter: blur(4px);
            }
            100% {
                opacity: 1;
                transform: scale(1);
                filter: blur(0);
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="hero-container">

        <div class="top-bar">
            <div class="container"></div>
        </div>

        <header class="header-nav">
            <div class="container flex-box">

                <!-- LOGO (CINEMATIC) -->
                <div class="logo cinematic">
                    STUDENT REGISTRATION PORTAL
                </div>

                <!-- BUBBLES -->
                <div class="bubble-menu">
                    <a id="loginBubble" class="bubble bubble-login" href="Login.aspx"></a>
                    <a id="searchBubble" class="bubble bubble-search" href="Search.aspx"></a>
                    <a id="contactBubble"
                       class="bubble bubble-contact"
                       href="https://mail.google.com/mail/?view=cm&fs=1&to=mishraanshu350@gmail.com&su=Student%20Portal%20Enquiry&body=Hello%20Team,%0D%0A%0D%0AI%20would%20like%20to%20know%20more%20about..."
                       target="_blank"></a>
                </div>

            </div>
        </header>

        <div class="hero-body">
            <div class="container">
                <div class="hero-text">
                    <asp:HyperLink ID="lnkRegister"
                                   runat="server"
                                   NavigateUrl="WebForm1.aspx"
                                   CssClass="btn-cta cinematic">
                        REGISTER YOURSELF
                    </asp:HyperLink>
                </div>
            </div>
        </div>

    </div>

</form>

<script type="text/javascript">
    window.onload = function () {

        setTimeout(function () {
            loginBubble.textContent = "LOGIN";
            loginBubble.classList.add("cinematic");
        }, 2000);

        setTimeout(function () {
            searchBubble.textContent = "SEARCH 🔍";
            searchBubble.classList.add("cinematic");
        }, 3000);

        setTimeout(function () {
            contactBubble.textContent = "CONTACT US";
            contactBubble.classList.add("cinematic");
        }, 4000);
    };
</script>

</body>
</html>
