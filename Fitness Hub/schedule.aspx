<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="Fitness_Hub.schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<section class="ftco-section">
        
    </section>--%>


    <section class="hero-wrap js-fullheight" style="background-image: url('images/bg_2.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <h1 class="mb-3 bread">Class Schedule</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Home</a></span> <span>Schedule</span></p>
                </div>
            </div>
        </div>
    </section>


    <section class="ftco-section mt-4" style="padding: 0px !important;">
        <div class="container-fluid" runat="server" id="divcategory">
            <div class="row">
                <div class="col-md-6 col-lg-4 text-center">
                    <div class="package-program ftco-animate">
                        <a href="#" class="img d-flex justify-content-center align-items-center">
                            <img src="Upload/begin.jpg" height="350" width="100%" class="text-center primary-image">
                            <span style="position: absolute; margin-left: 0%; width: 93%; height: 55%; opacity: 0.5; font-size: 45pt; color: white;">BEGINNERS</span>
                        </a>
                        <div class="text mt-3">
                            <h2>
                                <asp:LinkButton ID="btnbegin" runat="server" Text="BEGINNER" OnClick="btnbegin_Click"></asp:LinkButton></h2>
                            <p style="font-size: large;">
                                This panel is for the <b>BEGINNERS</b> who joined
                                <br />
                                our Beginner's Plan. Click it to view more if you are a beginner otherwise select only the schedule you have applied for, Good Luck!
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 text-center">
                    <div class="package-program ftco-animate">
                        <a href="order.aspx" class="img d-flex justify-content-center align-items-center">
                            <img src="Upload/advance.jpg" height="350" width="100%" class="text-center primary-image">
                            <span style="position: absolute; margin-left: 0%; width: 93%; height: 55%; opacity: 0.5; font-size: 45pt; color: white;">ADVANCED</span>
                        </a>
                        <div class="text mt-3">
                            <h2>
                                <asp:LinkButton ID="btnadvance" runat="server" Text="ADVANCED" OnClick="btnadvance_Click"></asp:LinkButton></h2>
                            <p style="font-size: large;">
                                This panel is for the <b>ADVANCED</b> who joined
                                <br />
                                our Advanced Plan. Click it to view more if you are a Advanced otherwise select only the schedule you have applied for, Good Luck!
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 text-center">
                    <div class="package-program ftco-animate">
                        <a href="order.aspx" class="img d-flex justify-content-center align-items-center">
                            <img src="Upload/profess.jpg" height="350" width="100%" class="text-center primary-image">
                            <span style="position: absolute; margin-left: 0%; width: 93%; height: 55%; opacity: 0.5; font-size: 45pt; color: white;">PROFESSIONALS</span>
                        </a>
                        <div class="text mt-3">
                            <h2>
                                <asp:LinkButton ID="btnprofess" runat="server" Text="PROFESSIONAL" OnClick="btnprofess_Click"></asp:LinkButton></h2>
                            <p style="font-size: large;">
                                This panel is for the <b>PROFESSIONAL</b> who joined
                                <br />
                                our Professional Plan. Click it to view more if you are a Professional otherwise select only the schedule you have applied for, Good Luck!
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid" runat="server" id="divbeginner">
            <div class="row">
                <asp:Repeater ID="rpBeginnerList" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 col-lg-6 col-sm-6 text-center">
                            <div class="package-program ftco-animate">
                                <a class="img d-flex justify-content-center align-items-center">
                                    <video id="mevideo" runat="server" controls width="100%">
                                        <source src="<%#Eval("ScheduleVideos","../Upload/videos/{0}") %>">
                                    </video>
                                </a>
                                <div class="text mt-0" style="margin-top:0%;">
                                    <h2><a href="#"><%#Eval("ScheduleName") %></a></h2>
                                    <p style="font-size: large;">
                                        <b>Day: </b> <%#Eval("ScheduleDay") %><br />
                                    <b>Reps/Set:  <%#Eval("ScheduleReps") %></b> Reps with break of 1 Minute/Set <br />
                                        <b>Excercise Type: </b> <%#Eval("ScheduleType") %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT * FROM [Schedule] WHERE ([ScheduleType] = @ScheduleType)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Beginner" Name="ScheduleType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="container-fluid" runat="server" id="divadvance">
            <div class="row">
                <asp:Repeater ID="rpAdvancedList" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 col-lg-6 col-sm-6 text-center">
                            <div class="package-program ftco-animate">
                                <a class="img d-flex justify-content-center align-items-center">
                                    <video id="mevideo" runat="server" controls width="100%">
                                        <source src="<%#Eval("ScheduleVideos","../Upload/videos/{0}") %>">
                                    </video>
                                </a>
                                <div class="text mt-0" style="margin-top:0%;">
                                    <h2><a href="#"><%#Eval("ScheduleName") %></a></h2>
                                    <p style="font-size: large;">
                                        <b>Day: </b> <%#Eval("ScheduleDay") %><br />
                                    <b>Reps/Set:  <%#Eval("ScheduleReps") %></b> Reps with break of 1 Minute/Set <br />
                                        <b>Excercise Type: </b> <%#Eval("ScheduleType") %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT * FROM [Schedule] WHERE ([ScheduleType] = @ScheduleType) order by ScheduleDay">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Advanced" Name="ScheduleType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="container-fluid" runat="server" id="divprofessional">
            <div class="row">
                <asp:Repeater ID="rpProfessionalList" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 col-lg-6 col-sm-6 text-center">
                            <div class="package-program ftco-animate">
                                <a class="img d-flex justify-content-center align-items-center">
                                    <video id="mevideo" runat="server" controls width="100%">
                                        <source src="<%#Eval("ScheduleVideos","../Upload/videos/{0}") %>">
                                    </video>
                                </a>
                                <div class="text mt-0" style="margin-top:0%;">
                                    <h2><a href="#"><%#Eval("ScheduleName") %></a></h2>
                                    <p style="font-size: large;">
                                        <b>Day: </b> <%#Eval("ScheduleDay") %><br />
                                    <b>Reps/Set:  <%#Eval("ScheduleReps") %></b> Reps with break of 1 Minute/Set <br />
                                        <b>Excercise Type: </b> <%#Eval("ScheduleType") %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT * FROM [Schedule] WHERE ([ScheduleType] = @ScheduleType)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Professional" Name="ScheduleType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
