using FluentValidation;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Validations
{
    public class ProductoValidator : AbstractValidator<Producto>
    {

        public ProductoValidator()
        {
            RuleFor(Producto => Producto.ID_Producto)
                .NotNull().WithMessage("El nombre del producto es obligatorio")
                .NotEmpty().WithMessage("El nombre del producto no debe estar vacío");

            RuleFor(Producto => Producto.Nombre_Producto)
               .NotNull().WithMessage("El nombre del producto es obligatorio")
               .NotEmpty().WithMessage("El nombre del producto no debe estar vacío")
               .MinimumLength(3).WithMessage("El nombre del producto debe tener al menos 3 caracteres")
               .MaximumLength(100).WithMessage("El nombre del producto debe tener un máximo de 100 caracteres")
               .Matches(@"^[a-zA-Z\s]+$").WithMessage("El nombre del producto solo debe contener letras y espacios");

            RuleFor(Producto => Producto.PrecioUnitario)
               .NotNull().WithMessage("El Precio Unitario es obligatorio")
               .GreaterThanOrEqualTo(0).WithMessage("El Precio Unitario no puede ser negativo");

            RuleFor(Producto => Producto.ID_Categoria)
               .NotNull().WithMessage("Este campo es obligatoria")
               .NotEmpty().WithMessage("Este campo no debe estar vacía");

        }




    }


}
