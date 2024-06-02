using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.Categorias;
using Tienda_Electronica.Repositories.Ventas;
using Tienda_Electronica.Validations;

namespace Tienda_Electronica.Controllers
{
    [Authorize]
    public class CategoriaController : Controller
    {
        private readonly ICategoriaRepository _categoriaRepository;

        //Validaciones
        private readonly IValidator<Categoria> _categoriaValidator;

        public CategoriaController(
            ICategoriaRepository categoriaRepository,

            IValidator<Categoria> categoriaValidator
            )
        {
            _categoriaRepository = categoriaRepository;

            _categoriaValidator = categoriaValidator;
        }


        // GET: VentaController
        public async Task<ActionResult> Index()
        {
            var categoria = await _categoriaRepository.GetAllAsync();
            
            return View(categoria);
        }

        // GET: VentaController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }


        // GET: VentaController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var categoria = await _categoriaRepository.GetByIdAsync(id);

            if (categoria == null)
                return NotFound();

            return View(categoria);
        }

        // POST: VentaController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Categoria categoria)
        {
            var validationResult = _categoriaValidator.Validate(categoria);

            try
            {
                await _categoriaRepository.EditAsync(categoria);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                validationResult.AddToModelState(this.ModelState);

                return View(categoria);
            }
        }

        // GET: VentaController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var categoria = await _categoriaRepository.GetByIdAsync(id);

            if (categoria == null)
            {
                return NotFound();
            }

            return View(categoria);

        }

        // POST: VentaController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(Categoria categoria)
        {
            try
            {
                await _categoriaRepository.DeleteAsync(categoria.ID_Categoria);

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return View(categoria);
            }
        }
    }
}