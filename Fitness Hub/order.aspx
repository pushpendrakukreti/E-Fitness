<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Fitness_Hub.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #ContentPlaceHolder1_genderDDlist > tbody > tr > td {
            font-size: 11pt;
            line-height: 10pt;
            width: 50pt !important;
            padding-left: 2% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper pt-5" style="background:linear-gradient(141deg, #9fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);">
        <div class="page-breadcrumb pt-5">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title"></h4>
                    <div class="ml-auto text-right">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Order</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="card">
                        <div class="form-horizontal">
                            <div class="card-body text-center">
                                <h3 class="card-title">Add Informations</h3>
                                <br />
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-5 text-right control-label col-form-label" style="font-size:22pt;">Order Name</label>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="txtprname" runat="server" CssClass="form-control pl-3" placeholder="Order Name Here" Width="350"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-5 text-right control-label col-form-label" style="font-size:22pt;">Your Number</label>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="txtnum" runat="server" CssClass="form-control pl-3" placeholder="User Number Here" Width="350" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-5 text-right control-label col-form-label" style="font-size:22pt;">Order Date</label>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="txtdate" runat="server" CssClass="form-control pl-3" placeholder="Order Date Here" Width="350" Enabled="false"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-5 text-right control-label col-form-label" style="font-size:22pt;">Select Product</label>
                                    <div class="col-sm-7">
                                        <asp:DropDownList ID="ddsup" runat="server" CssClass="form-control" Width="350">
                                        </asp:DropDownList>
                                        </div>
                                </div>
                            </div>
                            <div class="">
                                <div class="card-body text-center">
                                    <asp:Button ID="btnsub" runat="server" Text="Submit" CssClass="btn btn-primary" Font-Size="Larger" Width="150" OnClick="btnsub_Click"/>
                                    <br />
                                    <asp:Label ID="lblmsg" runat="server" Text="" Font-Size="Large"></asp:Label>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <br /><br /><br /><br /><br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>