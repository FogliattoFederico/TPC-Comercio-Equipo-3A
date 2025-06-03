using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Venta
    {
        public int IdVenta;
        public DateTime Fecha;
        public Cliente Cliente;
        public Usuario Usuario; /**/
        public List<VentaDetalle> Detalles;
    }
}
