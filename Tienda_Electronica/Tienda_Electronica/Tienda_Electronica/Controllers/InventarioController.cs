using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.Categorias;
using Tienda_Electronica.Repositories.Inventarios;
using Tienda_Electronica.Repositories.Productos;

namespace Tienda_Electronica.Controllers
{
    public class InventarioController : Controller
    {
        private readonly IInventarioRepository _inventarioRepository;


        private readonly IProductoRepository _productoRepository;
        


        //Validaciones
        //private readonly IValidator<Venta> _validator;

        public InventarioController
            (
            IInventarioRepository inventarioRepository,

            IProductoRepository productoRepository
           

            //IValidator<Venta> validator
            )
        {
            _inventarioRepository = inventarioRepository;


            _productoRepository = productoRepository;
           


            //_validator = validator;
        }


        // GET: VentaController
        public async Task<ActionResult> Index()
        {
            var inventario = await _inventarioRepository.GetAllAsync();

            return View(inventario);
        }

        // GET: VentaController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: VentaController/Create

        // public ActionResult Create()
        public async Task<ActionResult> Create()
        {
            //-------------------
            var productos = await _productoRepository.GetAllAsync();
            ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto");
            //---------------------------
            return View();
        }

        // POST: VentaController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Inventario inventario)
        {
            try
            {
                await _inventarioRepository.AddAsync(inventario);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                //
                var productos = await _productoRepository.GetAllAsync();
                ViewBag.Categorias = new SelectList(productos, "ID_Producto", "Nombre_Producto");
                //

                return View(inventario);
            }
        }

        // GET: VentaController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var inventario = await _inventarioRepository.GetByIdAsync(id);

            if (inventario == null)
                return NotFound();

            //
            var productos = await _productoRepository.GetAllAsync();
            ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto", inventario.ID_Producto);
            //

            return View(inventario);
        }

        // POST: VentaController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken] 
        public async Task<ActionResult> Edit(Inventario inventario)
        {
            try
            {
                await _inventarioRepository.EditAsync(inventario);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                //
                var productos = await _productoRepository.GetAllAsync();
                ViewBag.Productos = new SelectList(productos, "ID_Producto", "Nombre_Producto", inventario.ID_Producto);
                //

                return View(inventario);
            }
        }




        // GET: VentaController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var inventario = await _inventarioRepository.GetByIdAsync(id);

            if (inventario == null)
            {
                return NotFound();
            }

            return View(inventario);

        }

        // POST: VentaController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete( Inventario inventario)
        {
            try
            {
                await _inventarioRepository.DeleteAsync(inventario.ID_Producto);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return View(inventario);
            }
        }
    }
}
