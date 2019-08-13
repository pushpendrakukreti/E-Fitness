<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Fitness_Hub.signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section class="ftco-appointment pt-4 pb-0 pl-1 pr-1" style="background: linear-gradient(45deg, #fd6b00 0%, #808080 40%);">
        <div class="overlay"></div>
        <div class="container-wrap pt-0">
            <div class="row no-gutters d-md-flex align-items-center pt-1">
                <div class="col-md-3"></div>
                <div class="col-md-7 appointment ftco-animate fadeInUp ftco-animated">
                    <h1 class="mb-4 text-white text-center font-weight-normal">Register Here</h1>
                    <div class="appointment-form">
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Username" Font-Size="13pt"></asp:TextBox>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="D.O.B" TextMode="Date" Font-Size="13pt"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:RadioButtonList runat="server" class="form-control" ID="genderDDlist" RepeatDirection="Horizontal" Font-Size="13pt" CellSpacing="10">
                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                        </asp:RadioButtonList>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone" TextMode="Phone" Font-Size="13pt"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:FileUpload id="filephoto" runat="server" CssClass="form-control" Font-Size="13pt"/>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:TextBox ID="txtHeight" runat="server" CssClass="form-control" placeholder="Height" Font-Size="13pt"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" placeholder="Weight" TextMode="Number" Font-Size="13pt"></asp:TextBox>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:TextBox ID="txtmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" Font-Size="13pt"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password" Font-Size="13pt"></asp:TextBox>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:TextBox ID="txtconpass" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password" Font-Size="13pt"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:Button id="btnSubmit" runat="server" CssClass="btn btn-primary py-3 px-4" OnClick="btnSubmit_Click" Text="Submit"/>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group text-center">
                                <asp:Label ID="lblmsg" runat="server" Text="" Font-Size="20pt"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Label ID="lblresult" runat="server" Text="" Font-Size="0.001"></asp:Label>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
