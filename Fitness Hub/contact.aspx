<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Fitness_Hub.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <section class="hero-wrap js-fullheight" style="background-image: url('images/bg_2.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <h1 class="mb-3 bread">Contact Us</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Home</a></span> <span>Contact</span></p>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section contact-section">
        <div class="container">
            <div class="row block-9">
                <div class="col-md-4 contact-info ftco-animate bg-light p-4">
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <h2 class="h4">Contact Information</h2>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Address:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Website:</span> <a href="#">yoursite.com</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-6 ftco-animate">
                    <div class="contact-form">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group pl-3" style="border:1px solid #fd0054;">
                                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group pl-3" style="border:1px solid #fd0054;">
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Your Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group pl-3" style="border:1px solid #fd0054;">
                            <asp:TextBox ID="txtsubject" runat="server" CssClass="form-control" placeholder="Your Subject"></asp:TextBox>
                        </div>
                        <div class="form-group pl-3 pt-2" style="border:1px solid #fd0054;">
                            <asp:TextBox ID="txtmsg" Columns="30" Rows="7" runat="server" CssClass="form-control" placeholder="Message" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="form-group text-center">
                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary py-3 px-5" Text="Send Message" OnClick="btnsubmit_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div id="map" class="map"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
