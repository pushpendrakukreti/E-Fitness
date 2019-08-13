<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="Fitness_Hub.program" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media only screen and (min-width:800px) {
            #Image1 {
                margin-left: 0% !important;
                padding-left: 0% !important;
            }
        }
        .text>p>b{
            color:#fd0054 !important;
            font-weight:normal !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="hero-wrap js-fullheight" style="background-image: url('images/bg_2.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <h1 class="mb-1 bread">Our Products</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Home</a></span> <span>Products</span></p>
                </div>
            </div>
        </div>
    </section>


    <section class="ftco-section">
        <div class="container-fluid">
            <div class="row">
                <asp:Repeater ID="rpProductList" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6 col-lg-4 text-center">
                            <div class="package-program ftco-animate">
                                <a href="order.aspx" class="img d-flex justify-content-center align-items-center">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImage","../Upload/images/{0}") %>' CssClass="text-center primary-image" Width="100%" Height="350"/>
                                    <span style="position:absolute; margin-left:0%;">Order Now</span>
                                </a>
                                <div class="text mt-3">
                                    <h2><a href="#"><%#Eval("ProductName") %></a></h2>
                                    <h4>PRICE: <%#Eval("ProductAmount") %></h4>
                                    <span>(ID: <%#Eval("ProductId") %>)</span>
                                    <p style="font-size:large;">Our selling partner <b><%#Eval("SupplierName") %></b> has supplied us <br />
                                        <b><%#Eval("ProductName") %></b> to provide users a good quality of proteins/ natural supplements needed.</p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT ProductId, ProductName, ProductImage, ProductAmount, ProductQuantity, SupplierName FROM [Inventory] inner join [Supplier] on Inventory.SupplierId=Supplier.SupplierId WHERE ([ProductStatus] = @ProductStatus)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="ProductStatus" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
            <div class="row mt-5">
                <div class="col text-center">
                    <div class="block-27">
                        <ul>
                            <li><a href="#">&lt;</a></li>
                            <li class="active"><span>1</span></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&gt;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-appointment">
        <div class="overlay"></div>
        <div class="container-wrap">
            <div class="row no-gutters d-md-flex align-items-center">
                <div class="col-md-6 d-flex align-self-stretch img" style="background-image: url(images/about-3.jpg);">
                </div>
                <div class="col-md-6 appointment ftco-animate">
                    <h3 class="mb-3">Book a Appointment</h3>
                    <div class="appointment-form">
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:TextBox ID="txtfname" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:TextBox ID="txtlname" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <div class="input-wrap">
                                    <div class="icon"><span class="ion-md-calendar"></span></div>
                                    <asp:TextBox ID="txtdate" runat="server" CssClass="form-control" placeholder="Date" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group ml-md-4">
                                <div class="input-wrap">
                                    <div class="icon"><span class="ion-ios-clock"></span></div>
                                    <asp:TextBox ID="txttime" runat="server" CssClass="form-control" placeholder="Time" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:TextBox ID="txtphone" runat="server" CssClass="form-control" placeholder="Phone" TextMode="Phone"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:TextBox ID="txtmsg" Columns="30" Rows="2" runat="server" CssClass="form-control" placeholder="Message" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:Button ID="appointment" runat="server" CssClass="btn btn-primary py-3 px-4" Text="Book" OnClick="appointment_Click1" />
                                <br />
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
