using System.ComponentModel.DataAnnotations;

namespace Tienda_Electronica.Models
{
    public class Producto

    {
        [Required(ErrorMessage = "ID del producto es obligatoria")]
        [Display(Name = "ID_Producto")]
        public int ID_Producto { get; set; }


        [Required(ErrorMessage = "El nombre del producto es obligatorio")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El nombre del producto debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "El nombre del producto solo debe contener letras y espacios")]
        [Display(Name = "Nombre del Producto")]
        public string Nombre_Producto { get; set; }



        [Required(ErrorMessage = "La descripción del producto es obligatorio")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "La descripción del producto debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "La descripción del producto solo debe contener letras y espacios")]
        [Display(Name = "Descripción del Producto")]
        public string Descripcion_Producto { get; set; }


        [Required(ErrorMessage = "El precio unitario es obligatorio")]
        [Range(0.01, double.MaxValue, ErrorMessage = "El precio unitario debe ser mayor a 0")]
        [Display(Name = "Precio Unitario")]
        public decimal PrecioUnitario { get; set; }  //Nuevo -----------



        [Required(ErrorMessage = "La categoria del producto es obligatoria")]
        [Display(Name = "ID Categoria")]
        public int ID_Categoria { get; set; }



        [Required(ErrorMessage = "El nombre de la categoria es obligatoria")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El nombre del producto debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "El nombre del producto solo debe contener letras y espacios")]
        [Display(Name = "Nombre del Producto")]
        public string Nombre_Categoria { get; set; }

        //public Categoria? Nombre_Categoria { get; set; } //Captura datos del modelo Categoria para obtener el Nombre

    }
}
