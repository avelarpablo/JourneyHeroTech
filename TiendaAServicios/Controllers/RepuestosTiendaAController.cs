using Microsoft.AspNetCore.Mvc;
using Tiendas.BL;
using Tiendas.Entities;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TiendaAServicios.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RepuestosTiendaAController : ControllerBase
    {
        private IConfiguration configuration;

        public RepuestosTiendaAController(IConfiguration iConfig)
        {
            configuration = iConfig;
        }

        // GET: api/<RepuestosController>
        [HttpGet]
        public async Task<object> SolicitarDisponibilidadRepuestos(
            [FromQuery] string marcaCarro,
            [FromQuery] string modeloCarro,
            [FromQuery] string añoCarro,
            [FromQuery] string nombreRepuesto)
        {
            var response = new Result<List<ResultadoTienda>>();
            try
            {
                string dbConn = configuration.GetValue<string>("Data:ConectionString");
                var result = await RepuestosBL.SolicitarDisponibilidad(dbConn, marcaCarro, modeloCarro,
                    añoCarro, nombreRepuesto);

                response.Resultado = result;
                response.Codigo = "00";
                response.Mensaje = "Transaccion Exitosa";
                return response;
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
