using FluentValidation;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Validations
{
    public class CategoriaValidator : AbstractValidator<Categoria>
    {
        public CategoriaValidator()
        {
            RuleFor(categoria => categoria.Nombre_Categoria)
              .NotNull().WithMessage("El nombre de la categoria es obligatoria")
              .NotEmpty().WithMessage("El nombre de la categoria no debe estar vacío")
              .MinimumLength(3).WithMessage("El nombre de la categoria debe tener al menos 3 caracteres")
              .MaximumLength(100).WithMessage("El nombre de la categoria debe tener un máximo de 100 caracteres")
              .Matches(@"^[a-zA-Z\s]+$").WithMessage("El nombre de la categoria solo debe contener letras y espacios");

            RuleFor(categoria => categoria.Descripcion_Categoria)
             .NotNull().WithMessage("La descripcion de la categoria es obligatorio")
             .NotEmpty().WithMessage("La descripcion de la categoria no debe estar vacío")
             .MinimumLength(3).WithMessage("La descripcion de la categoria debe tener al menos 3 caracteres")
             .MaximumLength(100).WithMessage("La descripcion de la categoria debe tener un máximo de 100 caracteres")
             .Matches(@"^[a-zA-Z\s]+$").WithMessage("La descripcion de la categoria solo debe contener letras y espacios");

        }
    }
}