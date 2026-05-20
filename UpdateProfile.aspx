<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="UpdateProfile.aspx.cs"
    Inherits="reg.UpdateProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Profile</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #1b2a47;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: #0f1a33;
            width: 700px;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.35);
            color: #fff;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }

        td:first-child {
            width: 30%;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .btn {
            padding: 10px 25px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: #fff;
            margin: 0 8px;
        }

        .btn-save {
            background-color: #28a745;
        }

        .btn-save:hover {
            background-color: #218838;
        }

        .btn-cancel {
            background-color: #6c757d;
        }

        .btn-cancel:hover {
            background-color: #545b62;
        }

        .msg {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="card">

        <h2>Update Profile</h2>

        <table>
            <tr>
                <td>Full Name</td>
                <td><asp:TextBox ID="txtName" runat="server" /></td>
            </tr>

            <tr>
                <td>Date of Birth</td>
                <td><asp:TextBox ID="txtDOB" runat="server" TextMode="Date" /></td>
            </tr>

            <tr>
                <td>Gender</td>
                <td>
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem Text="Male" />
                        <asp:ListItem Text="Female" />
                        <asp:ListItem Text="Others" />
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Phone</td>
                <td><asp:TextBox ID="txtPhone" runat="server" /></td>
            </tr>

            <tr>
                <td>Email</td>
                <td><asp:TextBox ID="txtEmail" runat="server" TextMode="Email" /></td>
            </tr>

            <tr>
                <td>Username</td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" ReadOnly="true" />
                </td>
            </tr>
        </table>

        <div style="text-align:center; margin-top:25px;">
            <asp:Button ID="btnSave" runat="server"
                Text="Save Changes"
                CssClass="btn btn-save"
                OnClick="btnSave_Click" />

            <asp:Button ID="btnCancel" runat="server"
                Text="Cancel"
                CssClass="btn btn-cancel"
                PostBackUrl="~/Dashboard.aspx" />
        </div>

        <asp:Label ID="lblMsg" runat="server" CssClass="msg" />

    </div>
</form>
</body>
</html>
