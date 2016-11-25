using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitemaProyecto
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.TextBox1.Focus();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
            DataSet DatRegistros = new DataSet();
            string Sentencia;
            //Rellena Zona
            Sentencia = "SELECT * FROM usuarios WHERE usuario='" + TextBox1.Text.Trim() + "' and password='" + TextBox2.Text.Trim() + "';";
            DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
            try
            {
                if (DatRegistros.Tables[0].Rows.Count > 0 && DatRegistros != null)
                {
                    if (DatRegistros.Tables[0].Rows[0]["id_tipo"].ToString().Trim().Equals("1"))
                    {
                        //// no se que pagina .
                        Session["Usuario"] = DatRegistros.Tables[0].Rows[0]["usuario"].ToString().Trim();
                        Session["id"] = DatRegistros.Tables[0].Rows[0]["id"].ToString().Trim();
                        Response.Redirect("Forms\\Jurado.aspx");
                    }
                    else if (DatRegistros.Tables[0].Rows[0]["id_tipo"].ToString().Trim().Equals("2"))
                    {
                        //////// no se que pagina
                        Session["Usuario"] = DatRegistros.Tables[0].Rows[0]["usuario"].ToString().Trim();
                        Session["id"] = DatRegistros.Tables[0].Rows[0]["id"].ToString().Trim();
                        Response.Redirect("Forms\\Usuario.aspx");
                    }
                }
                else
                {
                    ////Error de usuario
                    ScriptManager.RegisterStartupScript(this, GetType(), "onLoad", "errorInisio();", true);
                    this.TextBox1.Text = "";
                    this.TextBox2.Text = "";
                    this.TextBox1.Focus();
                }
            }
            catch (Exception)
            {
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox4.Text == TextBox5.Text && TextBox4.Text != "")
            {
                Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
                DataSet DatRegistros = new DataSet();
                string Sentencia;
                Sentencia = "SELECT * FROM usuarios WHERE usuario='" + TextBox3.Text.Trim() + "';";
                DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
                try
                {
                    if (DatRegistros != null)
                    {
                        if (DatRegistros.Tables[0].Rows.Count > 0)
                        {
                            this.TextBox3.Text = "";
                            this.TextBox3.Focus();
                            ////usuario ya exite
                            ScriptManager.RegisterStartupScript(this, GetType(), "onLoad", "error();", true);
                        }
                        else
                        {
                            //////// usuario no exite
                            Sentencia = "INSERT INTO `usuarios`( `usuario`, `password`, `id_tipo`) VALUES ('" + TextBox3.Text.Trim() + "','" + TextBox4.Text.Trim() + "',2)";
                            string checar = VGlobal.BDatos.Escritura(Sentencia);
                            if (checar.Equals("Ok"))
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "onLoad", " bien();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "onLoad", "erroralregistroUsu();", true);
                            }
                        }

                    }
                }
                catch (Exception)
                {
                    //// error egeneral
                    throw;
                }
            }
            else
            {
                //// erorer de password
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox4.Focus();
                ScriptManager.RegisterStartupScript(this, GetType(), "onLoad", "errorPassword();", true);
            }
        }



    }
}