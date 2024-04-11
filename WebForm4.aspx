<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="ElectionMgt.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Page</title>
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


        .newStyle9 {
            border: 3px solid blue;
            position: fixed;
            z-index: auto;
            bottom: 280px;
            left: 450px;
            width: 270px;
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
            width: 270px;
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



        .newStyle12 {
            position: fixed;
            z-index: auto;
            top: 20px;
            height: 50px;
            width: 67px;
            right: 270px;
        }



    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="newStyle12" Height="50px" ImageUrl="~/Images/home_button.jpg" Width="67px" OnClick="ImageButton1_Click"  />
            <asp:Image ID="Image1" runat="server" CssClass="newStyle8" ImageUrl="~/Images/bimage.jpg" />
            <asp:Image ID="Image2" runat="server" CssClass="newStyle4" ImageUrl="~/Images/symbole.png" />
            <asp:Label ID="Label1" runat="server" CssClass="newStyle6" Text="Election Commission"></asp:Label>
            <asp:Button ID="Button2" runat="server" CssClass="newStyle9" Text="Candidate Register" OnClick="Button2_Click"/>
            <asp:Button ID="Button3" runat="server" Text="Go to Vote" CssClass="newStyle10" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" CssClass="newStyle11" Text="Results" OnClick="Button4_Click" />

        </div>
    </form>
</body>
</html>
