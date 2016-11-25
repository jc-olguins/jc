using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitemaProyecto.Forms
{
    public partial class Jurado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)  //Si es la primera vez que se carga
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("..\\Index.aspx");
                }
                ConfigInicial();
            }
        }

        private void ConfigInicial()
        {
            Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
            DataSet DatRegistros = new DataSet();
            string Sentencia;
            //Rellena Zona
            Sentencia = "SELECT * FROM registro where "+ "calificacion = 0";
            DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
            try
            {
                if (DatRegistros != null)
                {
                    if (DatRegistros.Tables[0].Rows.Count > 0)
                    {
                        ////lista de proyectos con registros
                        DropDownList1.Items.Clear(); //Borra elementos seleccionados 
                        DropDownList1.DataSource = DatRegistros.Tables[0];
                        DropDownList1.DataTextField = "titulo";
                        DropDownList1.DataValueField = "id";
                        DropDownList1.DataBind();
                        DropDownList1.Items.Add("seleccione uno");
                        DropDownList1.SelectedValue = "seleccione uno";
                        Session["DropDownListJurado"] = DatRegistros;
                    }
                    else
                    {
                        //// lsita de proyectos basios
                    }
                }
                else
                {
                    ////Error de usuario
                    ScriptManager.RegisterStartupScript(this, GetType(), "onLoad", "errorInisio();", true);
                }
            }
            catch (Exception)
            {
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            ConfigInicial();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Proyecto"] = DropDownList1.SelectedValue.Trim();
            Label1.Text = "  ====>" + Session["Proyecto"].ToString().Trim() + "<====";
            Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
            DataSet DatRegistros = new DataSet();
            string Sentencia;
            //Rellena Zona
            Sentencia = "SELECT `titulo`,`resumen`,`autores`,`institucion`,`semestre`,`email`, carreras.tipocarrera FROM registro inner join carreras on registro.tipocarrera = carreras.id  WHERE registro.`id`=" + Session["Proyecto"].ToString().Trim();
            DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
            try
            {
                if (DatRegistros != null)
                {
                    if (DatRegistros.Tables[0].Rows.Count > 0)
                    {
                        //DatRegistros.Tables[0].DefaultView.Sort = "Numero del empleado";
                        GridView1.DataSource = DatRegistros.Tables[0];
                        GridView1.DataBind();
                    }
                    else
                    {
                        //// lsita de proyectos basios
                    }
                }
                else
                {
                }
            }
            catch (Exception)
            {
            }
            UpdatePanel2.Update();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["Proyecto"] = DropDownList1.SelectedValue.Trim();
            Label1.Text = "  ====>" + Session["Proyecto"].ToString().Trim() + "<====";
            Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
            DataSet DatRegistros = new DataSet();
            string Sentencia;
            Sentencia = "SELECT * FROM registro   WHERE `id`=" + Session["Proyecto"].ToString().Trim();
            DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
            try
            {
                if (DatRegistros != null)
                {
                    if (DatRegistros.Tables[0].Rows.Count > 0)
                    {
                        Session["idusuario"] = DatRegistros.Tables[0].Rows[0]["idusuario"].ToString().Trim();
                        if (DatRegistros.Tables[0].Rows[0]["calificacion"].ToString().Trim() == "0")
                            Session["face"] = 1;
                        else Session["face"] = 2;
                        Session["idcategoria"] = DatRegistros.Tables[0].Rows[0]["idcategoria"].ToString().Trim();
                        Session["idregistro"] = DatRegistros.Tables[0].Rows[0]["id"].ToString().Trim();

                        Response.Redirect("Cuestionario.aspx");
                    }
                    else
                    {
                        //// lsita de proyectos basios
                    }
                }
                else
                {
                }
            }
            catch (Exception)
            {
            }
        }


    }
}