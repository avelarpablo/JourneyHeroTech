using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tiendas.Entities
{
    public class ResultadoFinal : ResultadoTienda
    {
        public Tienda Tienda { get; set; } = new Tienda();
    }
}
