using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CompraDetalle
    {
        public int IdCompraDetalle { get; set; }
        public Producto Producto { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }

        //public int IdCompraDetalle;
        //public Producto Producto;
        //public int Cantidad;
        //public decimal PrecioUnitario;
    }
}
