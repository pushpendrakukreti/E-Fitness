<%@ Page Title="" Language="C#" MasterPageFile="~/user/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Fitness_Hub.user.ChangePassword" %>
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
                                    <label for="lname" class="col-sm-4 text-right control-label col-form-label">Enter User-Id</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtuser" runat="server" CssClass="form-control" placeholder="UserId Here" Width="300"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-4 text-right control-label col-form-label">Enter Password</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox runat="server" ID="txtpass" class="form-control" placeholder="Password Here" Width="300" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-4 text-right control-label col-form-label">Confirm Password</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox runat="server" ID="txtpassconf" class="form-control" placeholder="Confirm Password" Width="300" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="border-top">
                                <div class="card-body text-center">
                                    <asp:Button ID="Button1" runat="server" Text="Next" class="btn btn-primary" Width="100" OnClick="Button1_Click"/>
                                    <br />
                                    <br />
                                    <asp:Label ID="lblmessage" runat="server" Text="" Font-Size="Large">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>