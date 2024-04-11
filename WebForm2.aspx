<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ElectionMgt.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up Page</title>
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
            left: 180px;
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

        .newStyle5 {
            position: fixed;
            font-family: 'Times New Roman';
            font-size: 20px;
            width: 191px;
            height: 29px;
        }
        .auto-style2 {
            top: 350px;
            left: 94px;
        }
        .newStyle6 {
            position: fixed;
            font-family: 'Times New Roman';
            font-size: 20px;
            width: 191px;
            height: 29px;
        }
        .auto-style3 {
            top: 430px;
            left: 94px;
        }

        .newStyle7 {
            position: fixed;
            Width: 380px;
            top: 303px;
            left: 94px;
            height: 34px;
            border-width: 3px;
        }
        .newStyle8 {
            position: fixed;
            Width: 380px;
            top: 383px;
            left: 94px;
            height: 34px;
            border-width: 3px;
        }
        .newStyle9 {
            position: fixed;
            Width: 380px;
            top: 463px;
            left: 94px;
            height: 34px;
            border-width: 3px;
        }

        .newStyle10 {
            position: fixed;
            bottom: 100px;
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

        .newStyle11 {
            position: fixed;
            bottom: 150px;
            left: 190px;
            width:200px;
            height: 34px;
            font-family: 'Times New Roman';
            font-size: 20px;
            font-weight: bold;
            background-color: transparent;
        }
        
        .newStyle12 {
            position: fixed;
            bottom: 90px;
            left: 190px;
            width:200px;
            height: 34px;
            font-family: 'Times New Roman';
            font-size: 20px;
            font-weight: bold;
            background-color: transparent;
        }
        .newStyle12:hover {
            background-color: lightgray;
            transition: .50s;
        }
        

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtName" runat="server" CssClass="newStyle7" oninput="convertToUpperCase(this)"></asp:TextBox >
            <asp:TextBox ID="txtMobile" runat="server" CssClass="newStyle8" MaxLength="10"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="newStyle9"></asp:TextBox>
            <asp:Image ID="Image1" runat="server" CssClass="headerStyle" ImageUrl="~/Images/Screenshot 2023-11-11 115528.png" />
        </div>
        <p>
            &nbsp;</p>
        <p>
            <asp:TextBox ID="txtNIC" runat="server" CssClass="newStyle1 auto-style1" Width="380px" MaxLength="12"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" CssClass="newStyle3" Text="Sign Up to Register"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label1" runat="server" CssClass="newStyle2" Text="NIC No:"></asp:Label>
            <asp:Label ID="Label2" runat="server" CssClass="newStyle4" Text="Label">Name</asp:Label>

        </p>
        <asp:Label ID="Label4" runat="server" CssClass="newStyle5 auto-style2" Text="Mobile No"></asp:Label>
        <asp:Label ID="Label5" runat="server" CssClass="newStyle6 auto-style3" Text="Password"></asp:Label>
        <p>
        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="newStyle10" OnClick="btnSignUp_Click" />
        </p>
    </form>
    <script type="text/javascript">
    function convertToUpperCase(element) {
        element.value = element.value.toUpperCase();
    }
    </script>
</body>
</html>
