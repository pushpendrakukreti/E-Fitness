<%@ Page Title="" Language="C#" MasterPageFile="~/supplier/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Fitness_Hub.supplier.ChangePassword1" %>
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
                                        <asp:TextBox ID="txtsupplier" runat="server" CssClass="form-control" placeholder="SupplierID Here" Width="300"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-4 text-right control-label col-form-label">Enter Password</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" placeholder="Password Here" Width="300"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-4 text-right control-label col-form-label">Confirm Password</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtpasswordconf" runat="server" CssClass="form-control" placeholder="Confirm Password" Width="300"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="border-top">
                                <div class="card-body text-center">
                                    <asp:Button ID="btn1" runat="server" Text="Next" CssClass="btn btn-primary" Width="100" OnClick="btn1_Click" />
                                    <br />
                                    <br />
                                    <asp:Label ID="lblmsg" runat="server" Text="" Font-Size="Large"></asp:Label>
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