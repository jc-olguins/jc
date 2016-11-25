<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Master.Master" AutoEventWireup="true" CodeBehind="Jurado.aspx.cs" Inherits="SitemaProyecto.Forms.Jurado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../App_Themes/tabla.css" rel="stylesheet" />
    <link href="../stacktable/stacktable.css" rel="stylesheet" />
    <script src="../stacktable/stacktable.min.js"></script>
    <script src="../Scripts/tabla.js"></script>
    <style type="text/css">
        body {
            background-image: url(..\\Imagenes\\bg-1.jpg);
            font-family: Helvetica;
            color: white;
            font-size: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="row">      
        <div class="col-lg-3">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick"></asp:Timer>
                    <div class="panel panel-primary">
                        <div class="panel-heading text-center">
                            <h3 class="panel-title">Lista de proyectos</h3>
                        </div>
                        <div class="panel-body" style="width: 100%; height: 100%;">
                            <asp:DropDownList ID="DropDownList1" runat="server" multiple="" CssClass="dropdown form-control" Height="100%" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="col-lg-9">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="panel panel-primary">
                        <div class="panel-heading text-center">
                            <h3 class="panel-title">Proyecto<asp:Label ID="Label1" runat="server" Text=""></asp:Label></h3>
                        </div>
                        <div class="panel-body" style="width: 100%; height: 100%;">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="panel panel-success text-primary">

                                        <div class="panel-body table-responsive">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="large-only table stacktable large-only" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <AlternatingRowStyle BackColor="White" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="panel panel-info">
                                        <div class="panel-body">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
