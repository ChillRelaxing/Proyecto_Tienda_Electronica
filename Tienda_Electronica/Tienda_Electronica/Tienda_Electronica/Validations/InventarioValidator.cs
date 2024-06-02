using FluentValidation;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Validations
{
    public class InventarioValidator : AbstractValidator<Inventario>
    {
        public  InventarioValidator ()
        {
            RuleFor(inventario => inventario.Cantidad)
                .NotNull().WithMessage("La cantidad es obligatoria")
                .GreaterThan(0).WithMessage("La cantidad debe ser mayor a 0")
                .Must(cantidad => cantidad.ToString().All(char.IsDigit))
                .WithMessage("La cantidad debe ser un número entero válido");


            RuleFor(inventario => inventario.ID_Inventario)
                .NotNull().WithMessage("El nombre del producto es obligatorio")
                .NotEmpty().WithMessage("El nombre del producto no debe estar vacío");

            RuleFor(inventario => inventario.FechaRegistro)
              .NotNull().WithMessage("La fecha de registro es obligatoria")
              .NotEmpty().WithMessage("Debe proporcionar una fecha de venta");


        }
    }
}

