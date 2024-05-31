using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using MiniExcelLibs;
using Tienda_Electronica.Data;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.Categorias;
using Tienda_Electronica.Repositories.Productos;
using Tienda_Electronica.Repositories.Ventas;

namespace Tienda_Electronica.Controllers
{
    [Authorize]
    public class ProductoController : Controller 
    {
        //NUEVO---
        private readonly ISqlDataAccess _dataAccess;
        //

        private readonly IProductoRepository _productoRepository;

        //-------------------------
        private readonly ICategoriaRepository _categoriaRepository;
        //-------------------------


        //Validaciones
        //private readonly IValidator<Venta> _validator;   

        public ProductoController(
            IProductoRepository productoRepository,

            //------------
            ICategoriaRepository categoriaRepository,
            //-------------

            //NUEVO ------
            ISqlDataAccess dataAccess
            //


            //IValidator<Venta> validator
            )
        {
            _productoRepository = productoRepository;

            //--------------
            _categoriaRepository = categoriaRepository;
            //--------------

            //Nuevo----
            _dataAccess = dataAccess;
            //

            //_validator = validator;
        }


        // GET: VentaController
        public async Task<ActionResult> Index()
        {
            var producto = await _productoRepository.GetAllAsync();

            return View(producto);
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
            var categorias = await _categoriaRepository.GetAllAsync();
            ViewBag.Categorias = new SelectList(categorias, "ID_Categoria", "Nombre_Categoria");
            //---------------------------
            return View();
        }

        // POST: VentaController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Producto producto)
        {
            try
            {
                await _productoRepository.AddAsync(producto);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                //
                var categorias = await _categoriaRepository.GetAllAsync();
                ViewBag.Categorias = new SelectList(categorias, "ID_Categoria", "Nombre_Categoria");
                //

                return View(producto);
            }
        }
        
        // GET: VentaController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var producto = await _productoRepository.GetByIdAsync(id);

            if (producto == null)
                return NotFound();

            //
            var categorias = await _categoriaRepository.GetAllAsync();
            ViewBag.Categorias = new SelectList(categorias, "ID_Categoria", "Nombre_Categoria", producto.ID_Categoria);
            //

            return View(producto);
        }

        // POST: VentaController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Producto producto)
        {
            try
            {
                await _productoRepository.EditAsync(producto);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                //
                var categorias = await _categoriaRepository.GetAllAsync();
                ViewBag.Categorias = new SelectList(categorias, "ID_Categoria", "Nombre_Categoria", producto.ID_Categoria);
                //

                return View(producto);
            }
        }

        // GET: VentaController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var producto = await _productoRepository.GetByIdAsync(id);

            if (producto == null)
            {
                return NotFound();
            }

            return View(producto);

        }

        // POST: VentaController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(Producto producto)
        {
            try
            {
                await _productoRepository.DeleteAsync(producto.ID_Producto);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View(producto);
            }
        }

        //NUEVO
        // GET: ProductoController/ImportData
        [HttpGet]
        public IActionResult ImportData()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ImportData(IFormFile file)
        {
            var directoryPath = Path.Combine(Directory.GetCurrentDirectory(), "Uploads");

            if (!Directory.Exists(directoryPath))
                Directory.CreateDirectory(directoryPath);

            if (file != null && file.Length > 0)
            {
                var fileName = Path.GetFileName(file.FileName);
                var path = Path.Combine(directoryPath, fileName);

                using (var stream = new FileStream(path, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

                using (var connection = _dataAccess.GetConnection())
                {
                    using (var stream = System.IO.File.OpenRead(path))
                    {
                        var rows = stream.Query<Producto>();

                        string query = @"INSERT INTO Producto 
                                         VALUES(
                                            @Nombre_Producto,
                                            @Descripcion_Producto,
                                            @PrecioUnitario,
                                            @ID_Categoria)";

                        foreach (var row in rows)
                            connection.Execute(query, new
                            {
                                row.Nombre_Producto,
                                row.Descripcion_Producto,
                                row.PrecioUnitario,
                                row.ID_Categoria
                            });
                    }
                }
            }
            return RedirectToAction(nameof(Index));
        }

    }
}
