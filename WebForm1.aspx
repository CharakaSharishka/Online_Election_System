<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ElectionMgt.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page</title>
    <style type="text/css">

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0px;
        }


        .newStyle4 {
            position: fixed;
            z-index: auto;
            top: 30px;
            left: 46vw;
            height: 155px;
            width: 115px;
        }

        .newStyle6 {
            font-family: "Times New Roman", Times, serif;
            font-size: 29px;
            position: fixed;
            font-weight: bold;
            color: #800080;
            top: 240px;
            left: 41.3vw;
        }
        .newStyle7 {
            font-family: "Times New Roman", Times, serif;
            font-size: 29px;
            font-weight: bold;
            color: white;

            position: fixed;
            top: 50px;
            right: 50px;
            height: 63px;
            width: 118px;
            background:none;

            border-style: solid;
            border-color: white;
            border-width: 3px;
            border-radius: 5px;

        }

        .newStyle7:hover {
                background-color: white;
                color: black;
                transition: .50s;
        }

        .newStyle8 {
            width: 100vw;
            height: 100vh;
            object-fit: cover;
        }
        .newStyle9 {
            border: 3px solid blue;
            position: fixed;
            z-index: auto;
            bottom: 280px;
            left: 450px;
            width: 250px;
            background-color: transparent;

            font-family: 'Times New Roman', Times, serif;
            font-size: 30px;
            font-weight: bold;
            color: black;

            border-radius: 5px;
        }

        .newStyle9:hover {
                background-color: blue;
                color: white;
                transition: .50s;
        }


        .newStyle10 {
            border: 3px solid blue;
            position: fixed;
            z-index: auto;
            bottom: 280px;
            right: 450px;
            width: 250px;
            background-color: transparent;

            font-family: 'Times New Roman', Times, serif;
            font-size: 30px;
            font-weight: bold;
            color: black;

            border-radius: 5px;
        }

        .newStyle10:hover {
                background-color: blue;
                color: white;
                transition: .50s;
        }

        .newStyle11 {
            border: 3px solid red;
            position: fixed;
            z-index: auto;
            bottom: 200px;
            left: 41.3vw;
            width: 250px;
            background-color: transparent;

            font-family: 'Times New Roman', Times, serif;
            font-size: 30px;
            font-weight: bold;
            color: black;

            border-radius: 5px;
        }

        .newStyle11:hover {
            background-color: red;
            color: white;
            transition: .50s;
        }



    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Image1" runat="server" CssClass="newStyle8" ImageUrl="~/Images/bimage.jpg" />
            <asp:Image ID="Image2" runat="server" CssClass="newStyle4" ImageUrl="~/Images/symbole.png" />
            <asp:Label ID="Label1" runat="server" CssClass="newStyle6" Text="Election Commission"></asp:Label>
            <asp:Button ID="Button1" runat="server" CssClass="newStyle7" Text="Admin" OnClick="Button1_Click1" />
            <asp:Button ID="Button2" runat="server" CssClass="newStyle9" Text="Sign Up" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="User Login" CssClass="newStyle10" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" CssClass="newStyle11" Text="Results" OnClick="Button4_Click" />

        </div>
    </form>
</body>
</html>
