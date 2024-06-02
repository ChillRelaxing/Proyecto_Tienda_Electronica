using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.Inventarios;
using Tienda_Electronica.Repositories.Productos;
using System.Threading.Tasks;

namespace Tienda_Electronica.Controllers
{
    [Authorize]
    public class InventarioController : Controller
    {
        private readonly IInventarioRepository _inventarioRepository;
        private readonly IProductoRepository _productoRepository;

        public InventarioController(IInventarioRepository inventarioRepository, IProductoRepository productoRepository)
        {
            _inventarioRepository = inventarioRepository;
            _productoRepository = productoRepository;
        }

        // GET: InventarioController
        public async Task<ActionResult> Index()
        {
            var inventarios = await _inventarioRepository.GetAllAsync();
            return View(inventarios);
        }

        // GET: InventarioController/Details/5
        public async Task<ActionResult> Details(int id)
        {
            var inventario = await _inventarioRepository.GetByIdAsync(id);
            if (inventario == null)
            {
                return NotFound();
            }
            return View(inventario);
        }

        // GET: InventarioController/Create
        public async Task<ActionResult> Create()
        {
            var productos = await _productoRepository.GetAllAsync();
            ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto");
            return View();
        }

        // POST: InventarioController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Inventario inventario)
        {
            if (!ModelState.IsValid)
            {
                var productos = await _productoRepository.GetAllAsync();
                ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto");
                return View(inventario);
            }

            try
            {
                await _inventarioRepository.AddAsync(inventario);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                var productos = await _productoRepository.GetAllAsync();
                ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto");
                return View(inventario);
            }
        }

        // GET: InventarioController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var inventario = await _inventarioRepository.GetByIdAsync(id);
            if (inventario == null)
            {
                return NotFound();
            }

            var productos = await _productoRepository.GetAllAsync();
            ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto", inventario.ID_Producto);
            return View(inventario);
        }

        // POST: InventarioController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Inventario inventario)
        {
            if (!ModelState.IsValid)
            {
                var productos = await _productoRepository.GetAllAsync();
                ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto", inventario.ID_Producto);
                return View(inventario);
            }

            try
            {
                await _inventarioRepository.EditAsync(inventario);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                var productos = await _productoRepository.GetAllAsync();
                ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto", inventario.ID_Producto);
                return View(inventario);
            }
        }

        // GET: InventarioController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var inventario = await _inventarioRepository.GetByIdAsync(id);
            if (inventario == null)
            {
                return NotFound();
            }
            return View(inventario);
        }

        // POST: InventarioController/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            try
            {
                await _inventarioRepository.DeleteAsync(id);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                var inventario = await _inventarioRepository.GetByIdAsync(id);
                return View("Delete", inventario);
            }
        }
    }
}
