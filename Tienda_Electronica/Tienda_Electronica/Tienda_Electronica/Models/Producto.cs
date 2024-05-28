namespace Tienda_Electronica.Models
{
    public class Producto
    {
        public int ID_Producto { get; set; }

        public string Nombre_Producto { get; set; }

        public string Descripcion_Producto { get; set; }

        public decimal PrecioUnitario { get; set; }  //Nuevo -----------

        public int ID_Categoria { get; set; }

        public string Nombre_Categoria { get; set; }

        //public Categoria? Nombre_Categoria { get; set; } //Captura datos del modelo Categoria para obtener el Nombre

    }
}
