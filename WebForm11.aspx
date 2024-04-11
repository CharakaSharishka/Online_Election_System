<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm11.aspx.cs" Inherits="ElectionMgt.WebForm11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vote Results</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            top: 10px;
            max-width: 800px;
            margin: 150px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .headerStyle {
            position: fixed;
            width: 120vw;
            top: -12px;
            left: -135px;
            bottom: 333px;

        }

        h1 {
            color: #333;
            text-align: center;
            font-family: 'Times New Roman';
            font-size: 26px;
            font-weight: bold;
            color: purple;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;

        }

        .winnerlabel {
            position: absolute;
            top: 95px;
            margin-left: 160px;
            text-align: center;
            font-family: 'Times New Roman';
            font-weight: bold;
            font-size: 20px;
            color: green;
        }


        .error-message {
            color: red;
            margin-bottom: 15px;
            text-align: center;
        }



        .gridview {
            margin-top: 80px;
            width: 100%;
            border-collapse: collapse;
        }

        .grid-view th,
        .grid-view td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .grid-view th {
            background-color: #4caf50;
            color: white;
        }

        .piechar {
            margin-top: 20px;
            center;
            text-align: center;
        }

        .btnImg {
            position: absolute;
            top: -137px;
            right: -200px;
            height: 50px;
            width: 67px;
            z-index: 1;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>
                Vote Results</h1>

                <asp:ImageButton ID="ImageButton1" runat="server" CssClass="btnImg" ImageUrl="~/Images/home_button.jpg" OnClick="ImageButton1_Click" Height="50px" Width="67px" />

            <asp:Image ID="Image1" runat="server" CssClass="headerStyle" ImageUrl="~/Images/Screenshot 2023-11-11 115528.png" />

            <!-- GridView for tabular representation of results -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="Position" HeaderText="Position" />
                    <asp:BoundField DataField="UserName" HeaderText="Candidate" />
                    <asp:BoundField DataField="VoteCount" HeaderText="Votes" />
                    <asp:BoundField DataField="VotePercentage" HeaderText="Percentage" DataFormatString="{0:F2}%" />
                </Columns>
            </asp:GridView>


            <!-- Winner Label -->

            <!-- Pie Chart for visualization of results -->
            <asp:Label ID="lblWinner" runat="server" CssClass="winnerlabel"></asp:Label>

            <asp:Chart ID="Chart1" runat="server" Width="600" Height="350" CssClass="piechar">
                <Series>
                    <asp:Series Name="VoteSeries" ChartType="Pie">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

        </div>
    </form>
</body>
</html>