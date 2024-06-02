using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using Tienda_Electronica.Data;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.DetalleVentas;
using Tienda_Electronica.Repositories.Productos;
using Tienda_Electronica.Repositories.Ventas;
using Tienda_Electronica.Validations;

namespace Tienda_Electronica.Controllers
{
    [Authorize]
    public class DetalleVentaController : Controller
    {
        private readonly IDetalleVentaRepository _detalleVentaRepository;

        //
        private readonly IVentaRepository _ventaRepository;
        private readonly IProductoRepository _productoRepository;
        //

        //Validaciones
        private readonly IValidator<DetalleVenta> _detalleventaValidator;

        public DetalleVentaController(

            IDetalleVentaRepository detalleVentaRepository,

            IVentaRepository ventaRepository, //Nuevo
            IProductoRepository productoRepository, //Nuevo

            //Nuevo validaciones
            IValidator<DetalleVenta> detalleventaValidator
            //

            //IValidator<Venta> validator
            )
        {
            _detalleVentaRepository = detalleVentaRepository;

            //tegoria
            _ventaRepository = ventaRepository;
            _productoRepository = productoRepository;
            //

            //Validaciones
            _detalleventaValidator = detalleventaValidator;
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
        // public ActionResult Create()
        public async Task<ActionResult> Create()
        {
            //
            var ventas = await _ventaRepository.GetAllAsync();
            var productos = await _productoRepository.GetAllAsync();
            ViewBag.Ventas = new SelectList(ventas, "ID_Venta", "FechaVenta");
            ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto");
            //
            return View();
        }

        // POST: DetalleVentaController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(DetalleVenta detalleVenta)
        {
            //Validaciones
            ValidationResult validationResult = _detalleventaValidator.Validate(detalleVenta);

            try
            {
                await _detalleVentaRepository.AddAsync(detalleVenta);

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;

                //Nuevo
                var ventas = await _ventaRepository.GetAllAsync();
                var productos = await _productoRepository.GetAllAsync();
                ViewBag.Ventas = new SelectList(ventas, "ID_Venta", "FechaVenta");
                ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto");
                //

                //Validaciones
                validationResult.AddToModelState(this.ModelState);

                return View(detalleVenta);
            }
        }

        // GET: DetalleVentaController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var detalleVenta = await _detalleVentaRepository.GetByIdAsync(id);

            if (detalleVenta == null)
                return NotFound();

            //
            var ventas = await _ventaRepository.GetAllAsync();
            var productos = await _productoRepository.GetAllAsync();
            ViewBag.Ventas = new SelectList(ventas, "ID_Venta", "FechaVenta", detalleVenta.ID_Venta);
            ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto", detalleVenta.ID_Producto);
            //

            return View(detalleVenta);
        }

        // POST: DetalleVentaController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(DetalleVenta detalleVenta)
        {
            //Validacion
            var validationResult = _detalleventaValidator.Validate(detalleVenta);

            try
            {
                await _detalleVentaRepository.EditAsync(detalleVenta);

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                ViewBag.Error = ex.Message;

                //
                var ventas = await _ventaRepository.GetAllAsync();
                var productos = await _productoRepository.GetAllAsync();
                ViewBag.Ventas = new SelectList(ventas, "ID_Venta", "FechaVenta", detalleVenta.ID_Venta);
                ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto", detalleVenta.ID_Producto);
                //

                //Validaciones
                validationResult.AddToModelState(this.ModelState);

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

        //NUEVO
        // Acción para obtener el precio del producto
        [HttpGet]
        public async Task<JsonResult> GetProductPrice(int id)
        {
            var producto = await _productoRepository.GetByIdAsync(id);
            if (producto != null)
            {
                return Json(producto.PrecioUnitario);
            }
            return Json(0);
        }

    }
}
