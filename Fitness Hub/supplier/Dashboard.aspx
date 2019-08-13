<%@ Page Title="" Language="C#" MasterPageFile="~/supplier/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Fitness_Hub.supplier.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h2 class="page-title">Dashboard</h2>
                    <div class="ml-auto text-right">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Library</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <!-- Column -->
                <div class="col-md-6 col-lg-4 col-xlg-3">
                    <a href="#">
                        <div class="card card-hover">
                            <div class="box bg-danger text-center">
                                <h1 class="font-light text-white"><i class="mdi mdi-account"></i></h1>
                                <h3 class="font-bold text-white">Total Users</h3>
                                <h3 class="text-white">
                                    <asp:Label ID="lblUser" runat="server"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </a>
                </div>
                <!-- Column -->
                <div class="col-md-6 col-lg-4 col-xlg-3">
                    <a href="#">
                        <div class="card card-hover">
                            <div class="box bg-success text-center">
                                <h1 class="font-light text-white"><i class="mdi mdi-factory"></i></h1>
                                <h3 class="font-bold text-white">Total Suppliers</h3>
                                <h3 class="text-white">
                                    <asp:Label ID="lblSupplier" runat="server"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </a>
                </div>
                <!-- Column -->
                <div class="col-md-6 col-lg-4 col-xlg-3">
                    <a href="#">
                        <div class="card card-hover">
                            <div class="box bg-info text-center">
                                <h1 class="font-light text-white"><i class="mdi mdi-account-card-details"></i></h1>
                                <h3 class="font-bold text-white">Total Trainers</h3>
                                <h3 class="text-white">
                                    <asp:Label ID="lblTrainer" runat="server"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 col-lg-4 col-xlg-3">
                    <a href="AllProducts.aspx">
                        <div class="card card-hover">
                            <div class="box bg-warning text-center">
                                <h1 class="font-light text-white"><i class="mdi mdi-cart"></i></h1>
                                <h3 class="font-bold text-white">Total Products</h3>
                                <h3 class="text-white">
                                    <asp:Label ID="lblProduct" runat="server"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 col-lg-4 col-xlg-3">
                    <a href="#">
                        <div class="card card-hover">
                            <div class="box bg-secondary text-center">
                                <h1 class="font-light text-white"><i class="mdi mdi-basket"></i></h1>
                                <h3 class="font-bold text-white">Total Orders</h3>
                                <h3 class="text-white">
                                    <asp:Label ID="lblOrder" runat="server"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 col-lg-4 col-xlg-3">
                    <a href="#">
                        <div class="card card-hover">
                            <div class="box bg-primary text-center">
                                <h1 class="font-light text-white"><i class="mdi mdi-dumbbell"></i></h1>
                                <h3 class="font-bold text-white">Total Appointments</h3>
                                <h3 class="text-white">
                                    <asp:Label ID="lblAppointment" runat="server"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="select * from [User]"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="select * from Inventory"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="select * from Trainer"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="select * from Supplier"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="select * from [Order]"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="select * from Appointment"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
