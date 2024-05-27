using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Inventarios
{
    public interface IInventarioRepository
    {
        Task AddAsync(Inventario inventario);


        Task DeleteAsync(int id);

        Task EditAsync(Inventario inventario);

        Task<IEnumerable<Inventario>> GetAllAsync();

        Task<Inventario?> GetByIdAsync(int id); 
    }
}
