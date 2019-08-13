<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="AllSchedule.aspx.cs" Inherits="Fitness_Hub.admin.AllSchedule" %>

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
                                <li class="breadcrumb-item active" aria-current="page">Add Schedule</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .card {
                background-color: #eeeeee !important;
            }

            table {
                background-color: none !important;
                margin: 0% !important;
            }

            tbody {
                text-align: center !important;
            }

            .overflowgrid {
                overflow-x: auto !important;
            }

            .table td {
                vertical-align: middle !important;
            }
        </style>
        <div class="container-fluid">
            <div class="row overflowgrid">
                <div class="card">
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ScheduleId" DataSourceID="SqlDataSource2" Width="80%" BorderStyle="Solid" BackColor="#CCCCCC" BorderColor="#999999" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="ScheduleName" HeaderText="Schedule Name" SortExpression="ScheduleName"></asp:BoundField>
                            <asp:TemplateField HeaderText="Schedule Image" ItemStyle-CssClass="text-center pds">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" ImageUrl='<%# Eval("ScheduleImage","../Upload/images/{0}") %>' Height="100" Width="200" CssClass="text-center" runat="server" />
                                    <asp:LinkButton ID="lnkDownload" CssClass="text-success font-bold font-18" Text="Download" CommandArgument='<%# Eval("ScheduleImage","../Upload/images/{0}") %>' runat="server" OnClick="DownloadFile"></asp:LinkButton>
                                </ItemTemplate>

                                <ItemStyle CssClass="text-center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ScheduleTiming" HeaderText="ScheduleTiming" SortExpression="ScheduleTiming"></asp:BoundField>
                            <asp:BoundField DataField="ScheduleDay" HeaderText="ScheduleDay" SortExpression="ScheduleDay"></asp:BoundField>
                            <asp:BoundField DataField="ScheduleReps" HeaderText="ScheduleReps" SortExpression="ScheduleReps"></asp:BoundField>
                            <asp:TemplateField HeaderText="Videos">
                                <ItemTemplate>
                                    <video width="200" height="100" controls>
                                        <source src='<%#Eval("ScheduleVideos","../Upload/videos/{0}")%>' type="video/mp4">
                                    </video>
                                    <asp:LinkButton ID="lnkDownload1" CssClass="text-success font-bold font-18" Text="Download" CommandArgument='<%# Eval("ScheduleVideos","../Upload/videos/{0}") %>' runat="server" OnClick="DownloadFile1"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ScheduleType" HeaderText="Schedule Type" SortExpression="ScheduleType" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Edit" />
                        </Columns>

                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymCon %>" SelectCommand="SELECT * FROM [Schedule]" DeleteCommand="DELETE FROM [Schedule] WHERE [ScheduleId] = @ScheduleId" InsertCommand="INSERT INTO [Schedule] ([ScheduleName], [ScheduleImage], [ScheduleTiming], [ScheduleDay], [ScheduleReps], [ScheduleVideoss], [ScheduleType]) VALUES (@ScheduleName, @ScheduleImage, @ScheduleTiming, @ScheduleDay, @ScheduleReps, @ScheduleVideoss, @ScheduleType)" UpdateCommand="UPDATE [Schedule] SET [ScheduleName] = @ScheduleName, [ScheduleTiming] = @ScheduleTiming, [ScheduleDay] = @ScheduleDay, [ScheduleReps] = @ScheduleReps, [ScheduleType] = @ScheduleType WHERE [ScheduleId] = @ScheduleId">
                        <DeleteParameters>
                            <asp:Parameter Name="ScheduleId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ScheduleName" Type="String" />
                            <asp:Parameter Name="ScheduleTiming" Type="String" />
                            <asp:Parameter Name="ScheduleDay" Type="String" />
                            <asp:Parameter Name="ScheduleReps" Type="Int32" />
                            <asp:Parameter Name="ScheduleType" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ScheduleName" Type="String" />
                            <asp:Parameter Name="ScheduleTiming" Type="String" />
                            <asp:Parameter Name="ScheduleDay" Type="String" />
                            <asp:Parameter Name="ScheduleReps" Type="Int32" />
                            <asp:Parameter Name="ScheduleType" Type="String" />
                            <asp:Parameter Name="ScheduleId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>

    <script src="../../assets/libs/jquery/dist/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
