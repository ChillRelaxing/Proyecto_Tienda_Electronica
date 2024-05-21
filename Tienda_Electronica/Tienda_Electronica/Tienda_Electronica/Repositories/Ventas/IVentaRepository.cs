using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Ventas
{
    public interface IVentaRepository
    {
        Task AddAsync(Venta venta);

        Task DeleteAsync(int id);

        Task EditAsync(Venta venta);

        Task<IEnumerable<Venta>> GetAllAsync();

        Task<Venta?> GetByIdAsync(int id);

    }
}