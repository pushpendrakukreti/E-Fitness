<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Fitness_Hub.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap js-fullheight" style="background-image: url('images/bg_2.jpg'); opacity: 0.7;">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
                <div class="col-md-12 ftco-animate text-center pt-5" style="padding-top:100px;">
                    <h1 class="text-white font-weight-bold mb-3" style="-webkit-text-stroke: 2px #fd0054; font-size:55pt;">Login Form</h1>
                    <asp:TextBox ID="txtemail" runat="server" CssClass="col-md-12 mt-5 mb-3" TextMode="Email" Width="250" placeholder="Enter Email Id" Font-Size="Larger"></asp:TextBox>
                    <div class="col-12"></div>
                    <asp:TextBox ID="txtpass" runat="server" CssClass="col-md-12" TextMode="Password" Width="250" placeholder="Enter Password" Font-Size="Larger"></asp:TextBox>
                </div>
                <div class="col-md-12 ftco-animate text-center" style="margin-top:-10%;">
                        <asp:Button ID="btnPage" runat="server" CssClass="btn btn-success mr-5" Text="Normal Login" Width="200" Font-Size="Larger" OnClick="btnPage_Click"/>
                        <asp:Button ID="btnpanel" runat="server" CssClass="btn btn-danger" Text="Panel Login" Width="200" Font-Size="Larger" OnClick="btnpanel_Click"/>
                    <div class="col-md-12"></div>
                    <asp:Label ID="lblmsg" runat="server" Text="" Font-Size="30px" Font-Bold="true"></asp:Label>
                </div>
            </div>
        </div>
    </section>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
