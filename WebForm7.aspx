<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="ElectionMgt.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style type="text/css">

        body {
            font-family: 'Times New Roman';
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0px;
        }

        .headerStyle {
            position: fixed;
            width: 120vw;
            top: -12px;
            left: -135px;
            bottom: 333px;
        }

        .newStyle1 {
            position: fixed;
        }

        .auto-style1 {
            top: 223px;
            left: 94px;
            height: 34px;
            border-width: 3px;
        }

        .newStyle2 {
            position: fixed;
            top: 190px;
            left: 94px;
            font-family: 'Times New Roman';
            font-size: 20px;
            width: 191px;
            height: 29px;
        }
        .newStyle3 {
            position: fixed;
            top: 135px;
            left: 210px;
            font-family: 'Times New Roman';
            font-size: 26px;
            font-weight: bold;
            color: purple;
        }

        .newStyle4 {
            position: fixed;
            top: 270px;
            left: 94px;
            font-family: 'Times New Roman';
            font-size: 20px;
            width: 191px;
            height: 29px;
        }


        .newStyle7 {
            position: fixed;
            Width: 380px;
            top: 303px;
            left: 94px;
            height: 34px;
            border-width: 3px;
        }

        .newStyle10 {
            position: fixed;
            top: 390px;
            left: 190px;
            width:200px;
            height: 34px;
            font-family: 'Times New Roman';
            font-size: 20px;
            font-weight: bold;
            background-color: transparent;
        }

        .newStyle10:hover {
            background-color: lightgray;
            transition: .50s;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    <asp:TextBox ID="txtPassword" runat="server" CssClass="newStyle7" TextMode="Password"></asp:TextBox >
    <asp:Image ID="Image1" runat="server" CssClass="headerStyle" ImageUrl="~/Images/Screenshot 2023-11-11 115528.png" />
</div>
<p>
    &nbsp;</p>
<p>
    <asp:TextBox ID="txtNIC" runat="server" CssClass="newStyle1 auto-style1" Width="380px"></asp:TextBox>
    <asp:Label ID="Label3" runat="server" CssClass="newStyle3" Text="Admin Sign In"></asp:Label>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label1" runat="server" CssClass="newStyle2" Text="User Name"></asp:Label>
    <asp:Label ID="Label2" runat="server" CssClass="newStyle4" Text="Password"></asp:Label>

<asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="newStyle10" OnClick="Button1_Click" />
</p>
    </form>
</body>
</html>
