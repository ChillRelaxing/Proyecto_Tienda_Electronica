using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.Categorias;
using Tienda_Electronica.Repositories.Clientes;
using Tienda_Electronica.Services.Email;

namespace Tienda_Electronica.Controllers
{
    [Authorize]
    public class ClienteController : Controller
    {
        private readonly IClienteRepository _clienteRepository;
        //Validaciones
        //private readonly IValidator<Venta> _validator;

        //Nuevo
        private readonly IEmailService _emailService;


        public ClienteController(
            IClienteRepository clienteRepository,

            //nuevo
            IEmailService emailService

            //IValidator<Venta> validator
            )
        {
            _clienteRepository = clienteRepository;


            //nuevo
            _emailService = emailService;

            //
            //_validator = validator;
        }


        // GET: VentaController
        public async Task<ActionResult> Index()
        {
            var cliente = await _clienteRepository.GetAllAsync();

            return View(cliente);
        }

        // GET: VentaController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: VentaController/Create
        public async Task<ActionResult> Create()
        {
            
            var cliente = await _clienteRepository.GetAllAsync();
           
            return View();
        }

        // POST: VentaController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Cliente cliente)
        {
            try
            {
                await _clienteRepository.AddAsync(cliente);

                //nuevo
                // "Ramiro@gmail.com";
                string email = cliente.Email_Cliente;
                string subject = "Bienvenido";
                string body = "Bievenido a la tienda" + cliente.Nombre_Cliente;

                _emailService.SendEmail(email, cliente.Nombre_Cliente, subject, body);

                //

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                return View(cliente);
            }
        }


        // GET: VentaController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var cliente = await _clienteRepository.GetByIdAsync(id);

            if (cliente == null)
                return NotFound();

            return View(cliente);
        }

        // POST: VentaController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Cliente cliente)
        {
            try
            {
                await _clienteRepository.EditAsync(cliente);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View(cliente);
            }
        }

        // GET: VentaController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var cliente = await _clienteRepository.GetByIdAsync(id);

            if (cliente == null)
            {
                return NotFound();
            }

            return View(cliente);

        }

        // POST: VentaController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(Cliente cliente)
        {
            try
            {
                await _clienteRepository.DeleteAsync(cliente.ID_Cliente);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return View(cliente);
            }
        }
    }
}

