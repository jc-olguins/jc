<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SitemaProyecto.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
    <script src="Scripts/extra.js"></script>
    <style type="text/css">
        body {
            background-image: url(Imagenes/Pulse_Wallpaper_Pack_by_NYMEZIDE.jpg);
            font-family: Helvetica;
            color: white;
            font-size: 16px;
        }
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 34px;
        }

        .auto-style3 {
            width: 648px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-left">
                                <h2>Inisiar sesion</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-inline">
                                    <div class="form-group">
                                        <label for="exampleInputName2">Usuario</label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Jane Doe"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail2">Contraseña</label>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password" placeholder="**********"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Inisiar sesion" CssClass="btn btn-default" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8"></div>
                            <div class="col-lg-4">
                                <div class="page-header">
                                    <h2>Registrate</h2>
                                </div>

                                <div id="signupForm" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Nombre del Usuario</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Password</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Repite password</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                            <span class="help-block">Requerido si la contraseña anterior, no está vacía</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-9 col-lg-offset-3">
                                            <asp:Button ID="Button2" runat="server" Text="registrar" CssClass="btn btn-primary" OnClick="Button2_Click" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%-- <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        <table class="auto-style1">
                            <tr>
                                <td>Usuario</td>
                                <td>Contraseña</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td>registrate</td>
                            </tr>
                            <tr>
                                </td>
                            </tr>
                            <tr>
                                <td>contraseña
                                    &nbsp;repetirla
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>--%>
        </div>
    </form>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/jquery-3.1.1.slim.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
