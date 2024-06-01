using System.ComponentModel.DataAnnotations;

namespace Tienda_Electronica.Models
{
    public class DetalleVenta
    {
        public int ID_DetalleVenta { get; set; }

        [Required(ErrorMessage = "La cantidad es obligatoria")]
        [Range(1, int.MaxValue, ErrorMessage = "La cantidad debe ser un número entero positivo")]
        [Display(Name = "Cantidad")]
        public int Cantidad { get; set; }

        [Required(ErrorMessage = "El subtotal es obligatorio")]
        [Range(0, double.MaxValue, ErrorMessage = "El subtotal no puede ser negativo")]
        [Display(Name = "Sub Total")]
        public decimal SubTotal { get; set; }

        [Required(ErrorMessage = "El precio unitario es obligatorio")]
        [Range(0.01, double.MaxValue, ErrorMessage = "El precio unitario debe ser mayor a 0")]
        [Display(Name = "Precio Unitario")]
        public decimal PrecioUnitario { get; set; }

        [Required(ErrorMessage = "La fecha de venta es obligatoria")]
        [Display(Name = "ID Venta")]
        public int ID_Venta { get; set; }

        [Required(ErrorMessage = "El nombre del producto es obligatorio")]
        [Display(Name = "ID Producto")]
        public int ID_Producto { get; set; }

        // Propiedades adicionales para mostrar en las vistas
        [Required(ErrorMessage = "La fecha de venta es obligatoria")]
        [Display(Name = "Fecha de Venta")]
        public DateTime FechaVenta { get; set; }

        [Required(ErrorMessage = "El nombre del producto es obligatorio")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El nombre del producto debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "El nombre del producto solo debe contener letras y espacios")]
        [Display(Name = "Nombre del Producto")]
        public string Nombre_Producto { get; set; }

    }

}
