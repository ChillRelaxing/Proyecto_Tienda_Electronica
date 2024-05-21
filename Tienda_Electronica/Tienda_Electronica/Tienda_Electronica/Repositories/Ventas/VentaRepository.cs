using Tienda_Electronica.Data;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Ventas
{
    public class VentaRepository : IVentaRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public VentaRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Venta>> GetAllAsync()
        {
            return await _dataAccess.GetDataAsync<Venta, dynamic>(
                "dbo.spVenta_GetAll",
                new { }
                );
        }

        public async Task<Venta?> GetByIdAsync(int id)
        {
            var venta = await _dataAccess.GetDataAsync<Venta, dynamic>(
                "dbo.spVenta_GetById",
                new { ID_Venta = id }
                );

            return venta.FirstOrDefault();
        }

        public async Task EditAsync(Venta venta)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spVenta_Update",
                venta
                );
        }

        public async Task DeleteAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spVenta_Delete",
                new { ID_Venta = id }
                );
        }

        public async Task AddAsync(Venta venta)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spVenta_Insert",
                new { venta.FechaVenta, venta.Total_Venta, venta.Descripcion_Venta });
        }

    }
}
