using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using Tiendas.Entities;

namespace Tiendas.DAL
{
    public class RepuestosDAL
    {
        public static async Task<List<ResultadoTienda>> SolicitarDisponibilidad(string dbConn,
            string marcaCarro, string modeloCarro, string añoCarro, string nombreRepuesto)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(dbConn))
                {
                    // Set command to execute stored procedure
                    Debug.Print("------------------------------");
                    Debug.Print(dbConn);
                    Debug.Print("------------------------------");
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SolicitarDisponibilidad";                      

                    // Add params
                    cmd.Parameters.AddWithValue("@marca_carro", marcaCarro);
                    cmd.Parameters.AddWithValue("@modelo_carro", modeloCarro);
                    cmd.Parameters.AddWithValue("@año_carro", añoCarro);
                    cmd.Parameters.AddWithValue("@nombre_repuesto", nombreRepuesto);

                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        List<ResultadoTienda> listaRepuestos = new List<ResultadoTienda>();
                        ResultadoTienda tmpResultado = new ResultadoTienda();

                        while (reader.Read())
                        {
                            tmpResultado = new ResultadoTienda();
                            tmpResultado.Vehiculo.Marca = reader["marca_carro"].ToString();
                            tmpResultado.Vehiculo.Modelo = reader["modelo_carro"].ToString();
                            tmpResultado.Vehiculo.Año = reader["año_carro"].ToString();
                            tmpResultado.Repuesto.Nombre = reader["nombre_repuesto"].ToString();
                            tmpResultado.Repuesto.Marca = reader["marca_repuesto"].ToString();
                            tmpResultado.Repuesto.Precio = Convert.ToDouble(reader["precio_repuesto"]);

                            listaRepuestos.Add(tmpResultado);
                        }

                        return listaRepuestos;
                    }
                }
            }
            catch (Exception ex)
            {
                return new List<ResultadoTienda>();
            }
        }

    }
}