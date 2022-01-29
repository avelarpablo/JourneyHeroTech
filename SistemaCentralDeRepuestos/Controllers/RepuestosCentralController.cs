using Microsoft.AspNetCore.Mvc;
using Tiendas.BL;
using Tiendas.Entities;

namespace SistemaCentralDeRepuestos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RepuestosCentralController : ControllerBase
    {
        private IConfiguration configuration;

        public RepuestosCentralController(IConfiguration iConfig)
        {
            configuration = iConfig;
        }

        // GET: api/<RepuestosController>
        [HttpGet]
        public async Task<object> SolicitarDisponibilidadRepuestos(
            [FromQuery] string marcaCarro,
            [FromQuery] string modeloCarro,
            [FromQuery] string añoCarro,
            [FromQuery] string nombreRepuesto,
            [FromQuery] double latitudCliente,
            [FromQuery] double longitudCliente)
        {
            try
            {
                // Obtener cadena de conexion
                string dbConn = configuration.GetValue<string>("Data:ConectionString");

                // Obtener endpoints
                Dictionary<string, string> endpoints = new Dictionary<string, string>();
                endpoints = configuration.GetSection("Data:Endpoints").GetChildren()
                    .ToDictionary(value => value.Key, value => value.Value);

                var response = await TiendasBL.SolicitarDisponibilidad(dbConn, endpoints, marcaCarro,
                    modeloCarro,  añoCarro, nombreRepuesto, latitudCliente, longitudCliente);

                return response;
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
