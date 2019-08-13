<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Fitness_Hub.admin.Products" %>
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
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Product Name</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtprname" runat="server" CssClass="form-control" placeholder="Product Name Here" Width="350"></asp:TextBox>
                                        </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-3 text-right control-label col-form-label">Quantity</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtqty" runat="server" CssClass="form-control" placeholder="Quantity Here" Width="350" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-3 text-right control-label col-form-label">Product Image</label>
                                    <div class="col-sm-9">
                                        <asp:FileUpload ID="filephoto" runat="server" CssClass="form-control" Width="350" />
                                        <asp:RegularExpressionValidator id="regexValidator" runat="server" ControlToValidate="filephoto" ErrorMessage="Only JPG, JPEG and PNG Allowed" ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])|.*\.([Pp][Nn][Gg])$)"></asp:RegularExpressionValidator>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-3 text-right control-label col-form-label">Supplier</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="ddsup" runat="server" CssClass="form-control" Width="350">
                                        </asp:DropDownList>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-3 text-right control-label col-form-label">Product Price(&#8377;)</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtprice" runat="server" CssClass="form-control" placeholder="Price Here" Width="350" TextMode="Number"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                            <div class="border-top">
                                <div class="card-body text-center">
                                    <asp:Button ID="btnsub" runat="server" Text="Submit" CssClass="btn btn-primary" Width="100" OnClick="btnsub_Click" />
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
