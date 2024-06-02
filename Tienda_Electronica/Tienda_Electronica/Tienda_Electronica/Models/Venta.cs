using System.ComponentModel.DataAnnotations;

namespace Tienda_Electronica.Models
{
    public class Venta
    {
        //Modelo de ventas
        [Required(ErrorMessage = "La venta es obligatoria")]
        [Display(Name = "ID Venta")]
        public int ID_Venta { get; set; }



        [Required(ErrorMessage = "La fecha de venta es obligatoria")]
        [Display(Name = "Fecha de Venta")]
        public DateTime FechaVenta { get; set; }



        [Required(ErrorMessage = "El Total de venta es obligatorio")]
        [Range(0.01, double.MaxValue, ErrorMessage = "El Total de venta debe ser mayor a 0")]
        [Display(Name = "El Total de venta")]
        public decimal Total_Venta { get; set; } //Double




        [Required(ErrorMessage = "Descripción de venta es obligatoria")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "Descripción de venta debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "Descripción de venta solo debe contener letras y espacios")]
        [Display(Name = "Descripción de venta")]
        public string Descripcion_Venta { get; set; }


        [Required(ErrorMessage = "La fecha de venta es obligatoria")]
        [Display(Name = "ID Cliente")]
        public int ID_Cliente { get; set; }//Añadido


        [Required(ErrorMessage = "El nombre del cliente es obligatorio")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El nombre del cliente debe tener entre 3 y 100 caracteres")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "El nombre del cliente solo debe contener letras y espacios")]
        [Display(Name = "Nombre del Cliente")]
        public string Nombre_Cliente { get; set; } //Añadido

    }
}

