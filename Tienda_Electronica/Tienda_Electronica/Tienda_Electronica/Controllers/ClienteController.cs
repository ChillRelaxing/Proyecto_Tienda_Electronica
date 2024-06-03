using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.Clientes;
using Tienda_Electronica.Services.Email;
using System.Threading.Tasks;
using FluentValidation;
using Tienda_Electronica.Validations;
using FluentValidation.Results;

namespace Tienda_Electronica.Controllers
{
    [Authorize]
    public class ClienteController : Controller
    {
        private readonly IClienteRepository _clienteRepository;
        private readonly IEmailService _emailService;

        private readonly IValidator<Cliente> _clienteValidator;
        public ClienteController(IClienteRepository clienteRepository, IEmailService emailService, IValidator<Cliente> clienteValidator)
        {
            _clienteRepository = clienteRepository;
            _emailService = emailService;
            _clienteValidator = clienteValidator;
        }

        // GET: ClienteController
        public async Task<ActionResult> Index()
        {
            var clientes = await _clienteRepository.GetAllAsync();
            return View(clientes);
        }

        // GET: ClienteController/Details/5
        public async Task<ActionResult> Details(int id)
        {
            var cliente = await _clienteRepository.GetByIdAsync(id);
            if (cliente == null)
            {
                return NotFound();
            }
            return View(cliente);
        }

        // GET: ClienteController/Create
        public async Task<ActionResult> Create()
        {
            var clientes = await _clienteRepository.GetAllAsync();
            ViewBag.Clientes = new SelectList(clientes, "ID_Cliente", "Nombre_Cliente");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Cliente cliente)
        {
            //Validaciones
            ValidationResult validationResult = _clienteValidator.Validate(cliente);

            try
            {
                await _clienteRepository.AddAsync(cliente);

                // Enviar correo electrónico
                string email = cliente.Email_Cliente;
                string subject = "Bienvenido";
                string body = $"Bienvenido a la tienda" + cliente.Nombre_Cliente;

                _emailService.SendEmail(email, cliente.Nombre_Cliente, subject, body);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                validationResult.AddToModelState(this.ModelState);

                return View(cliente);
            }
        }

        // GET: ClienteController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var cliente = await _clienteRepository.GetByIdAsync(id);
            if (cliente == null)
            {
                return NotFound();
            }
            return View(cliente);
        }

        // POST: ClienteController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Cliente cliente)
        {
            var validationResult = _clienteValidator.Validate(cliente);

            try
            {
                await _clienteRepository.EditAsync(cliente);

                return RedirectToAction(nameof(Index));

            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                validationResult.AddToModelState(this.ModelState);

                return View(cliente);
            }
        }

        // GET: ClienteController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var cliente = await _clienteRepository.GetByIdAsync(id);
            if (cliente == null)
            {
                return NotFound();
            }
            return View(cliente);
        }

        // POST: ClienteController/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            try
            {
                await _clienteRepository.DeleteAsync(id);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                var cliente = await _clienteRepository.GetByIdAsync(id);
                return View("Delete", cliente);
            }
        }
    }
}
