<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeFile="AllProduct.aspx.cs" Inherits="Fitness_Hub.admin.AllProduct" %>

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
                                <li class="breadcrumb-item active" aria-current="page">Add Product</li>
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
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource2" Width="100%" BorderStyle="Solid" BackColor="#CCCCCC" BorderColor="#999999" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName">
                            </asp:BoundField>
                            <asp:TemplateField HeaderText=" Image" ItemStyle-CssClass="text-center pds">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" ImageUrl='<%# Eval("ProductImage","../Upload/images/{0}") %>' Height="200" Width="300" CssClass="text-center" runat="server" />
                                    <asp:LinkButton ID="lnkDownload" CssClass="text-success font-bold font-18" Text="Download" CommandArgument='<%# Eval("ProductImage","../Upload/images/{0}") %>' runat="server" OnClick="DownloadFile" Width="80%"></asp:LinkButton>
                                </ItemTemplate>

                                <ItemStyle CssClass="text-center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ProductQuantity" HeaderText="Quantity" SortExpression="ProductQuantity">
                            </asp:BoundField>
                            <asp:BoundField DataField="ProductAmount" HeaderText="Amount" SortExpression="ProductAmount">
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="ProductStatus" HeaderText="Status" SortExpression="ProductStatus" />
                            
                            <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT ProductId, ProductName, ProductImage, ProductQuantity, ProductAmount, ProductStatus, SupplierName FROM [Inventory] inner join Supplier on Inventory.SupplierId=Supplier.SupplierId WHERE ([ProductStatus] = @ProductStatus)" DeleteCommand="DELETE FROM [Inventory] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Inventory] ([ProductName], [ProductQuantity], [ProductAmount], [ProductStatus]) VALUES (@ProductName, @ProductQuantity, @ProductAmount, @ProductStatus)" UpdateCommand="UPDATE [Inventory] SET [ProductName] = @ProductName, [ProductQuantity] = @ProductQuantity, [ProductAmount] = @ProductAmount, [ProductStatus] = @ProductStatus WHERE [ProductId] = @ProductId">
                        <DeleteParameters>
                            <asp:Parameter Name="ProductId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ProductName" Type="String" />
                            <asp:Parameter Name="ProductQuantity" Type="Int32" />
                            <asp:Parameter Name="ProductAmount" Type="Int32" />
                            <asp:Parameter Name="ProductStatus" Type="Boolean" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="false" Name="ProductStatus" Type="Boolean" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ProductName" Type="String" />
                            <asp:Parameter Name="ProductQuantity" Type="Int32" />
                            <asp:Parameter Name="ProductAmount" Type="Int32" />
                            <asp:Parameter Name="ProductStatus" Type="Boolean" />
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
