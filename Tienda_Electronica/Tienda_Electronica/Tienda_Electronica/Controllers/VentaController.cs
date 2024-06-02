using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.Clientes;
using Tienda_Electronica.Repositories.Ventas;
using Tienda_Electronica.Validations;

namespace Tienda_Electronica.Controllers
{
    [Authorize]
    public class VentaController : Controller
    {
        private readonly IVentaRepository _ventaRepository;
        private readonly IClienteRepository _clienteRepository;
        private readonly IValidator<Venta> _ventavalidator;

        public VentaController(
            IVentaRepository ventaRepository,
            IClienteRepository clienteRepository,
            IValidator<Venta> ventavalidator
        )
        {
            _ventaRepository = ventaRepository;
            _clienteRepository = clienteRepository;
            _ventavalidator = ventavalidator;
        }

        // GET: VentaController
        public async Task<ActionResult> Index()
        {
            var venta = await _ventaRepository.GetAllAsync();
            return View(venta);
        }

        // GET: VentaController/Details/5
        public async Task<ActionResult> Details(int id)
        {
            var venta = await _ventaRepository.GetByIdAsync(id);
            if (venta == null)
                return NotFound();
            return View(venta);
        }

        // GET: VentaController/Create
        public async Task<ActionResult> Create()
        {
            ViewData["ID_Cliente"] = new SelectList(await _clienteRepository.GetAllAsync(), "ID_Cliente", "Nombre_Cliente");
            return View();
        }

        // POST: VentaController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Venta venta)
        {
            ValidationResult validationResult = _ventavalidator.Validate(venta);
            if (!validationResult.IsValid)
            {
                validationResult.AddToModelState(this.ModelState);
                ViewData["ID_Cliente"] = new SelectList(await _clienteRepository.GetAllAsync(), "ID_Cliente", "Nombre_Cliente", venta.ID_Cliente);
                return View(venta);
            }

            try
            {
                await _ventaRepository.AddAsync(venta);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                ViewData["ID_Cliente"] = new SelectList(await _clienteRepository.GetAllAsync(), "ID_Cliente", "Nombre_Cliente", venta.ID_Cliente);
                return View(venta);
            }
        }

        // GET: VentaController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var venta = await _ventaRepository.GetByIdAsync(id);
            if (venta == null)
                return NotFound();

            ViewData["ID_Cliente"] = new SelectList(await _clienteRepository.GetAllAsync(), "ID_Cliente", "Nombre_Cliente", venta.ID_Cliente);
            return View(venta);
        }

        // POST: VentaController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Venta venta)
        {
            ValidationResult validationResult = _ventavalidator.Validate(venta);
            if (!validationResult.IsValid)
            {
                validationResult.AddToModelState(this.ModelState);
                ViewData["ID_Cliente"] = new SelectList(await _clienteRepository.GetAllAsync(), "ID_Cliente", "Nombre_Cliente", venta.ID_Cliente);
                return View(venta);
            }

            try
            {
                await _ventaRepository.EditAsync(venta);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                ViewData["ID_Cliente"] = new SelectList(await _clienteRepository.GetAllAsync(), "ID_Cliente", "Nombre_Cliente", venta.ID_Cliente);
                return View(venta);
            }
        }

        // GET: VentaController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var venta = await _ventaRepository.GetByIdAsync(id);
            if (venta == null)
                return NotFound();
            return View(venta);
        }

        // POST: VentaController/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            try
            {
                await _ventaRepository.DeleteAsync(id);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                var venta = await _ventaRepository.GetByIdAsync(id);
                if (venta == null)
                    return NotFound();
                return View(venta);
            }
        }
    }
}
