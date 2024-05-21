using FluentValidation;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.DetalleVentas;
using Tienda_Electronica.Repositories.Ventas;

namespace Tienda_Electronica.Controllers
{
    public class VentaController : Controller
    {
        private readonly IVentaRepository _ventaRepository;

        //Validaciones
        //private readonly IValidator<Venta> _validator;

        public VentaController(
            IVentaRepository ventaRepository

            //IValidator<Venta> validator
            )
        {
            _ventaRepository = ventaRepository;
            //
            //_validator = validator;

        }
        // GET: VentaController
        public async Task<ActionResult> Index()
        {
            var venta = await _ventaRepository.GetAllAsync();

            return View(venta);
        }

        // GET: VentaController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }
       
        // GET: VentaController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: VentaController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Venta venta)
        {
            try
            {
                await _ventaRepository.AddAsync(venta);

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;

                return View(venta);
            }
        }

        // GET: VentaController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var venta = await _ventaRepository.GetByIdAsync(id);

            if (venta == null)
                return NotFound();

            return View(venta);
        }

        // POST: VentaController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Venta venta)
        {
            try
            {
                await _ventaRepository.EditAsync(venta);

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;

                return View(venta);
            }
        }

        // GET: VentaController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var venta = await _ventaRepository.GetByIdAsync(id);

            if (venta == null)
            {
                return NotFound();
            }

            return View(venta);

        }

        // POST: VentaController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(Venta venta)
        {
            try
            {
                await _ventaRepository.DeleteAsync(venta.ID_Venta);

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                return View(venta);
            }
        }
    }
}
