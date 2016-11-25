<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="archivo.aspx.cs" Inherits="SitemaProyecto.Forms.archivo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h4>Selecione el archivo</h4>
               <h2 class="text-danger">Importante El nombre del Archivo tiene que ser igual que su nombre de usuario</h2>
            <asp:FileUpload ID="FileUpload1"
                runat="server"></asp:FileUpload>

            <br />
            <br />

            <asp:Button ID="UploadButton"
                Text="Upload file"
                OnClick="UploadButton_Click"
                runat="server"></asp:Button>

            <hr />

            <asp:Label ID="UploadStatusLabel"
                runat="server">
            </asp:Label>
            <asp:Label ID="Label1"
                runat="server">
            </asp:Label>
        </div>
    </form>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</body>
</html>
