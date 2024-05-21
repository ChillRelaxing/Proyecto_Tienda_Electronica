namespace Tienda_Electronica.Models
{
    public class Precio
    {
        public int ID_Precio { get; set; }

        public decimal PrecioUnitario { get; set; }

        public int ID_Producto { get; set; }

        public Producto? Nombre_Producto { get; set; } //Captura datos del modelo Producto para obtener el Nombre_Producto

    }
}
