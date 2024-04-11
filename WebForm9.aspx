<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs" Inherits="ElectionMgt.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Approve Users</title>
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
            top: 135px;
            left: 180px;
            font-family: 'Times New Roman';
            font-size: 26px;
            font-weight: bold;
            color: purple;
        }
        .newStyle2 {
            position: fixed;
            top: 223px;
            left: 94px;
            height: 50px;
            width: 600px;
            border-width: 3px;
        }
        .newStyle1 {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Image1" runat="server" CssClass="headerStyle" ImageUrl="~/Images/Screenshot 2023-11-11 115528.png" />
            <h2 CssClass="newStyle1" class="newStyle1">Users Awaiting Approval</h2>
            <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewUsers_RowCommand" DataKeyNames="nicNo" CssClass="newStyle2">
                <Columns>
                    <asp:BoundField DataField="nicNo" HeaderText="NIC No" SortExpression="nicNo" />
                    <asp:BoundField DataField="userName" HeaderText="User Name" SortExpression="userName" />
                    <asp:BoundField DataField="mobileNo" HeaderText="Mobile No" SortExpression="mobileNo" />
                    <asp:ButtonField ButtonType="Button" CommandName="Approve" Text="Approve" HeaderText="Approve" />
                    <asp:ButtonField ButtonType="Button" CommandName="Decline" Text="Decline" HeaderText="Decline"/>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
