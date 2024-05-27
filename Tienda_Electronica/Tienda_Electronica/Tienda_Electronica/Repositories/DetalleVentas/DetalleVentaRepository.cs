using System.Data;
using System.Linq;
using Tienda_Electronica.Data;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.DetalleVentas
{
    public class DetalleVentaRepository : IDetalleVentaRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public DetalleVentaRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<DetalleVenta>> GetAllAsync()
        {
            return await _dataAccess.GetDataAsync<DetalleVenta, dynamic>(
                "dbo.spDetalleVenta_GetAll",
                new { }
                );
        }

        public async Task<DetalleVenta?> GetByIdAsync(int id)
        {
            var detalleVentas = await _dataAccess.GetDataAsync<DetalleVenta, dynamic>(
                "dbo.spDetalleVenta_GetByID",
                new { ID_DetalleVenta = id }
                );

            return detalleVentas.FirstOrDefault();
        }

        public async Task EditAsync(DetalleVenta detalleVenta)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spDetalleVenta_Update",
                new { detalleVenta.ID_DetalleVenta, detalleVenta.Cantidad, detalleVenta.SubTotal, detalleVenta.PrecioUnitario, detalleVenta.ID_Venta, detalleVenta.ID_Producto }
                );
        }

        public async Task DeleteAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spDetalleVenta_Delete",
                new { ID_DetalleVenta = id }
                );
        }

        public async Task AddAsync(DetalleVenta detalleVenta)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spDetalleVenta_Insert",
                 new { detalleVenta.Cantidad, detalleVenta.SubTotal, detalleVenta.PrecioUnitario, detalleVenta.ID_Venta, detalleVenta.ID_Producto }
                 );
        }
    }
}
