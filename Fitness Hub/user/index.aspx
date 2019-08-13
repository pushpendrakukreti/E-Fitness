<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Fitness_Hub.user.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login</title>
    <!--favicon-->
    <link rel="icon" href="assets\images\favicon.ico" type="image/x-icon" />
    <!-- Bootstrap core CSS-->
    <link href="assets\css\bootstrap.min.css" rel="stylesheet" />
    <!-- animate CSS-->
    <link href="assets\css\animate.css" rel="stylesheet" type="text/css" />
    <!-- Icons CSS-->
    <link href="assets\css\icons.css" rel="stylesheet" type="text/css" />
    <!-- Custom Style-->
    <link href="assets\css\app-style.css" rel="stylesheet" />
    <style type="text/css">
        body {
            background-size: 1400px !important;
            background-image: url('assets/images/gallery/carousel-img-4.png');
            margin-top: -35px;
        }

        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.9);
            border-radius: 0px;
            background-color: #f4f4f4;
        }

        ::-webkit-scrollbar {
            width: 12px;
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar-thumb {
            border-radius: 0px;
            background-color: #303952;
            background-image: -webkit-linear-gradient(90deg,transparent,rgba(888, 888, 0, 0.4) 50%,transparent,transparent)
        }

        .animated {
            animation-duration: 1.5s !important;
        }

        .resultt {
            background-color: white;
            width: 400px;
            margin-left: 35%;
        }

        .chand {
            border-top-left-radius: 20px;
            border-bottom-right-radius: 20px;
            width: 40%;
            margin-top: 15px;
            margin-left: 30%
        }

        #wrapper {
            margin-top: -58px !important;
            margin-top: -15px !important;
            background-size: auto;
            height: 500px;
            width: 100% !important;
            position: absolute;
            opacity: 0.6;
            background-repeat: no-repeat;
        }

        #card101 {
            margin-top: 7%;
        }

        .card {
            border-top-left-radius: 50px !important;
            border-bottom-right-radius: 50px !important;
            opacity: 0.9 !important;
        }

        .card-body {
            border-top-left-radius: 50px !important;
            border-bottom-right-radius: 50px !important;
        }

        @media only screen and (max-width:800px) {
            #card101 {
                margin-top: 17% !important;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
        </div>
        <!--wrapper-->
        <div id="card101" class="text-center">
            <div class="card card-authentication1 mx-auto my-5 animated bounceInDown">
                <div class="card-body" style="background: linear-gradient(20deg, #682a2a, #302a68); color: white;">
                    <asp:Label ID="lblusername" runat="server" Text="" Font-Size="0.02"></asp:Label>
                    <div class="card-content p-2">
                        <div class="text-center">
                            <img src="assets\images\logo-icon.png">
                        </div>
                        <div class="card-title text-uppercase text-center py-3" style="color: white; font-family: arial;">USER (Sign In)</div>
                            <div class="form-group">
                                <div class="position-relative has-icon-right">
                                    <label for="exampleInputUsername" class="sr-only">Username</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control form-control-rounded" placeholder="Username"></asp:TextBox>
                                    <%--<input type="text" id="exampleInputUsername" class="form-control form-control-rounded" placeholder="Username">--%>
                                    <div class="form-control-position">
                                        <i class="icon-user"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="position-relative has-icon-right">
                                    <label for="exampleInputPassword" class="sr-only">Password</label>
                                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control form-control-rounded" placeholder="Password"></asp:TextBox>
                                    <%--<input type="password" id="exampleInputPassword" class="form-control form-control-rounded" placeholder="Password">--%>
                                    <div class="form-control-position">
                                        <i class="icon-lock"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row mr-0 ml-0">
                                <div class="form-group col-6">
                                    <div class="">
                                        <style>
                                            label {
                                                padding-top: 2px !important;
                                                color: white !important;
                                                font-size: 13px;
                                                margin-left: 57%;
                                                width: 100%;
                                            }

                                            div.card-body {
                                                color: black !important;
                                            }
                                            .chk-col-primary{
                                                width:120% !important;
                                                color:white !important;
                                                border:1px solid white !important;
                                            }
                                            .chk-col-primary{
                                                border:none !important;
                                            }
                                            .chk-col-primary > label{
                                                font-size:12pt !important;
                                            }
                                        </style>
                                        <asp:CheckBox ID="chkRememberMe" CssClass="filled-in chk-col-primary" Font-Size="X-Large" runat="server" Text="Remember Me" ForeColor="Yellow" Checked="true"/>
                                    </div>
                                </div>

                            </div>
                                <%--<button type="button" class="btn btn-primary btn-round btn-block waves-effect waves-light" style="background-color: #36A047; border-color: #36A047;">Sign In</button>--%>
                                <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-primary btn-round btn-block waves-effect waves-light" style="background-color: #36A047; border-color: #36A047;" OnClick="btnlogin_Click"/>
                        <hr />
                        <a href="../index.aspx" style="font-size:13pt; font-weight:bold;">HOME</a>
                            <div class="text-center pt-3">
                                <asp:Label ID="lblMessage" runat="server" Text="" style="font-size:16px;"></asp:Label>
                                <br/>
                                <a href="javascript:void()" class="btn-social btn-social-circle btn-facebook waves-effect waves-light m-1"><i class="fa fa-facebook"></i></a>
                                <a href="javascript:void()" class="btn-social btn-social-circle btn-google-plus waves-effect waves-light m-1"><i class="fa fa-google-plus"></i></a>
                                <a href="javascript:void()" class="btn-social btn-social-circle btn-twitter waves-effect waves-light m-1"><i class="fa fa-twitter"></i></a>

                            </div>
                    </div>

                </div>

            </div>

            <asp:Label ID="lblsessionname" runat="server" Font-Size="0.02px" Text=""></asp:Label>
            <!--Start Back To Top Button-->
            <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
            <!--End Back To Top Button-->
        </div>
        <!--<div class="row badge text-center" style="background-color: #34495e; width: 100%; height: 40px; opacity: 0.8; position: absolute;">
			 	<span class="comment" style="color: white; opacity: 0.7">Enter Your Credentials to get Access</span>
			 </div>--->
        <!-- Bootstrap core JavaScript-->
        <script src="assets\js\jquery.min.js"></script>
        <script src="assets\js\popper.min.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
    </form>
</body>
</html>
