namespace Tienda_Electronica.Models
{
    public class DetalleVenta
    {
        public int ID_DetalleVenta { get; set; }

        public int Cantidad { get; set; }

        public decimal SubTotal { get; set; }

        public decimal PrecioUnitario { get; set; }

        public int ID_Venta { get; set; }

        public int ID_Producto { get; set; }

       //Propiedades adicionales para mostrar en las vistas
        public DateTime FechaVenta { get; set; }

        public string Nombre_Producto { get; set; }

    }

}
