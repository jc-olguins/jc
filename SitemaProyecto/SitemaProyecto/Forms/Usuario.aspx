<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Master.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="SitemaProyecto.Forms.Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../App_Themes/simple-sidebar.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
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

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-lg-3">
            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-danger">Menu</button>
                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Registros</asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Lista de Evaluacion</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Resultado de Evaluacion</asp:LinkButton></li>
                    <li role="separator" class="divider"></li>
                    <li>
                        <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">archivo</asp:LinkButton></li>
                </ul>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
            <ContentTemplate>
                <div class="col-lg-9">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-3">Titulo</div>
                                <div class="col-md-9">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="SingleLine" required="" placeholder="Titulo" pattern="[A-Za-z]{1-128}" MaxLength="128"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">Resumen</div>
                                <div class="col-md-9">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10" placeholder="Resumen" required="" MaxLength="500"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">Autor</div>
                                <div class="col-md-9">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Autor o autores" required="" MaxLength="128"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">Institucion</div>
                                <div class="col-md-9">
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Institucion" required="" MaxLength="128"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">Tipo de carrera</div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">Semestre</div>
                                <div class="col-md-9">
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="Number" required="" placeholder="ejemplo:1" MaxLength="11"></asp:TextBox>

                                </div>
                            </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">E-mail</div>
                                <div class="col-md-9">
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control e" TextMode="Email" required="" placeholder="eje@abc.com" MaxLength="128"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-3">categoria</div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="clearfix visible-xs-block"></div>
                                <div class="col-md-4">
                                    <asp:Button ID="Button1" runat="server" Text="Insertar Datos" CssClass="btn btn-primary" OnClick="Button1_Click" />
                                </div>
                                <div class="col-md-4"></div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" Visible="False">
                        <ContentTemplate>
                            <%--<embed src="../Archivos/egel.pdf" type="application/pdf" width="800" height="600"></embed>--%>
                            <iframe runat="server" id="myPDF" src="~/Archivos/Hardware.pdf" width="800px" height="600px"></iframe>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" Visible="False">
                        <ContentTemplate>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            <p>Resultado
                                <br />
                                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                            </p>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" Visible="False">
                        <ContentTemplate>
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe id="pdf" runat="server" class="embed-responsive-item" src="archivo.aspx" width="100%" style="height: 1000px" name="formularios"></iframe>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" Visible="False">
                        <ContentTemplate>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
