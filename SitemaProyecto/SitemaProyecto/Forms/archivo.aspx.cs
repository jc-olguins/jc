using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitemaProyecto.Forms
{
    public partial class archivo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)  //Si es la primera vez que se carga
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("..\\Index.aspx");
                }
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (fileExtension.ToLower() != ".pdf" && fileExtension.ToLower() != ".PDF")
                {
                    Label1.Text = "Sólo archivo con pdf";
                }
                else
                {
                    int fileSize = FileUpload1.PostedFile.ContentLength;
                    if (fileSize >= 2097152)/////tamaño del archivo 2mb
                    {
                        Label1.Text = "Archivo Maximo de 2MB";
                    }
                    else
                    {
                        string ass = Server.MapPath("~");

                        ass += "\\Archivos\\" + FileUpload1.FileName;

                        FileUpload1.SaveAs(ass);
                        Label1.Text = "Archivo Subido";

                        Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
                        DataSet DatRegistros = new DataSet();
                        string Sentencia;
                        //Rellena Zona
                        Sentencia = "UPDATE `login`.`registro` SET  `pdf` = '2' WHERE `registro`.`id` = " + Session["idRegistro"].ToString().Trim();
                        string resultado = VGlobal.BDatos.Escritura(Sentencia);
                        UploadButton.Enabled = false;
                    }
                }
            }
            else
            {
                Label1.Text = "Seleccione un archivo para cargarlo";
            }
        }
    }
}