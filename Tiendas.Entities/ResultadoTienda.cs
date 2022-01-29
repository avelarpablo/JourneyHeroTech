using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tiendas.Entities
{
    public class ResultadoTienda
    {
        public Vehiculo Vehiculo { get; set; } = new Vehiculo();
        public Repuesto Repuesto { get; set; } = new Repuesto();
    }
}
