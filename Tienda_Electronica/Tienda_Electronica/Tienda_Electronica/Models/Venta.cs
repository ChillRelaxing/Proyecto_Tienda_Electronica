namespace Tienda_Electronica.Models
{
    public class Venta
    {
        //Modelo de ventas
        public int ID_Venta { get; set; }

        public DateTime FechaVenta { get; set; }

        public decimal Total_Venta { get; set; } //Double

        public string Descripcion_Venta { get; set; }

    }
}

