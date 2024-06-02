using System.ComponentModel.DataAnnotations;
namespace Tienda_Electronica.Models
{
    public class Categoria 
    {
        [Required(ErrorMessage = "La categoria es obligatorio")]
        [Display(Name = "ID Categoria")]
        public int ID_Categoria { get; set; }


        [Required(ErrorMessage = "El nombre de la categoria es obligatorio")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El nombre de la categoria debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "El nombre de la categoria solo debe contener letras y espacios")]
        [Display(Name = "Nombre de la Categoria")]
        public string Nombre_Categoria { get; set; }


        [Required(ErrorMessage = "La descripción de la categoria es obligatoria")]
        [StringLength(100, MinimumLength = 5, ErrorMessage = "La descripción de la categoria debe tener entre 5 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "La descripción de la categoria solo debe contener letras y espacios")]
        [Display(Name = "Descripción de la Categoria")]
        public string Descripcion_Categoria { get; set; }

    }
}
