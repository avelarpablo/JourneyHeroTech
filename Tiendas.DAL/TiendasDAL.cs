using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Tiendas.Entities;

namespace Tiendas.DAL
{
    public class TiendasDAL
    {
        public static async Task<List<Tienda>> ObtenerTiendasPorCercania(string dbConn,
            double latitudCliente, double longitudCliente)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(dbConn))
                {
                    // Set command to execute stored procedure
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "ObtenerTiendasPorCercania";

                    // Add params
                    cmd.Parameters.AddWithValue("@latitud_cliente", latitudCliente);
                    cmd.Parameters.AddWithValue("@longitud_cliente", longitudCliente);

                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        List<Tienda> listaTiendas = new List<Tienda>();
                        Tienda tmpResultado = new Tienda();

                        while (reader.Read())
                        {
                            tmpResultado = new Tienda();
                            tmpResultado.Nombre = reader["nombre"].ToString();
                            tmpResultado.Direccion = reader["direccion"].ToString();
                            tmpResultado.Telefono = reader["telefono"].ToString();
                            tmpResultado.Rating = Convert.ToDouble(reader["rating"]);

                            listaTiendas.Add(tmpResultado);
                        }

                        return listaTiendas;
                    }
                }
            }
            catch (Exception ex)
            {
                return new List<Tienda>();
            }
        }

        public static async Task<List<ResultadoTienda>> SolicitarDisponibilidadATienda(string endpoint,
            string marcaCarro, string modeloCarro, string añoCarro, string nombreRepuesto)
        {
            string obj = "";
            List<ResultadoTienda> listaRepuestos = new List<ResultadoTienda>();

            try
            {
                var handler = new HttpClientHandler();

                using (var client = new HttpClient(handler)) //uso de handler especial
                {
                    client.BaseAddress = new Uri(endpoint);
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Add("URI-Version", "v1");
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    var response = client.GetAsync($"?marcaCarro={marcaCarro}&modeloCarro={modeloCarro}"
                        + $"&añoCarro={añoCarro}&nombreRepuesto={nombreRepuesto}");

                    //obj = await response.Content.ReadAsStringAsync();
                    obj = await response.Result.Content.ReadAsStringAsync();
                    JObject j = JObject.Parse(obj);

                    if (response.Result.IsSuccessStatusCode)
                    {
                        var result = j.ToObject<Result<List<ResultadoTienda>>>();
                        listaRepuestos = result.Resultado;
                    }

                    return listaRepuestos;
                }
            }
            catch
            {
                return new List<ResultadoTienda>();
            }
        }
    }
}
