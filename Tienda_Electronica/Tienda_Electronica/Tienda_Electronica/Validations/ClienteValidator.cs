using FluentValidation;
using Tienda_Electronica.Models;
namespace Tienda_Electronica.Validations
{
    public class ClienteValidator : AbstractValidator<Cliente>
    {
        public ClienteValidator()
        {

            RuleFor(cliente => cliente.Nombre_Cliente)
              .NotNull().WithMessage("El nombre del cliente es obligatorio")
              .NotEmpty().WithMessage("El nombre del cliente no debe estar vacío")
              .MinimumLength(3).WithMessage("El nombre del cliente debe tener al menos 3 caracteres")
              .MaximumLength(100).WithMessage("El nombre del cliente debe tener un máximo de 100 caracteres")
              .Matches(@"^[a-zA-Z\s]+$").WithMessage("El nombre del cliente solo debe contener letras y espacios");


            RuleFor(cliente => cliente.Direccion_Cliente)
              .NotNull().WithMessage("La dirección del cliente es obligatoria")
              .NotEmpty().WithMessage("La dirección del cliente no debe estar vacío")
              .MinimumLength(3).WithMessage("La dirección del cliente debe tener al menos 3 caracteres")
              .MaximumLength(100).WithMessage("La dirección del cliente debe tener un máximo de 100 caracteres")
              .Matches(@"^[a-zA-Z\s]+$").WithMessage("La dirección del cliente solo debe contener letras y espacios");

            RuleFor(cliente => cliente.Telefono_Cliente)
                .NotNull().WithMessage("El teléfono del cliente es obligatorio")
                .NotEmpty().WithMessage("El teléfono del cliente no debe estar vacío")
                .MinimumLength(3).WithMessage("El teléfono del cliente debe tener al menos 3 caracteres")
                .MaximumLength(10).WithMessage("El teléfono del cliente debe tener un máximo de 10 caracteres")
                .Matches(@"^[0-9-]+$").WithMessage("El teléfono del cliente solo debe contener números y guiones");

            RuleFor(cliente => cliente.Email_Cliente)
                .NotNull().WithMessage("El correo del cliente es obligatorio")
                .NotEmpty().WithMessage("El correo del cliente no debe estar vacío")
                .MinimumLength(3).WithMessage("El correo del cliente debe tener al menos 3 caracteres")
                .MaximumLength(100).WithMessage("El correo del cliente debe tener un máximo de 100 caracteres")
                .EmailAddress().WithMessage("El correo del cliente debe ser una dirección de correo electrónico válida");



        }
    }
}
