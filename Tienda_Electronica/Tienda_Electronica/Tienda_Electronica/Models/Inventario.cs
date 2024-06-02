using System.ComponentModel.DataAnnotations;

namespace Tienda_Electronica.Models
{
    public class Inventario
    {
        [Required(ErrorMessage = "El inventarios es obligatorio")]
        [Display(Name = "ID Inventario")]
        public int  ID_Inventario { get; set; }


        [Required(ErrorMessage = "La cantidad es obligatoria")]
        [Range(1, int.MaxValue, ErrorMessage = "La cantidad debe ser un número entero positivo")]
        [Display(Name = "Cantidad")]
        public int Cantidad { get; set; }


        [Required(ErrorMessage = "La fecha de inventario es obligatoria")]
        [Display(Name = "Fecha de Registro")]
        public DateTime FechaRegistro { get; set;}

        [Required(ErrorMessage = "El nombre del producto es obligatorio")]
        [Display(Name = "ID Producto")]
        public int ID_Producto { get; set;}


        [Required(ErrorMessage = "El nombre del producto es obligatorio")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El nombre del producto debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "El nombre del producto solo debe contener letras y espacios")]
        [Display(Name = "Nombre del Producto")]
        public string? Nombre_Producto { get; set; } //Captura datos del modelo Producto para obtener el Nombre_Producto

    }
}
