<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="ElectionMgt.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Candidate Register Form</title>
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
            font-size: 20px;
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
            font-weight: bold;
            color: red;
            width: 300px;
            height: 29px;
        }
        .auto-style3 {
            top: 450px;
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
            background-color: lightgrey;
        }
        .newStyle9 {
            position: fixed;
            Width: 380px;
            top: 463px;
            left: 94px;
            height: 34px;
            border-width: 3px;
            background-color: lightgrey;
        }

        .newStyle10 {
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
        .newStyle10:hover {
            background-color: lightgray;
            transition: .50s;
        }


        .newStyle11 {
            position: fixed;
            Width: 100px;
            top: 303px;
            left: 500px;
            height: 40px;
            border-width: 3px;
            font-family: 'Times New Roman';
            font-size: 20px;
            font-weight: bold;
        }

        .newStyle11:hover {
            border-color: aqua;
            background-color: lightgreen;
            transition: .50s;
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnCheck" runat="server" CssClass="newStyle11" Text="Check" OnClick="Button2_Click" />
            <asp:DropDownList ID="ddlParty" runat="server" CssClass="newStyle1 auto-style1" Width="387px">
                <asp:ListItem Text="Select an option" Value="" style="color: black;" />
                <asp:ListItem Text="SL Freedom Party" Value="SL Freedom Party" />
                <asp:ListItem Text="UNP" Value="UNP" />
                <asp:ListItem Text="JVP" Value="JVP" />
                <asp:ListItem Text="NPP" Value="NPP" />
                <asp:ListItem Text="PIBT" Value="PIBT" />
            </asp:DropDownList>
            <asp:TextBox ID="txtNIC" runat="server" CssClass="newStyle7"></asp:TextBox >
            <asp:TextBox ID="txtName" runat="server" CssClass="newStyle8" ReadOnly="True"></asp:TextBox>
            <asp:Image ID="Image1" runat="server" CssClass="headerStyle" ImageUrl="~/Images/Screenshot 2023-11-11 115528.png" />
        </div>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label3" runat="server" CssClass="newStyle3" Text="Register as Candidates"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label1" runat="server" CssClass="newStyle2" Text="Select Candidate Party:"></asp:Label>
            <asp:Label ID="Label2" runat="server" CssClass="newStyle4" Text="Label">Enter your NIC</asp:Label>

        </p>
        <asp:Label ID="Label4" runat="server" CssClass="newStyle5 auto-style2" Text="Name"></asp:Label>
        <asp:Label ID="lblCandiNo" runat="server" CssClass="newStyle6 auto-style3"></asp:Label>
        <p>
        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="newStyle10" OnClick="btnRegister_Click1" />
        </p>
    </form>
</body>
</html>
