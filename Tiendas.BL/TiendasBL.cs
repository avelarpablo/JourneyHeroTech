using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tiendas.DAL;
using Tiendas.Entities;

namespace Tiendas.BL
{
    public class TiendasBL
    {
        private static async Task<List<Tienda>> ObtenerTiendasPorCercania(string dbConn,
            double latitudCliente, double longitudCliente)
        {
            try
            {
                var result = await TiendasDAL.ObtenerTiendasPorCercania(dbConn, latitudCliente,
                    longitudCliente);
                return result;
            }
            catch (Exception _ex)
            {
                return new List<Tienda>();
            }
        }

        private static async Task<List<ResultadoTienda>> SolicitarDisponibilidadATienda(string endpoint,
            string marcaCarro, string modeloCarro, string añoCarro, string nombreRepuesto)
        {
            try
            {
                var result = await TiendasDAL.SolicitarDisponibilidadATienda(endpoint, marcaCarro,
                    modeloCarro, añoCarro, nombreRepuesto);
                return result;
            }
            catch (Exception _ex)
            {
                return new List<ResultadoTienda>();
            }
        }

        public static async Task<List<ResultadoFinal>> SolicitarDisponibilidad(string dbConn,
            Dictionary<string, string> endpoints, string marcaCarro, string modeloCarro, string añoCarro,
            string nombreRepuesto,  double latitudCliente, double longitudCliente)
        {            
            try
            {
                // Obtener tiendas
                List<Tienda> listaTiendas = await TiendasBL.ObtenerTiendasPorCercania(dbConn, latitudCliente,
                    longitudCliente);

                List<ResultadoFinal> result = new List<ResultadoFinal>();

                foreach (Tienda tienda in listaTiendas)
                {
                    string enpoint = endpoints[tienda.Nombre];

                    List<ResultadoTienda> listaRepuestos = await TiendasBL.SolicitarDisponibilidadATienda(
                        enpoint, marcaCarro, modeloCarro, añoCarro, nombreRepuesto);

                    foreach (ResultadoTienda resultadoTienda in listaRepuestos)
                    {
                        ResultadoFinal tmpResult = new ResultadoFinal();
                        tmpResult.Tienda = tienda;
                        tmpResult.Vehiculo = resultadoTienda.Vehiculo;
                        tmpResult.Repuesto = resultadoTienda.Repuesto;

                        result.Add(tmpResult);
                    }
                }

                return result;
            }
            catch (Exception ex)
            {
                return new List<ResultadoFinal>();
            }
        }
    }
}
