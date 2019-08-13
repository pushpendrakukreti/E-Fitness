<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="coaches.aspx.cs" Inherits="Fitness_Hub.coaches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media only screen and (max-width:700px){
            .col-lg-3>.coach>.img{
                width:80% !important;
            }
        }
        b{
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
                    <h1 class="mb-3 bread">Gym Trainer</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Home</a></span> <span>Coaches</span></p>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section bg-light">
        <div class="container-fluid">
            <div class="row justify-content-center mb-5">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <h3 class="subheading">Shape Your Body</h3>
                    <h2 class="mb-1">Our Coaches</h2>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="rpCoachesList" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 d-flex text-center">
                            <div class="coach align-items-stretch">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("TrainerImage","../Upload/images/{0}") %>' CssClass="pl-3 pr-3 img"/>
                                <div class="text bg-white p-4 ftco-animate">
                                    <span class="subheading">Trainer</span>
                                    <h3><a href="#"><%#Eval("TrainerName") %></a></h3>
                                    <h2 style="font-size:smaller">Date of Birth: <%#Eval("TrainerDOB","{0:d}") %></h2>
                                    <h4 style="font-size:medium;"><b>Contact:</b><%#Eval("TrainerPhone") %></h4>
                                    <p>Email ID: <%#Eval("TrainerEmail") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT * FROM [Trainer]"></asp:SqlDataSource>
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
                                <asp:Button ID="appointment" runat="server" CssClass="btn btn-primary py-3 px-4" Text="Book" OnClick="appointment_Click" />
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
