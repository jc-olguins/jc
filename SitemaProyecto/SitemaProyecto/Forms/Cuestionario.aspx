<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuestionario.aspx.cs" Inherits="SitemaProyecto.Forms.Cuestionario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title></title>

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrapValidator.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../Styles/sweetalert.css" rel="stylesheet" />
    <style type="text/css">
        body {
            background-image: url(..\\Imagenes\\bg-1.jpg);
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
                        <p><div class="row">                                
                                <div class="col-md-9">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine"  Rows="10" Enabled="false" Font-Overline="False"></asp:TextBox>
                                </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="left: 0px; top: 0px" AutoPostBack="True">
                                    <asp:ListItem Value="-1">-- seleccione una R--</asp:ListItem>
                                    <asp:ListItem Value="1">cumple</asp:ListItem>
                                    <asp:ListItem Value="0">no cumple</asp:ListItem>
                                </asp:DropDownList></div>
                            </div>
                            <p>
                            </p>
                            <p>
                            </p>
                        </p>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/jquery-3.1.1.slim.min.js"></script>
    <link href="../Content/bootstrapValidator.css" rel="stylesheet" />
    <script src="../Scripts/sweetalert.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/extra.js"></script>
</body>
</html>
