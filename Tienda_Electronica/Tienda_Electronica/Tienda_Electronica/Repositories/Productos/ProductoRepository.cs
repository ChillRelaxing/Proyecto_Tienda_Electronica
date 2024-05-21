using Tienda_Electronica.Data;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Productos
{
    public class ProductoRepository : IProductoRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public ProductoRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Producto>> GetAllAsync()
        {
            return await _dataAccess.GetDataAsync<Producto, dynamic>(
                "dbo.spProducto_GetAll",
                new { }
                );
        }

        public async Task<Producto?> GetByIdAsync(int id)
        {
            var producto = await _dataAccess.GetDataAsync<Producto, dynamic>(
                "dbo.spProducto_GetByID",
                new { ID_Producto = id }
                );

            return producto.FirstOrDefault();
        }

        public async Task EditAsync(Producto producto)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spProducto_Update",
                new { producto.Nombre_Producto, producto.Descripcion_Producto, producto.ID_Categoria, producto.ID_Producto });
                //producto
        }

        public async Task DeleteAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spProducto_Delete",
                new { ID_Producto = id }
                );
        }

        public async Task AddAsync(Producto producto)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spProducto_Insert",
                new { producto.Nombre_Producto, producto.Descripcion_Producto, producto.ID_Categoria });
        }

        //FALTA

    }
}
