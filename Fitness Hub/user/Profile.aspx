<%@ Page Title="" Language="C#" MasterPageFile="~/user/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Fitness_Hub.user.Profile" %>

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
            .card {
                background-color: #eeeeee !important;
            }

            table {
                background-color: none !important;
                margin: 0% !important;
            }

            tbody {
                text-align: center !important;
            }

            .overflowgrid {
                overflow-x: auto !important;
            }

            .table td {
                vertical-align: middle !important;
            }
        </style>
        <div class="container-fluid">
            <div class="row overflowgrid">
                <div class="card">
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource2" Width="100%" BorderStyle="Solid" BackColor="#CCCCCC" BorderColor="#999999" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="Name" SortExpression="UserName"></asp:BoundField>
                            <asp:BoundField DataField="UserGender" HeaderText="Gender" SortExpression="UserGender"></asp:BoundField>
                            <asp:BoundField DataField="UserPhone" HeaderText="Phone" SortExpression="UserPhone"></asp:BoundField>
                            <asp:TemplateField HeaderText=" Image" ItemStyle-CssClass="text-center pds">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" ImageUrl='<%# Eval("UserImage","../Upload/images/{0}") %>' Height="300" Width="400" CssClass="text-center" runat="server" />
                                    <asp:LinkButton ID="lnkDownload" CssClass="text-success font-bold font-18" Text="Download" CommandArgument='<%# Eval("UserImage","../Upload/images/{0}") %>' runat="server" OnClick="DownloadFile" Width="80%"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle CssClass="text-center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Height">
                                <ItemTemplate>
                                    <asp:Label ID="lblHeight" runat="server" Text='<%#Eval("UserHeight") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtHeight" runat="server" Text='<%#Bind("UserHeight") %>' TextMode="SingleLine"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserWeight" HeaderText="UserWeight" SortExpression="UserWeight" />
                            <asp:TemplateField HeaderText="D.O.B">
                                <ItemTemplate>
                                    <asp:Label ID="DateAddedLabel" runat="server" Text='<%#
                                                Eval("UserDOB", "{0:d MMM yyyy}") %>'
                                        Height="2.8%" Width="105pt" Font-Size="12pt"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT * FROM [User] WHERE ([UserEmail] = @UserEmail)" DeleteCommand="DELETE FROM [User] WHERE [UserId] = @UserId" InsertCommand="INSERT INTO [User] ([UserName], [UserGender], [UserPhone], [UserHeight], [UserWeight], [UserDOB]) VALUES (@UserName, @UserGender, @UserPhone, @UserHeight, @UserWeight)" UpdateCommand="UPDATE [User] SET [UserName] = @UserName, [UserGender] = @UserGender, [UserPhone] = @UserPhone, [UserHeight] = @UserHeight, [UserWeight] = @UserWeight WHERE [UserId] = @UserId">
                        <DeleteParameters>
                            <asp:Parameter Name="UserId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="UserGender" Type="String" />
                            <asp:Parameter Name="UserPhone" Type="String" />
                            <asp:Parameter Name="UserHeight" Type="Decimal" />
                            <asp:Parameter Name="UserWeight" Type="Decimal" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="UserEmail" SessionField="id" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="UserGender" Type="String" />
                            <asp:Parameter Name="UserPhone" Type="String" />
                            <asp:Parameter Name="UserHeight" Type="Decimal" />
                            <asp:Parameter Name="UserWeight" Type="Decimal" />
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
