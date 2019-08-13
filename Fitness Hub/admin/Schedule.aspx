<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="Fitness_Hub.admin.Schedule" %>
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
                <div class="col-md-7">
                    <div class="card">
                        <div class="form-horizontal">
                            <div class="card-body text-center">
                                <h3 class="card-title">Add Informations</h3>
                                <br />
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Schedule Name</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox runat="server" ID="txtname" class="form-control" placeholder="Name Here" Width="300"></asp:TextBox>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-3 text-right control-label col-form-label">Schedule Image</label>
                                    <div class="col-sm-9">
                                        <asp:FileUpload ID="filephoto" runat="server" CssClass="form-control"  Width="300"/>
                                        <asp:RegularExpressionValidator ID="regexValidator" runat="server" ControlToValidate="filephoto" ErrorMessage="Only JPG, JPEG and PNG Allowed" ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])|.*\.([Pp][Nn][Gg])$)">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lname" class="col-sm-3 text-right control-label col-form-label">Schedule Video</label>
                                    <div class="col-sm-9">
                                        <asp:FileUpload ID="filevideo" runat="server" CssClass="form-control"  Width="300"/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="filevideo" ErrorMessage="Only MP4, MKV and 3GP Allowed" ValidationExpression="(.*\.([3][Gg][Pp])|.*\.([Mm][Pp][4])|.*\.([Mm][Kk][Vv])$)">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Schedule Timing</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox runat="server" ID="txtTiming" class="form-control" placeholder="Timing Here" Width="150" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Schedule Day</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="ddDay" runat="server" CssClass="form-control" Width="150">
                                            <asp:ListItem Value="-1">--Select Day--</asp:ListItem>
                                            <asp:ListItem Value="0">MONDAY</asp:ListItem>
                                            <asp:ListItem Value="1">TUESDAY</asp:ListItem>
                                            <asp:ListItem Value="2">WEDNESDAY</asp:ListItem>
                                            <asp:ListItem Value="3">THURSDAY</asp:ListItem>
                                            <asp:ListItem Value="4">FRIDAY</asp:ListItem>
                                            <asp:ListItem Value="5">SATURDAY</asp:ListItem>
                                            <asp:ListItem Value="6">SUNDAY</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Excercise Reps</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox runat="server" ID="txtReps" class="form-control" placeholder="Reps Here" Width="150" TextMode="Number" min="1"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-3 text-right control-label col-form-label">Schedule Type</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="ddType" runat="server" CssClass="form-control" Width="150">
                                            <asp:ListItem Value="-1">--Select Type--</asp:ListItem>
                                            <asp:ListItem Value="0">BEGINNER</asp:ListItem>
                                            <asp:ListItem Value="1">ADVANCED</asp:ListItem>
                                            <asp:ListItem Value="2">PROFESSIONAL</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="border-top">
                                <div class="card-body text-center">
                                    <asp:Button ID="Button1" runat="server" Text="Next" class="btn btn-primary" Width="100" OnClick="Button1_Click"/>
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
