using Tienda_Electronica.Data;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Inventarios
{
    public class InventarioRepository : IInventarioRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public InventarioRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Inventario>> GetAllAsync()
        {
            return await _dataAccess.GetDataAsync<Inventario, dynamic>(
                "dbo.spInventario_GetAll",
                new { }
            ); 
        }

        public async Task<Inventario?> GetByIdAsync(int id)
        {
            var inventario = await _dataAccess.GetDataAsync<Inventario, dynamic>(
                "dbo.spInventario_GetById",
                new { ID_Inventario = id }
                );

            return inventario.FirstOrDefault();
        }

        public async Task EditAsync(Inventario inventario)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spInventario_Update",
                inventario
                );
        }

        public async Task DeleteAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spInventario_Delete",
                new { ID_Inventario = id }
                );
        }

        public async Task AddAsync(Inventario inventario)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spInventario_Insert",
                new { inventario.Cantidad, inventario.FechaRegistro, inventario.ID_Productova});
        }

    }
}

