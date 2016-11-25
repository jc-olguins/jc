using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SitemaProyecto.Clases
{
    public class ValoresGlobales
    {
        //////Variables globales
        public static string RutaBD = "127.0.0.1"; //Ruta de la base de datos para el proyecto 
        public BaseDatos BDatos = new BaseDatos("login");  //Base de datos sistema
    }
}