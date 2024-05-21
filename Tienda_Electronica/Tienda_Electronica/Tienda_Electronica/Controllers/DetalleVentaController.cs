using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.DetalleVentas;
using Tienda_Electronica.Repositories.Ventas;

namespace Tienda_Electronica.Controllers
{
    public class DetalleVentaController : Controller
    {
        private readonly IDetalleVentaRepository _detalleVentaRepository;

        //Validaciones
        //private readonly IValidator<Venta> _validator;

        public DetalleVentaController(

            IDetalleVentaRepository detalleVentaRepository

            //IValidator<Venta> validator
            )
        {
            _detalleVentaRepository = detalleVentaRepository;

            //_validator = validator;


        }

        // GET: DetalleVentaController
        public async Task<ActionResult> Index()
        {
            var detalleVentas = await _detalleVentaRepository.GetAllAsync();
            return View(detalleVentas);
        }

        // GET: DetalleVentaController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //GET: DetalleVentaController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: DetalleVentaController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(DetalleVenta detalleVenta)
        {
            try
            {
                await _detalleVentaRepository.AddAsync(detalleVenta);

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;

                return View(detalleVenta);
            }
        }

        // GET: DetalleVentaController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var detalleVenta = await _detalleVentaRepository.GetByIdAsync(id);

            if (detalleVenta == null)
                return NotFound();

            return View(detalleVenta);
        }

        // POST: DetalleVentaController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(DetalleVenta detalleVenta)
        {
            try
            {
                await _detalleVentaRepository.EditAsync(detalleVenta);

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;

                return View(detalleVenta);
            }
        }

        // GET: DetalleVentaController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var detalleVenta = await _detalleVentaRepository.GetByIdAsync(id);

            if (detalleVenta == null)
            {
                return NotFound();
            }

            return View(detalleVenta);
        }

        // POST: DetalleVentaController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(DetalleVenta detalleVenta)
        {
            try
            {
                await _detalleVentaRepository.DeleteAsync(detalleVenta.ID_DetalleVenta);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return View(detalleVenta);
            }
        }


    }
}
