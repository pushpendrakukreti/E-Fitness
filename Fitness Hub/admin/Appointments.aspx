<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="Fitness_Hub.admin.Appointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Form Basic</h4>
                    <div class="ml-auto text-right">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Add Trainer</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .card{
                background-color:#eeeeee !important;
            }
            table{
                background-color:none !important;
                margin:0% !important;
            }
            tbody{
                text-align:center !important;
            }
            .overflowgrid {
                overflow-x: auto !important;
            }
            .table td{
                vertical-align: middle !important;
            }
        </style>
        <div class="container-fluid">
            <div class="row overflowgrid">
                <div class="card">
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AppointmentId" DataSourceID="SqlDataSource2" Width="100%" BorderStyle="Solid" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName">
                            </asp:BoundField>
                            <asp:BoundField DataField="Lname" HeaderText="Lname" SortExpression="Lname">
                            </asp:BoundField>
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd MMM yyyy}">
                                <ItemStyle Width="250" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time">
                                <ItemStyle Width="150" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone">
                            </asp:BoundField>
                            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                        </Columns>

                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT * FROM [Appointment] ORDER BY [Date]" DeleteCommand="DELETE FROM [Appointment] WHERE [AppointmentId] = @AppointmentId" InsertCommand="INSERT INTO [Appointment] ([FName], [Lname], [Date], [Time], [Phone], [Message]) VALUES (@FName, @Lname, @Date, @Time, @Phone, @Message)" UpdateCommand="UPDATE [Appointment] SET [FName] = @FName, [Lname] = @Lname, [Date] = @Date, [Time] = @Time, [Phone] = @Phone, [Message] = @Message WHERE [AppointmentId] = @AppointmentId">
                        <DeleteParameters>
                            <asp:Parameter Name="AppointmentId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="FName" Type="String" />
                            <asp:Parameter Name="Lname" Type="String" />
                            <asp:Parameter Name="Date" DbType="Date" />
                            <asp:Parameter Name="Time" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="Message" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FName" Type="String" />
                            <asp:Parameter Name="Lname" Type="String" />
                            <asp:Parameter Name="Date" DbType="Date" />
                            <asp:Parameter Name="Time" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="Message" Type="String" />
                            <asp:Parameter Name="AppointmentId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>

    <script src="../../assets/libs/jquery/dist/jquery.min.js"></script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
