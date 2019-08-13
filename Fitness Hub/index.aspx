<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Fitness_Hub.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="home-slider js-fullheight owl-carousel ftco-degree-bottom">
        <div class="slider-item js-fullheight" style="background-image: url(images/bg_1.jpg);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

                    <div class="col-sm-6 ftco-animate text-center">
                        <h1 class="mb-4">Fuel Your Body Fitness</h1>
                        <h2 class="subheading">Be One Of Us</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="slider-item js-fullheight" style="background-image: url(images/bg_2.jpg);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

                    <div class="col-sm-7 ftco-animate text-center">
                        <h1 class="mb-4">Challenge Yourself</h1>
                        <h2 class="subheading">Get Your Body Fit</h2>
                    </div>

                </div>
            </div>
        </div>
    </section>


    <section class="ftco-section-services ftco-degree">
        <div class="container">
            <div class="row d-flex align-items-center">
                <div class="col-xl-12 align-self-stretch pt-2">
                    <div class="row justify-content-center mb-3 text-center">
                        <div class="col-md-12 heading-section ftco-animate">
                            <h3 class="subheading">Measure Your Body Mass Index</h3>
                            <h2 class="mb-4">Are Fit or Not?</h2>
                        </div>
                    </div>
                    <div class="services d-flex ftco-animate">
                        <div class="icon d-flex justify-content-center align-items-center" style="width:20%; margin-left:28%;">
                            <span class="flaticon-ruler"></span>
                        </div>
                        <div class="text ml-5">
                            <h3>Enter Your Height</h3>
                            <h3><asp:TextBox ID="txtheight" runat="server" CssClass="pl-4 form-control" placeholder="Feets" Font-Size="Larger" Width="50%"></asp:TextBox></h3>
                        </div>
                    </div>
                    <div class="services d-flex ftco-animate">
                        <div class="icon d-flex justify-content-center align-items-center" style="width:20%; margin-left:28%;">
                            <span class="flaticon-ruler"></span>
                        </div>
                        <div class="text ml-5">
                            <h3>Enter Your Weight</h3>
                            <h3><asp:TextBox ID="txtweight" runat="server" CssClass="pl-4 form-control" placeholder="In KGs" Font-Size="Larger" Width="50%"></asp:TextBox></h3>
                        </div>
                    </div>
                    <div class="services d-flex ftco-animate">
                        <div class="text pl-5" style="margin-left:40%;">
                            <h3><asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-danger" Font-Size="X-Large" Width="30%" OnClick="btnSubmit_Click"/></h3>
                        </div>
                    </div>
                    <div class="services d-flex ftco-animate">
                        <div class="text pl-5" style="margin-left:43%;">
                            <h3><asp:Label ID="lblResult" runat="server" Text="" ForeColor="Red"></asp:Label></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section bg-light" style="padding-top:5%; padding-bottom: 0px;">
        <div class="container-fluid">
            <div class="row justify-content-center mb-5">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <h3 class="subheading">Shape Your Body</h3>
                    <h2 class="mb-1">Our Coaches</h2>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="rpCoachesList" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="col-lg-3 d-flex text-center">
                            <div class="coach align-items-stretch">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("TrainerImage","../Upload/images/{0}") %>' CssClass="pl-3 pr-3 img" />
                                <div class="text bg-white p-4 ftco-animate">
                                    <span class="subheading">Trainer</span>
                                    <h3><a href="#"><%#Eval("TrainerName") %></a></h3>
                                    <h2 style="font-size: smaller">Date of Birth: <%#Eval("TrainerDOB","{0:d}") %></h2>
                                    <h4 style="font-size: medium;"><b>Contact:</b><%#Eval("TrainerPhone") %></h4>
                                    <p>Email ID: <%#Eval("TrainerEmail") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT top 8 * FROM [Trainer]"></asp:SqlDataSource>
        </div>
    </section>

    <section class="ftco-section" style="padding-top: 2%; padding-bottom: 0px;">
        <div class="container-fluid">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section ftco-animate text-center">
                    <h3 class="subheading">Schedules List</h3>
                    <h2 class="mb-1">Our Schedules</h2>
                </div>
            </div>
        </div>
        <div class="container-fluid" runat="server" id="divcategory">
            <div class="row">
                <div class="col-md-6 col-lg-4 text-center">
                    <div class="package-program ftco-animate">
                        <a href="#" class="img d-flex justify-content-center align-items-center">
                            <img src="Upload/begin.jpg" height="350" width="100%" class="text-center primary-image">
                            <span style="position: absolute; margin-left: 0%; width: 93%; height: 55%; opacity: 0.5; font-size: 45pt; color: white;">BEGINNERS</span>
                        </a>
                        <div class="text mt-3">
                            <h2>BEGINNER</h2>
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
                            <h2>ADVANCED</h2>
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
                            <h2>PROFESSIONAL</h2>
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
        <div class="container">
            <div class="row mt-4 justify-content-center ftco-animate">
                <div class="col-md-4 text-center">
                    <a href="schedule.aspx" class="btn-custom py-4">View More Program <span class="ion-ios-arrow-down ml-2"></span></a>
                </div>
            </div>
        </div>
    </section>


    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section ftco-animate text-center">
                    <h3 class="subheading">Pricing Tables</h3>
                    <h2 class="mb-1">Membership Plans</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 ftco-animate">
                    <div class="block-7">
                        <div class="text-center">
                            <h2 class="heading">One Day Training</h2>
                            <span class="price"><sup>₹</sup> <span class="number">100</span></span>
                            <span class="excerpt d-block">Just for 1 Day</span>
                            <a href="signup.aspx" class="btn btn-primary d-block px-2 py-4 mb-4">Get Started</a>

                            <h3 class="heading-2 mb-4">Enjoy All The Features</h3>

                            <ul class="pricing-text">
                                <li>Onetime Access To All Club</li>
                                <li>Group Trainer</li>
                                <li>Book A Group Class</li>
                                <li>Fitness Orientation</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 ftco-animate">
                    <div class="block-7">
                        <div class="text-center">
                            <h2 class="heading">Pay Every Month</h2>
                            <span class="price"><sup>₹</sup> <span class="number">700</span></span>
                            <span class="excerpt d-block">All features are included</span>
                            <a href="signup.aspx" class="btn btn-primary d-block px-3 py-4 mb-4">Get Started</a>

                            <h3 class="heading-2 mb-4">Enjoy All The Features</h3>

                            <ul class="pricing-text">
                                <li>Group Classes</li>
                                <li>Discuss Fitness Goals</li>
                                <li>Group Trainer</li>
                                <li>Fitness Orientation</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 ftco-animate">
                    <div class="block-7">
                        <div class="text-center">
                            <h2 class="heading">1 Year Membership</h2>
                            <span class="price"><sup>₹</sup> <span class="number">7100</span></span>
                            <span class="excerpt d-block">All features are included</span>
                            <a href="signup.aspx" class="btn btn-primary d-block px-3 py-4 mb-4">Get Started</a>

                            <h3 class="heading-2 mb-4">Enjoy All The Features</h3>

                            <ul class="pricing-text">
                                <li>Group Classes</li>
                                <li>Discuss Fitness Goals</li>
                                <li>Group Trainer</li>
                                <li>Fitness Orientation</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-appointment">
        <div class="overlay"></div>
        <div class="container-wrap">
            <div class="row no-gutters d-md-flex align-items-center">
                <div class="col-md-6 d-flex align-self-stretch img" style="background-image: url(images/about-3.jpg);">
                </div>
                <div class="col-md-6 appointment ftco-animate">
                    <h3 class="mb-3">Book a Appointment</h3>
                    <div class="appointment-form">
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:TextBox ID="txtfname" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:TextBox ID="txtlname" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <div class="input-wrap">
                                    <div class="icon"><span class="ion-md-calendar"></span></div>
                                    <asp:TextBox ID="txtdate" runat="server" CssClass="form-control" placeholder="Date" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group ml-md-4">
                                <div class="input-wrap">
                                    <div class="icon"><span class="ion-ios-clock"></span></div>
                                    <asp:TextBox ID="txttime" runat="server" CssClass="form-control" placeholder="Time" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:TextBox ID="txtphone" runat="server" CssClass="form-control" placeholder="Phone" TextMode="Phone"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-md-flex">
                            <div class="form-group">
                                <asp:TextBox ID="txtmsg" Columns="30" Rows="2" runat="server" CssClass="form-control" placeholder="Message" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group ml-md-4">
                                <asp:Button ID="appointment" runat="server" CssClass="btn btn-primary py-3 px-4" Text="Book" OnClick="appointment_Click" />
                                <br />
                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
