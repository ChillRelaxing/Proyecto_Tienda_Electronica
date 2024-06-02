using System.ComponentModel.DataAnnotations;

namespace Tienda_Electronica.Models
{
    public class Cliente
    {
        //Modelo Cliente
        [Required(ErrorMessage = "El nombre del cliente es obligatorio")]
        [Display(Name = "ID Cliente")]
        public int ID_Cliente { get; set; }


        [Required(ErrorMessage = "El nombre del cliente es obligatorio")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El nombre del cliente debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "El nombre del cliente solo debe contener letras y espacios")]
        [Display(Name = "Nombre del Cliente")]
        public string Nombre_Cliente { get; set; }



        [Required(ErrorMessage = "la dirección del cliente es obligatorio")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "La dirección del cliente debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "La dirección del cliente solo debe contener letras y espacios")]
        [Display(Name = "La dirección del Cliente")]
        public string Direccion_Cliente { get; set; }


        [Required(ErrorMessage = "El telefono de cliente es obligatorio")]
        [StringLength(100, MinimumLength = 8, ErrorMessage = "El telefono del cliente debe tener entre 8 y 100 caracteres")]
        [RegularExpression(@"^[0-9\s]+$", ErrorMessage = "El telefono del cliente solo debe contener numeros y espacios")]
        [Display(Name = "Telefono del Cliente")]
        public string Telefono_Cliente { get; set; }


        [Required(ErrorMessage = "El correo del cliente es obligatorio")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El correo del cliente debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "El correo del cliente solo debe contener letras y espacios")]
        [Display(Name = "Correo del Cliente")]
        public string Email_Cliente { get; set; }

    }
}
