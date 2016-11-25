using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitemaProyecto.Forms
{
    public partial class Usuario : System.Web.UI.Page
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
                {//SELECT `datos` FROM `registros` WHERE id=3
                    Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
                    DataSet DatRegistros = new DataSet();
                    string Sentencia;
                    //Rellena Zona
                    Sentencia = "SELECT `registro`.`id`, `idusuario`, `datos`, `pdf`, `calificacion`, categoria.Descricion  ,`caleficacion2` FROM `registro` inner join categoria on (idcategoria=categoria.id) WHERE `idusuario`=" + Session["id"].ToString().Trim();
                    DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
                    try
                    {
                        if (DatRegistros != null)
                        {
                            if (DatRegistros.Tables[0].Rows.Count > 0)
                            {
                                Button1.Visible = false;
                                LinkButton3.Enabled = false;
                                LinkButton5.Enabled = false;
                                string id = DatRegistros.Tables[0].Rows[0]["id"].ToString().Trim();
                                Session["idRegistro"] = id;
                                string idusuario = DatRegistros.Tables[0].Rows[0]["idusuario"].ToString().Trim();
                                string datos = DatRegistros.Tables[0].Rows[0]["datos"].ToString().Trim();
                                string pdf = DatRegistros.Tables[0].Rows[0]["pdf"].ToString().Trim();
                                string califacion = DatRegistros.Tables[0].Rows[0]["calificacion"].ToString().Trim();
                                string caleficacion2 = DatRegistros.Tables[0].Rows[0]["caleficacion2"].ToString().Trim();
                                myPDF.Attributes.Add("src", "~/Archivos/" + DatRegistros.Tables[0].Rows[0]["Descricion"].ToString().Trim() + ".pdf");
                                if (datos=="0")
                                {
                                    Button1.Visible = true;
                                }
                                if (pdf == "1")
                                {
                                    LinkButton5.Enabled = true;
                                }
                                if (califacion != "0")
                                {
                                    LinkButton3.Enabled = true;
                                    Label3.Text = "Resultado 1 "+ califacion;
                                    if (caleficacion2 != "0")
                                    {
                                        Label4.Text = "Resultado 2 " + caleficacion2;

                                    }
                                }
                                if (datos != "0")
                                {
                                    Button1.Visible = false;
                                }
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
                    //Rellena Zona
                    Sentencia = "SELECT * FROM `carreras`";
                    DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
                    try
                    {
                        if (DatRegistros != null)
                        {
                            if (DatRegistros.Tables[0].Rows.Count > 0)
                            {
                                //EdoUsuTex = DataUsu.Tables[0].Rows[0]["Descripcion"].ToString().Trim();
                                ////lista de proyectos con registros
                                DropDownList1.Items.Clear(); //Borra elementos seleccionados 
                                DropDownList1.DataSource = DatRegistros.Tables[0];
                                DropDownList1.DataTextField = "tipocarrera";
                                DropDownList1.DataValueField = "id";
                                DropDownList1.DataBind();
                                DropDownList1.Items.Add("seleccione uno");
                                DropDownList1.SelectedValue = "seleccione uno";
                            }
                        }
                    }
                    catch (Exception)
                    {
                    }
                    Sentencia = "SELECT * FROM `categoria`";
                    DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
                    try
                    {
                        if (DatRegistros != null)
                        {
                            if (DatRegistros.Tables[0].Rows.Count > 0)
                            {

                                //EdoUsuTex = DataUsu.Tables[0].Rows[0]["Descripcion"].ToString().Trim();
                                ////lista de proyectos con registros
                                DropDownList2.Items.Clear(); //Borra elementos seleccionados 
                                DropDownList2.DataSource = DatRegistros.Tables[0];
                                DropDownList2.DataTextField = "Descricion";
                                DropDownList2.DataValueField = "id";
                                DropDownList2.DataBind();
                                DropDownList2.Items.Add("seleccione uno");
                                DropDownList2.SelectedValue = "seleccione uno";
                            }
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
            }
            else
            {
                Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
                DataSet DatRegistros = new DataSet();
                string Sentencia;
                //Rellena Zona
                Sentencia = "SELECT `id`, `idusuario`, `datos`, `pdf`, `calificacion`FROM `registro` WHERE `idusuario`=" + Session["id"].ToString().Trim();
                DatRegistros = VGlobal.BDatos.Lectura(Sentencia);
                try
                {
                    if (DatRegistros != null)
                    {
                        if (DatRegistros.Tables[0].Rows.Count > 0)
                        {
                            Button1.Visible = false;
                            LinkButton3.Enabled = false;
                            LinkButton5.Enabled = false;

                            string id = DatRegistros.Tables[0].Rows[0]["id"].ToString().Trim();
                            string idusuario = DatRegistros.Tables[0].Rows[0]["idusuario"].ToString().Trim();
                            string datos = DatRegistros.Tables[0].Rows[0]["datos"].ToString().Trim();
                            string pdf = DatRegistros.Tables[0].Rows[0]["pdf"].ToString().Trim();
                            string califacion = DatRegistros.Tables[0].Rows[0]["calificacion"].ToString().Trim();
                            if (datos == "0")
                            {
                                Button1.Visible = true;
                            }
                            if (pdf != "0")
                            {
                                LinkButton5.Enabled = true;
                            }
                            if (califacion != "0")
                            {
                                LinkButton3.Enabled = true;
                            }
                            if (datos != "0")
                            {
                                Button1.Visible = false;
                            }

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
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            UpdatePanel1.Visible = true;
            UpdatePanel2.Visible = false;
            UpdatePanel3.Visible = false;
            UpdatePanel5.Visible = false;
            UpdatePanel6.Visible = false;

        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            UpdatePanel1.Visible = false;
            UpdatePanel2.Visible = true;
            UpdatePanel3.Visible = false;
            UpdatePanel5.Visible = false;
            UpdatePanel6.Visible = false;
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            UpdatePanel1.Visible = false;
            UpdatePanel2.Visible = false;
            UpdatePanel3.Visible = true;
            UpdatePanel5.Visible = false;
            UpdatePanel6.Visible = false;
        }
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            UpdatePanel1.Visible = false;
            UpdatePanel2.Visible = false;
            UpdatePanel3.Visible = false;
            UpdatePanel5.Visible = true;
            UpdatePanel6.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue!= "seleccione uno"&& DropDownList2.SelectedValue != "seleccione uno")
            {
                ///INSERT INTO `registros`(`id`, `titulo`, `resumen`, `autores`, `institucion`, `tipocarrera`, `semestre`, `email`, `idusuario`, `datos`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9],[value-10])
                Clases.ValoresGlobales VGlobal = new Clases.ValoresGlobales();
                DataSet DatRegistros = new DataSet();
                string Sentencia;
                Sentencia = "INSERT INTO `login`.`registro` (`id`, `titulo`, `resumen`, `autores`, `institucion`, `tipocarrera`, `semestre`, `email`, `idusuario`, `datos`, `pdf`, `calificacion`, `caleficacion2`, `idcategoria`) VALUES (NULL, '" + TextBox1.Text.Trim() + "','" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "','" + TextBox4.Text.Trim() + "','" + DropDownList1.SelectedValue.Trim() + "','" + TextBox5.Text.Trim() + "','" + TextBox6.Text.Trim() + "','" + Session["id"] + "','1','0','0','0','" + DropDownList2.SelectedValue.Trim() + "')";
                string si = VGlobal.BDatos.Escritura(Sentencia);
                if (si == "Ok")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "onLoad", "bien();", true);
                    Response.Redirect("Usuario.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "onLoad", "error();", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "onLoad", "errordatos();", true);
            }
           
        }
    }
}