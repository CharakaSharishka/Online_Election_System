<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="ElectionMgt.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Votting Form</title>
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
            width: 300px;
        }

        .auto-style1 {
            top: 190px;
            left: 285px;
            height: 34px;
            border-width: 3px;
        }

        .newStyle3 {
            position: fixed;
            top: 135px;
            left: 250px;
            font-family: 'Times New Roman';
            font-size: 26px;
            font-weight: bold;
            color: purple;
        }

        .lblSelectParty {
            position: fixed;
            top: 190px;
            left: 94px;
            font-family: 'Times New Roman';
            font-size: 20px;
            width: 191px;
            height: 29px;
        }

        .TxtNIC {
            position: fixed;
            Width: 380px;
            top: 190px;
            left: 300px;
            height: 34px;
            border-width: 3px;

        }

        .BtnCheckNIC {
            position: fixed;
            Width: 100px;
            top: 190px;
            left: 730px;
            height: 40px;
            border-width: 3px;
        }

        .Label2 {
            position: fixed;
            Width: 400px;
            top: 230px;
            left: 300px;
            height: 34px;
            font-size: 22px;
            font-weight: bold;

        }

        .LblParty {
            position: fixed;
            top: 270px;
            left: 94px;
            font-family: 'Times New Roman';
            font-size: 20px;
            width: 191px;
            height: 29px;

        }

        .ddlParty {
            position: fixed;
            Width: 390px;
            top: 270px;
            left: 300px;
            height: 40px;
            border-width: 3px;
            font-size: 22px;

        }

        .LblCandidate {
            position: fixed;
            top: 280px;
            left: 94px;
            font-family: 'Times New Roman';
            font-size: 22px;
            width: 191px;
            height: 29px;

        }

        .ddlCandi {
            position: fixed;
            Width: 300px;
            top: 280px;
            left: 288px;
            height: 40px;
            border-width: 3px;
            font-size: 18px;

        }

        .LblCandidateName {
            position: fixed;
            top: 370px;
            left: 94px;
            font-family: 'Times New Roman';
            font-size: 22px;
            width: 191px;
            height: 29px;

        }

        
        .TxtCandidateName {
            position: fixed;
            Width: 293px;
            top: 370px;
            left: 290px;
            height: 34px;
            border-width: 3px;
            font-size: 22px;

        }

        .lblNIC {
            position: fixed;
            top: 450px;
            left: 94px;
            font-family: 'Times New Roman';
            font-size: 22px;
            width: 191px;
            height: 29px;

        }

        .txtNIC {
            position: fixed;
            Width: 293px;
            top: 450px;
            left: 290px;
            height: 34px;
            border-width: 3px;
            font-size: 22px;

        }

        .btnCheckNIC {
            position: fixed;
            top: 453px;
            left: 600px;
            width:120px;
            height: 34px;
            font-family: 'Times New Roman';
            font-size: 20px;
            font-weight: bold;
            background-color: transparent;
        }

        .lblNICName {
            position: fixed;
            top: 495px;
            left: 298px;
            font-family: 'Times New Roman';
            font-size: 22px;
            width: 191px;
            height: 29px;

        }

        .lblError {
            position: fixed;
            top: 490px;
            left: 600px;
            font-family: 'Times New Roman';
            font-size: 20px;
            width: 220px;
            height: 29px;
            color: red;
        }

        .btnSubmitVote {
            position: fixed;
            top: 560px;
            left: 350px;
            width:200px;
            height: 34px;
            font-family: 'Times New Roman';
            font-size: 20px;
            font-weight: bold;
            background-color: transparent;
        }
        .btnSubmitVote:hover {
            background-color: lightgray;
            transition: .50s;
        }

        .btnImg {
            position: absolute;
            top: -137px;
            left: 962px;
            height: 50px;
            width: 67px;
            z-index: 1;
        }




        .newStyle4 {
            position: absolute;
            z-index: 1;
            right: 230px;
            top: 20px;
        }




    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="newStyle4" Height="50px" ImageUrl="~/Images/home_button.jpg" Width="67px" OnClick="ImageButton1_Click" />
            <asp:Image ID="Image1" runat="server" CssClass="headerStyle" ImageUrl="~/Images/Screenshot 2023-11-11 115528.png" />
            <asp:Label ID="Label3" runat="server" CssClass="newStyle3" Text="Vote for your candidate"></asp:Label>
            
            <div>
                <asp:Label ID="lblSelectParty" runat="server" CssClass="lblSelectParty" Text="Select Party:"></asp:Label>
                <asp:DropDownList ID="ddlParty" runat="server" CssClass="newStyle1 auto-style1" AutoPostBack="True" OnSelectedIndexChanged="ddlParty_SelectedIndexChanged"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ElectionConnectionString %>" ProviderName="<%$ ConnectionStrings:ElectionConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [candiParty] FROM [Candidates]"></asp:SqlDataSource>
            </div>

            <div>
                <asp:label ID="lblSelectCandi" runat="server" CssClass="LblCandidate" Text="Select Candidate:"></asp:label>
                <asp:DropDownList ID="ddlCandi" runat="server" CssClass="ddlCandi" AutoPostBack="True" OnSelectedIndexChanged="ddlCandi_SelectedIndexChanged"></asp:DropDownList>
            </div>
            
            <div>
                <asp:label ID="LblCandidateName" runat="server" CssClass="LblCandidateName" Text="Candidate Name:"></asp:label>
                <asp:TextBox ID="txtCandidateName" runat="server" CssClass="TxtCandidateName" ReadOnly="true"></asp:TextBox>
            </div>
            
            <div>
                <asp:label ID="lblNIC" runat="server" CssClass="lblNIC" Text="Enter NIC:"></asp:label>
                <asp:TextBox ID="txtNIC" runat="server" CssClass="txtNIC"></asp:TextBox>
                <asp:Button ID="BtnCheckNIC" runat="server" CssClass="btnCheckNIC" Text="Check NIC" OnClick="BtnCheckNIC_Click1" />
            </div>

            <div>
                <asp:Label ID="lblName" runat="server" CssClass="lblNICName" Text=""></asp:Label>
            </div>

            <div>
                <asp:Label ID="lblError" runat="server" CssClass="lblError" Text="" ForeColor="Red"></asp:Label>
            </div>
            
            <div>
                <asp:Button ID="BtnVote" runat="server" CssClass="btnSubmitVote" Text="Vote" OnClick="BtnVote_Click" />
            </div>
        </div>
    </form>
</body>
</html>
