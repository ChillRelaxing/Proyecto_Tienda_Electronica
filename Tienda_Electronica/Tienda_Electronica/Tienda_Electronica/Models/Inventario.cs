namespace Tienda_Electronica.Models
{
    public class Inventario
    {
        public int  ID_Inventario { get; set; }

        public int Cantidad { get; set; } 

        public DateTime FechaRegistro { get; set;}

        public int ID_Producto { get; set;}

        public Producto? Nombre_Producto { get; set; } //Captura datos del modelo Producto para obtener el Nombre_Producto

    }
}
