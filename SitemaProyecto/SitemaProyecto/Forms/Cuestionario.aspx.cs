using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitemaProyecto.Forms
{
    public partial class Cuestionario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)  //Si es la primera vez que se carga
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("..\\Index.aspx");
                }
                else
                {
                    try
                    {
                        if (Session["idusuario"].ToString().Trim() != "")
                        {
                            Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
                            DataSet DatRegistros = new DataSet();
                            string Sentencia;

                            //Rellena Zona
                            Sentencia = "SELECT * FROM `prefuntas` where face=" + Session["face"].ToString().Trim() + " and  idcategoria=" + Session["idcategoria"].ToString().Trim() + "";
                            DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
                            try
                            {
                                if (DatRegistros != null)
                                {
                                    if (DatRegistros.Tables[0].Rows.Count > 0)
                                    {
                                        Session["cuestionario"] = DatRegistros;
                                    }
                                }
                            }
                            catch (Exception)
                            {
                            }
                            Sentencia = "SELECT count(*) as num FROM `prefuntas` where face=" + Session["face"].ToString().Trim() + " and  idcategoria=" + Session["idcategoria"].ToString().Trim() + "";
                            DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
                            try
                            {
                                if (DatRegistros != null)
                                {
                                    if (DatRegistros.Tables[0].Rows.Count > 0)
                                    {
                                        Session["num"] = DatRegistros.Tables[0].Rows[0]["num"].ToString().Trim();
                                        Session["num1"] = DatRegistros.Tables[0].Rows[0]["num"].ToString().Trim();
                                        Session["puntosPreguntas"] = 100;
                                        DataSet RegisActual = new DataSet();
                                        RegisActual = (DataSet)(Session["cuestionario"]);
                                        string[,] forpre = new string[Int32.Parse(Session["num"].ToString().Trim()), 3];
                                        int numbero = 0;
                                        foreach (DataRow Regs in RegisActual.Tables[0].Rows)
                                        {
                                            forpre[numbero, 0] = Regs["id"].ToString().Trim();
                                            forpre[numbero, 1] = Regs["pregunta"].ToString().Trim();
                                            forpre[numbero, 2] = Regs["valor"].ToString().Trim(); ;
                                            numbero++;
                                        }
                                        Session["forpre"] = forpre;
                                        reguntas();
                                    }
                                }
                            }
                            catch (Exception)
                            {
                            }
                        }
                    }
                    catch (Exception)
                    {

                    }
                }
            }
        }

        private void reguntas()
        {
            DataSet RegisActual = new DataSet();
            RegisActual = (DataSet)(Session["cuestionario"]);
            int x = Int32.Parse(Session["num"].ToString().Trim());
            if (x > 0)
            {
                string[,] forpre = new string[Int32.Parse(Session["num1"].ToString().Trim()), 3];
                forpre = (String[,])Session["forpre"];
                string txt = forpre[x - 1, 1];
                TextBox1.Text = txt;
                Session["valor"] = forpre[x - 1, 2];
            }
            Session["num"] = x - 1;
        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                if (Int32.Parse(Session["num"].ToString().Trim()) > 0)
                {
                    //Session["puntosPreguntas"] = Int32.Parse(Session["puntosPreguntas"].ToString().Trim()) - Int32.Parse(Session["valor"].ToString().Trim());
                    reguntas();
                    DropDownList1.SelectedValue = "-1";
                }
                else
                {////UPDATE `login`.`registro` SET `calificacion` = '10' WHERE `registro`.`id` = 6;
                    calificar();
                    Response.Redirect("Jurado.aspx");
                }
            }
            else
            {
                if (Int32.Parse(Session["num"].ToString().Trim()) > 0)
                {
                    double r = Double.Parse(Session["puntosPreguntas"].ToString().Trim()) - Double.Parse(Session["valor"].ToString().Trim());
                    Session["puntosPreguntas"] = r;
                    reguntas();
                    DropDownList1.SelectedValue = "-1";
                }
                else
                {////UPDATE `login`.`registro` SET `calificacion` = '10' WHERE `registro`.`id` = 6;
                    calificar();
                    Response.Redirect("Jurado.aspx");
                }
            }
        }

        public void calificar()
        {
            Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
            DataSet DatRegistros = new DataSet();
            string Sentencia;
            //Rellena Zona
            Sentencia = "UPDATE `login`.`registro` SET `calificacion` = '"+ Session["puntosPreguntas"].ToString().Trim() + "', `pdf` = '1' WHERE `registro`.`id` = " + Session["Proyecto"].ToString().Trim();
            string resultado = VGlobal.BDatos.Escritura(Sentencia);
            Response.Redirect("Jurado.aspx");
        }
    }
}