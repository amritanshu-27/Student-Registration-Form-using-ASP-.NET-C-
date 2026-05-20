<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="reg.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #1b2a47;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container { width: 100%; padding: 20px; }

        .card {
            background: #0f1a33;
            max-width: 700px;
            margin: auto;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.35);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #fff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        td:first-child {
            width: 30%;
            font-weight: bold;
            color: #fff;
        }

        input[type=text],
        input[type=password],
        input[type=email],
        input[type=date],
        select,
        input[type=file] {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            background: #fff;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover { background-color: #0056b3; }

        .btn-home {
            background-color: #6c757d;
        }

        .btn-home:hover {
            background-color: #545b62;
        }

        .error {
            color: red;
            font-size: 12px;
            display: block;
        }

        .msg {
            margin-top: 15px;
            text-align: center;
            font-weight: bold;
            color: #fff;
        }

        .rblGender {
            display: flex;
            gap: 35px;
            font-weight: bold;
            color: #fff;
        }

        .phone-group {
            display: flex;
            gap: 10px;
        }

        .phone-group select {
            width: 25%;
            padding: 6px;
            font-size: 13px;
        }

        .phone-group input {
            width: 75%;
        }
    </style>
</head>

<body>
<form id="form1" runat="server" enctype="multipart/form-data">
    <div class="container">
        <div class="card">

            <h2>Student Registration Form</h2>

            <table>
                <tr>
                    <td>Full Name</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Required"
                            CssClass="error" />
                    </td>
                </tr>

                <tr>
                    <td>Date of Birth</td>
                    <td>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtDOB"
                            ErrorMessage="Required"
                            CssClass="error" />
                    </td>
                </tr>

                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server"
                            RepeatDirection="Horizontal"
                            RepeatLayout="Flow"
                            CssClass="rblGender">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                        </asp:RadioButtonList>

                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="rblGender"
                            InitialValue=""
                            ErrorMessage="Select gender"
                            CssClass="error" />
                    </td>
                </tr>

                <tr>
                    <td>Phone</td>
                    <td>
                        <div class="phone-group">
                            <asp:DropDownList ID="ddlCountryCode" runat="server">
                                <asp:ListItem Text="--Code--" Value=""></asp:ListItem>
                                <asp:ListItem Text="+91 (India)" Value="+91"></asp:ListItem>
                                <asp:ListItem Text="+1 (USA)" Value="+1"></asp:ListItem>
                                <asp:ListItem Text="+44 (UK)" Value="+44"></asp:ListItem>
                                <asp:ListItem Text="+61 (Australia)" Value="+61"></asp:ListItem>
                            </asp:DropDownList>

                            <asp:TextBox ID="txtPhone" runat="server" MaxLength="10"></asp:TextBox>
                        </div>

                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="ddlCountryCode"
                            InitialValue=""
                            ErrorMessage="Select country code"
                            CssClass="error" />

                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtPhone"
                            ErrorMessage="Required"
                            CssClass="error" />

                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="txtPhone"
                            ValidationExpression="^[6-9]\d{9}$"
                            ErrorMessage="Invalid phone number"
                            CssClass="error" />
                    </td>
                </tr>

                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Required"
                            CssClass="error" />
                    </td>
                </tr>

                <!-- ✅ Upload Photo Section -->
                <tr>
                    <td>Upload Photo</td>
                    <td>
                        <asp:FileUpload ID="fuPhoto" runat="server" />
                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="fuPhoto"
                            ErrorMessage="Photo is required"
                            CssClass="error" />

                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="fuPhoto"
                            ValidationExpression="^.*\.(jpg|JPG|jpeg|JPEG|png|PNG)$"
                            ErrorMessage="Only JPG, JPEG, PNG allowed"
                            CssClass="error" />
                    </td>
                </tr>

                <tr>
                    <td>Username</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtUsername"
                            ErrorMessage="Required"
                            CssClass="error" />
                    </td>
                </tr>

                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Required"
                            CssClass="error" />
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td style="text-align:right; padding-top:15px;">
                        <asp:Button ID="btnHome" runat="server"
                            Text="Home"
                            CssClass="btn btn-home"
                            PostBackUrl="~/Start.aspx"
                            CausesValidation="false"
                            Style="margin-right:10px;" />

                        <asp:Button ID="btnRegister" runat="server"
                            Text="Register"
                            CssClass="btn"
                            OnClick="btnRegister_Click" />
                    </td>
                </tr>
            </table>

            <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

        </div>
    </div>
</form>
</body>
</html>
