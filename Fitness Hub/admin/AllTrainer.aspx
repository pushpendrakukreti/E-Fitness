<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeFile="AllTrainer.aspx.cs" Inherits="Fitness_Hub.admin.AllTrainer" %>

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
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TrainerId" DataSourceID="SqlDataSource2" Width="100%" BorderStyle="Solid" BackColor="#CCCCCC" BorderColor="#999999" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="TrainerName" HeaderText=" Name" SortExpression="TrainerName">
                                <HeaderStyle Font-Size="12pt" Width="10px" CssClass="text-center" />
                                <ItemStyle Font-Size="12pt" Width="10px" CssClass="text-center" />
                                <ControlStyle Font-Size="7pt" Width="80px" CssClass="text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TrainerPhone" HeaderText=" Phone" SortExpression="TrainerPhone">
                                <HeaderStyle Font-Size="12pt" Width="10px" CssClass="text-center" />
                                <ItemStyle Font-Size="12pt" Width="10px" CssClass="text-center" />
                                <ControlStyle Font-Size="7pt" Width="80px" CssClass="text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TrainerGender" HeaderText=" Gender" SortExpression="TrainerGender">
                                <HeaderStyle Font-Size="12pt" Width="10px" CssClass="text-center" />
                                <ItemStyle Font-Size="12pt" Width="10px" CssClass="text-center" />
                                <ControlStyle Font-Size="7pt" Width="80px" CssClass="text-center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText=" Image" ItemStyle-CssClass="text-center pds">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" ImageUrl='<%# Eval("TrainerImage","../Upload/images/{0}") %>' Height="75pt" Width="100%" CssClass="text-center" runat="server" />
                                    <asp:LinkButton ID="lnkDownload" CssClass="text-success font-bold font-18" Text="Download" CommandArgument='<%# Eval("TrainerImage","../Upload/images/{0}") %>' runat="server" OnClick="DownloadFile"></asp:LinkButton>
                                </ItemTemplate>

                                <ItemStyle CssClass="text-center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TrainerEmail" HeaderText=" Email" SortExpression="TrainerEmail">
                                <HeaderStyle Font-Size="12pt" Width="10px" CssClass="text-center" />
                                <ItemStyle Font-Size="12pt" Width="10px" CssClass="text-center" />
                                <ControlStyle Font-Size="7pt" Width="140px" CssClass="text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TrainerPassword" HeaderText=" Password" SortExpression="TrainerPassword">
                                <HeaderStyle Font-Size="12pt" Width="10px" CssClass="text-center"/>
                                <ItemStyle Font-Size="12pt" Width="10px" CssClass="text-center"/>
                                <ControlStyle Font-Size="7pt" Width="80px" CssClass="text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TrainerAddress" HeaderText=" Address" SortExpression="TrainerAddress">
                                <HeaderStyle Font-Size="12pt" Width="10px" CssClass="text-center"/>
                                <ItemStyle Font-Size="12pt" Width="10px" CssClass="text-center"/>
                                <ControlStyle Font-Size="7pt" Width="80px" CssClass="text-center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="D.O.B">
                                <ItemTemplate>
                                    <asp:Label ID="DateAddedLabel" runat="server" Text='<%#
                                                Eval("TrainerDOB", "{0:d MMM yyyy}") %>' Height="2.8%" Width="75pt" Font-Size="12pt"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" >
                            <ControlStyle Font-Size="12pt" />
                            <HeaderStyle Font-Size="12pt" />
                            <ItemStyle Font-Size="8pt" />
                            </asp:CommandField>
                        </Columns>

                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT * FROM [Trainer]" DeleteCommand="DELETE FROM [Trainer] WHERE [TrainerId] = @TrainerId" InsertCommand="INSERT INTO [Trainer] ([TrainerName], [TrainerPhone], [TrainerGender], [TrainerImage], [TrainerEmail], [TrainerPassword], [TrainerAddress], [TrainerDOB]) VALUES (@TrainerName, @TrainerPhone, @TrainerGender, @TrainerImage, @TrainerEmail, @TrainerPassword, @TrainerAddress, @TrainerDOB)" UpdateCommand="UPDATE [Trainer] SET [TrainerName] = @TrainerName, [TrainerPhone] = @TrainerPhone, [TrainerGender] = @TrainerGender, [TrainerEmail] = @TrainerEmail, [TrainerPassword] = @TrainerPassword, [TrainerAddress] = @TrainerAddress WHERE [TrainerId] = @TrainerId">
                        <DeleteParameters>
                            <asp:Parameter Name="TrainerId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TrainerName" Type="String" />
                            <asp:Parameter Name="TrainerPhone" Type="String" />
                            <asp:Parameter Name="TrainerGender" Type="String" />
                            <asp:Parameter Name="TrainerEmail" Type="String" />
                            <asp:Parameter Name="TrainerPassword" Type="String" />
                            <asp:Parameter Name="TrainerAddress" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TrainerName" Type="String" />
                            <asp:Parameter Name="TrainerPhone" Type="String" />
                            <asp:Parameter Name="TrainerGender" Type="String" />
                            <asp:Parameter Name="TrainerEmail" Type="String" />
                            <asp:Parameter Name="TrainerPassword" Type="String" />
                            <asp:Parameter Name="TrainerAddress" Type="String" />
                            <asp:Parameter Name="TrainerId" Type="Int32" />
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
