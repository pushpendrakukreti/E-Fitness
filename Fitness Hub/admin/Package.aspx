<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeFile="Package.aspx.cs" Inherits="Fitness_Hub.admin.Package" %>

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
                                <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Add Category</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="form-horizontal">
                            <div class="card-body">
                                <h4 class="card-title">Add Informations</h4>
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Package Name</label>
                                    <div class="col-sm-9">
                                        <asp:Textbox runat="server" ID="txtname" class="form-control" placeholder="Package Name Here"></asp:Textbox>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Amount Name</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox runat="server" ID="txtamt" class="form-control" placeholder="Package Amount Here"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Package Type</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox runat="server" ID="txtpackage" class="form-control" placeholder="Package Type Here"></asp:TextBox>
                                    </div>
                                </div>
                                  <div class="form-group row">
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Package Desc </label>
                                    <div class="col-sm-9">
                                        <asp:TextBox runat="server" ID="txtdesc" class="form-control" placeholder="Package Desc Here"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="border-top">
                                <div class="card-body">
                                    <asp:button runat="server" text="Save" OnClick="Unnamed1_Click" class="btn btn-primary" />
                                </div>
                                <asp:Label runat="server" ID="lbl"></asp:Label>
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
