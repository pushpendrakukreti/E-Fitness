<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="LatestOrder.aspx.cs" Inherits="Fitness_Hub.admin.LatestOrder" %>
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
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderId" DataSourceID="SqlDataSource2" Width="100%" BorderStyle="Solid" BackColor="#CCCCCC" BorderColor="#999999" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="OrderName" HeaderText="OrderName" SortExpression="OrderName">
                                <ItemStyle Width="200" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText=" Image" ItemStyle-CssClass="text-center pds">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" ImageUrl='<%# Eval("ProductImage","../Upload/images/{0}") %>' Height="25.4%" Width="80%" CssClass="text-center" runat="server" />
                                    <asp:LinkButton ID="lnkDownload" CssClass="text-success font-bold font-18" Text="Download" CommandArgument='<%# Eval("ProductImage","../Upload/images/{0}") %>' runat="server" OnClick="DownloadFile" Width="80%"></asp:LinkButton>
                                </ItemTemplate>

                                <ItemStyle CssClass="text-center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
                                <ItemStyle Width="150" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Order Date" ItemStyle-CssClass="text-center pds" SortExpression="OrderDate">
                                <ItemTemplate>
                                    <asp:Label ID="lbldate" runat="server" Text='<%#Eval("OrderDate","{0:dd MMM yyyy}") %>' Width="150"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtdateedit" runat="server" TextMode="Date" Text='<%#Bind("OrderDate") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle CssClass="text-center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:CommandField ShowDeleteButton="True" DeleteText="Discard">
<ItemStyle Font-Size="12pt" ForeColor="Red" Width="100px"></ItemStyle>
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT OrderId, OrderDate, OrderName, Phone, ProductName, ProductImage FROM [Order] inner join Inventory on [Order].ProductId=Inventory.ProductId order by OrderDate desc" DeleteCommand="DELETE FROM [Order] WHERE [OrderId] = @OrderId" InsertCommand="INSERT INTO [Order] ([OrderName], [ProductId], [Phone]) VALUES (@OrderName, @ProductId, @Phone)" UpdateCommand="UPDATE [Order] SET [OrderName] = @OrderName, [OrderDate]=@OrderDate, [Phone] = @Phone WHERE [OrderId] = @OrderId">
                        <DeleteParameters>
                            <asp:Parameter Name="OrderId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="OrderName" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="OrderDate" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="OrderName" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="OrderDate" Type="DateTime" />
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
