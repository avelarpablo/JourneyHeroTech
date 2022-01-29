using Tiendas.DAL;
using Tiendas.Entities;

namespace Tiendas.BL
{
    public class RepuestosBL
    {
        public static async Task<List<ResultadoTienda>> SolicitarDisponibilidad(string dbConn,
            string marcaCarro, string modeloCarro, string añoCarro, string nombreRepuesto)
        {
            try
            {
                var result = await RepuestosDAL.SolicitarDisponibilidad(dbConn, marcaCarro,
                    modeloCarro, añoCarro, nombreRepuesto);
                return result;
            }
            catch (Exception _ex)
            {
                return new List<ResultadoTienda>();
            }
        }
    }
}