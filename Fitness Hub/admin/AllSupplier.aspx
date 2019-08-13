<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeFile="AllSupplier.aspx.cs" Inherits="Fitness_Hub.admin.AllSupplier" %>
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
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SupplierId" DataSourceID="SqlDataSource2" Width="100%" BorderStyle="Solid" BackColor="#CCCCCC" BorderColor="#999999" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName">
                                <ControlStyle Width="120" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SupplierAddress" HeaderText="Address" SortExpression="SupplierAddress">
                                <ControlStyle Width="120" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SupplierPhone" HeaderText="Phone" SortExpression="SupplierPhone">
                                <ControlStyle Width="120" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SupplierEmail" HeaderText="Email" SortExpression="SupplierEmail">
                                <ControlStyle Width="150" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SupplierPassword" HeaderText="Password" SortExpression="SupplierPassword">
                                <ControlStyle Width="120" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="D.O.B">
                                <ItemTemplate>
                                    <asp:Label ID="DOB" runat="server" Text='<%#
                                                Eval("SupplierDOB", "{0:d MMM yyyy}") %>' Height="2.8%" Width="65pt" Font-Size="9pt"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT * FROM [Supplier]" DeleteCommand="DELETE FROM [Supplier] WHERE [SupplierId] = @SupplierId" InsertCommand="INSERT INTO [Supplier] ([SupplierName], [SupplierAddress], [SupplierPhone], [SupplierEmail], [SupplierPassword], [SupplierDOB]) VALUES (@SupplierName, @SupplierAddress, @SupplierPhone, @SupplierEmail, @SupplierPassword, @SupplierDOB)" UpdateCommand="UPDATE [Supplier] SET [SupplierName] = @SupplierName, [SupplierAddress] = @SupplierAddress, [SupplierPhone] = @SupplierPhone, [SupplierEmail] = @SupplierEmail, [SupplierPassword] = @SupplierPassword WHERE [SupplierId] = @SupplierId">
                        <DeleteParameters>
                            <asp:Parameter Name="SupplierId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SupplierName" Type="String" />
                            <asp:Parameter Name="SupplierAddress" Type="String" />
                            <asp:Parameter Name="SupplierPhone" Type="String" />
                            <asp:Parameter Name="SupplierEmail" Type="String" />
                            <asp:Parameter Name="SupplierPassword" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SupplierName" Type="String" />
                            <asp:Parameter Name="SupplierAddress" Type="String" />
                            <asp:Parameter Name="SupplierPhone" Type="String" />
                            <asp:Parameter Name="SupplierEmail" Type="String" />
                            <asp:Parameter Name="SupplierPassword" Type="String" />
                            <asp:Parameter Name="SupplierId" Type="Int32" />
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
