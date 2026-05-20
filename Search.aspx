<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs"
    Inherits="myreq.Search" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Search</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: #1b2a47;  /* Dark shaded blue */
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
        }

        .card {
            background: #0f1a33;  /* Dark shaded blue */
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.35);
        }

        h2 {
            margin-top: 0;
            margin-bottom: 25px;
            color: #fff;   /* white text */
            font-weight: 600;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px 30px;
            margin-bottom: 30px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 6px;
            font-size: 14px;
            color: #ddd;   /* light grey */
        }

        .form-group input {
            padding: 10px 12px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .button-row {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
        }

        .btn {
            padding: 10px 22px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            color: #fff;
        }

        .btn-search {
            background-color: #007bff;
        }

        .btn-home {
            background-color: #28a745;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #3b6cb7;
            color: #fff;
            padding: 12px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            color: #fff;   /* white text */
        }
    </style>
</head>

<body>
<form runat="server">
    <div class="container">
        <div class="card">

            <h2>User Search</h2>

            <div class="form-grid">
                <div class="form-group">
                    <label>Search Using Name</label>
                    <asp:TextBox ID="txtName" runat="server" />
                </div>

                <div class="form-group">
                    <label>Search Using Date of Birth</label>
                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" />
                </div>

                <div class="form-group">
                    <label>Search Using Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" />
                </div>

                <div class="form-group">
                    <label>Search Using Mobile No</label>
                    <asp:TextBox ID="txtPhone" runat="server" />
                </div>
            </div>

            <div class="button-row">
                <asp:Button ID="btnSearch" runat="server"
                    Text="Search"
                    CssClass="btn btn-search"
                    OnClick="btnSearch_Click" />

                <asp:Button ID="btnHome" runat="server"
                    Text="Home"
                    CssClass="btn btn-home"
                    OnClick="btnHome_Click" />
            </div>

            <!-- GridView WITH RegNo + Red Bold No Records Message -->
            <asp:GridView ID="gvUsers" runat="server"
                AutoGenerateColumns="false"
                ShowHeaderWhenEmpty="true">

                <Columns>
                    <asp:BoundField DataField="RegNo" HeaderText="Registration Number" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="Phone" HeaderText="Mobile Number" />
                    <asp:BoundField DataField="Email" HeaderText="E-mail" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                </Columns>

                <EmptyDataTemplate>
                    <div style="color:red; font-weight:bold; text-align:center; padding:15px;">
                        No Records Found
                    </div>
                </EmptyDataTemplate>

            </asp:GridView>

        </div>
    </div>
</form>
</body>
</html>
