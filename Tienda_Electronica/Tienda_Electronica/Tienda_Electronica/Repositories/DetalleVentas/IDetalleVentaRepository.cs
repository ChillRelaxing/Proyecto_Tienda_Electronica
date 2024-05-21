using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.DetalleVentas
{
    public interface IDetalleVentaRepository
    {
        Task AddAsync(DetalleVenta detalleVenta);

        Task DeleteAsync(int id);

        Task EditAsync(DetalleVenta detalleVenta);

        Task<IEnumerable<DetalleVenta>> GetAllAsync();

        Task<DetalleVenta?> GetByIdAsync(int id);
    }
}