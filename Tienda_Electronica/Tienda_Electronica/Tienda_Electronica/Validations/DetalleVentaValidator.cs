using FluentValidation;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Validations
{
    public class DetalleVentaValidator : AbstractValidator<DetalleVenta>
    {
        public DetalleVentaValidator()
        {
            // Validar que Cantidad sea mayor que 0, obligatorio y solo números enteros
            RuleFor(detalleVenta => detalleVenta.Cantidad)
                .NotNull().WithMessage("La cantidad es obligatoria")
                .GreaterThan(0).WithMessage("La cantidad debe ser mayor a 0")
                .Must(cantidad => cantidad.ToString().All(char.IsDigit))
                .WithMessage("La cantidad debe ser un número entero válido");

            // Validar que SubTotal no sea negativo y obligatorio
            RuleFor(detalleVenta => detalleVenta.SubTotal)
                .NotNull().WithMessage("El subtotal es obligatorio")
                .GreaterThanOrEqualTo(0).WithMessage("El subtotal no puede ser negativo");

            // Validar que PrecioUnitario sea mayor que 0 y obligatorio
            RuleFor(detalleVenta => detalleVenta.PrecioUnitario)
                .NotNull().WithMessage("El precio unitario es obligatorio")
                .GreaterThan(0).WithMessage("El precio unitario debe ser mayor a 0");

            // Validar que ID_Venta sea mayor que 0 y obligatorio
            RuleFor(detalleVenta => detalleVenta.ID_Venta)
                .NotNull().WithMessage("La fecha de venta es obligatoria")
                .NotEmpty().WithMessage("La fecha no debe estar vacía");

            // Validar que ID_Producto sea mayor que 0 y obligatorio
            RuleFor(detalleVenta => detalleVenta.ID_Producto)
                .NotNull().WithMessage("El nombre del producto es obligatorio")
                .NotEmpty().WithMessage("El nombre del producto no debe estar vacío");
            
            // Validar que FechaVenta no esté vacía y sea obligatoria
            RuleFor(detalleVenta => detalleVenta.FechaVenta)
                .NotNull().WithMessage("La fecha de venta es obligatoria")
                .NotEmpty().WithMessage("Debe proporcionar una fecha de venta");

            // Validar que Nombre_Producto no esté vacío, tenga longitud mínima y máxima, y sea obligatorio
            RuleFor(detalleVenta => detalleVenta.Nombre_Producto)
                .NotNull().WithMessage("El nombre del producto es obligatorio")
                .NotEmpty().WithMessage("El nombre del producto no debe estar vacío")
                .MinimumLength(3).WithMessage("El nombre del producto debe tener al menos 3 caracteres")
                .MaximumLength(100).WithMessage("El nombre del producto debe tener un máximo de 100 caracteres")
                .Matches(@"^[a-zA-Z\s]+$").WithMessage("El nombre del producto solo debe contener letras y espacios");


        }
    }
}
