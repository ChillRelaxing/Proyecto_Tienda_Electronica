using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Productos
{
    public interface IProductoRepository
    {
        Task AddAsync(Producto producto);

        Task DeleteAsync(int id);

        Task EditAsync(Producto producto);

        Task<IEnumerable<Producto>> GetAllAsync();

        Task<Producto?> GetByIdAsync(int id);

        //Falta
    }
}