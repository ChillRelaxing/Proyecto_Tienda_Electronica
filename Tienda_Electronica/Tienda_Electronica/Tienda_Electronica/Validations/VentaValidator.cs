using FluentValidation;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Validations
{
    public class VentaValidator : AbstractValidator<Venta>
    {
        public VentaValidator()
        {
            RuleFor(venta => venta.FechaVenta)
               .NotNull().WithMessage("La fecha de venta es obligatoria")
               .NotEmpty().WithMessage("Debe proporcionar una fecha de venta");


            RuleFor(venta => venta.Descripcion_Venta)
               .NotNull().WithMessage("Descripción de venta es obligatorio")
               .NotEmpty().WithMessage("Descripción de venta no debe estar vacío")
               .MinimumLength(3).WithMessage("Descripción de venta debe tener al menos 3 caracteres")
               .MaximumLength(100).WithMessage("Descripción de venta debe tener un máximo de 100 caracteres")
               .Matches(@"^[a-zA-Z\s]+$").WithMessage("Descripción de venta solo debe contener letras y espacios");

            RuleFor(venta => venta.ID_Cliente)
               .NotNull().WithMessage("El nombre del cliente es obligatorio")
               .NotEmpty().WithMessage("El nombre del cliente no debe estar vacío");

        }
    }
}
