using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tiendas.Entities
{
    public class Result<T>
    {
        public T Resultado { get; set; }
        public string Mensaje { get; set; }
        public string Codigo { get; set; }
    }
}
