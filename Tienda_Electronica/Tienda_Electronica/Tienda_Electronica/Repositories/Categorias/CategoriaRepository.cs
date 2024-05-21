using Tienda_Electronica.Data;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Categorias
{
    public class CategoriaRepository : ICategoriaRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public CategoriaRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Categoria>> GetAllAsync()
        {
            return await _dataAccess.GetDataAsync<Categoria, dynamic>(
                "dbo.spCategoria_GetAll",
                new { }
            );
        }

        public async Task<Categoria?> GetByIdAsync(int id)
        {
            var venta = await _dataAccess.GetDataAsync<Categoria, dynamic>(
                "dbo.spCategoria_GetById",
                new { ID_Categoria = id }
                );

            return venta.FirstOrDefault();
        }

        public async Task EditAsync(Categoria categoria)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spCategoria_Update",
                categoria
                );
        }

        public async Task DeleteAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spCategoria_Delete",
                new { ID_Categoria = id }
                );
        }

        public async Task AddAsync(Categoria categoria)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spCategoria_Insert",
                new { categoria.Nombre_Categoria, categoria.Descripcion_Categoria });
        }

    }
}
