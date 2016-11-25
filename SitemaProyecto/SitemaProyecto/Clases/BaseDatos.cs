using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.Data;
//using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using MySql.Data;
using System.Data;

namespace SitemaProyecto.Clases
{
    public class BaseDatos
    {
        string NomTabla; // Nombre Tabla


        public DataSet coneccion(string sql)
        {

            DataSet Ds = new DataSet();
            MySqlConnection conexion = new MySqlConnection();
            conexion.ConnectionString = "Server=" + "192.168.1.71" + ";Port=" + "3306" + ";Database=" + "login" + ";Uid=" + "root" + ";Pwd=" + "" + ";";
            try
            {
                conexion.Open();
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conexion);
                adapter.Fill(Ds, NomTabla);
                conexion.Close();
            }
            catch
            {
            }
            return Ds;
        }

        public MySqlConnection ConSql = new MySqlConnection("Data source=" + ValoresGlobales.RutaBD + ";initial catalog=login; user id=root; password=");

        //constructor
        public BaseDatos(string Tabla)
        {
            try
            {
                NomTabla = Tabla; //Almacena nobmre de la tabla                              
            }
            catch (Exception Ex)
            {
                string Error = Ex.Message;
            }
        }

        //Leer DataSet de la base de datos
        public DataSet Lectura(string Sentencia)
        {
            DataSet Ds = new DataSet();
            MySqlDataAdapter DaSql;
            try
            {
                if (ConSql.State == ConnectionState.Open)
                    ConSql.Close();
                ConSql.Open();
                //Crear el MySqlDataAdapter
                DaSql = new MySqlDataAdapter(Sentencia, ConSql);
                //'Llenar el DataSet con el DataTable    
                DaSql.Fill(Ds, NomTabla);
                ConSql.Close();
                return Ds;
            }
            catch
            {
                ConSql.Close();
                Ds = null;
                return Ds;
            }
        }

        //Escribe datos en la base de datos
        public string Escritura(string Sentencia)
        {
            MySqlDataAdapter DaSql = new MySqlDataAdapter();
            MySqlCommand Comando = new MySqlCommand();
            try
            {
                if (ConSql.State == ConnectionState.Open)
                    ConSql.Close();
                ConSql.Open();
                Comando.Connection = ConSql; //Relaciona el comando con la conexion 
                Comando.CommandText = Sentencia; //Asigna el comando SQL
                DaSql.InsertCommand = Comando; //Inserta el comando para ser ejecutado
                Comando.ExecuteNonQuery(); //Ejecuta el comando
                ConSql.Close();
                return "Ok";
            }
            catch (Exception ex)
            {
                ConSql.Close();
                string Error = ex.Message;
                return "Err";
            }
        }

        //Escribe datos en la base de datos
        public string EscrituraImagen(string Sentencia, byte[] Foto)
        {
            MySqlDataAdapter DaSql = new MySqlDataAdapter();
            MySqlCommand Comando = new MySqlCommand();
            try
            {
                if (ConSql.State == ConnectionState.Open)
                    ConSql.Close();
                ConSql.Open();
                Comando.Connection = ConSql; //Relaciona el comando con la conexion 
                Comando.CommandText = Sentencia; //Asigna el comando SQL
                Comando.Parameters.AddWithValue("@Pic", Foto);
                DaSql.InsertCommand = Comando; //Inserta el comando para ser ejecutado
                Comando.ExecuteNonQuery(); //Ejecuta el comando
                ConSql.Close();
                return "Ok";
            }
            catch (Exception ex)
            {
                ConSql.Close();
                string Error = ex.Message;
                return "Err";
            }
        }

        public string Cerrar()
        {
            try
            {
                if (ConSql.State == ConnectionState.Open)
                    ConSql.Close();
                ConSql = null;
                return "Ok";
            }
            catch
            {
                return "Err";
            }
        }
    }
}