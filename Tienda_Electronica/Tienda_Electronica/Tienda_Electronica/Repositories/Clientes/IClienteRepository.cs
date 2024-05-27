using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Clientes
{
    public interface IClienteRepository
    {
        Task AddAsync(Cliente cliente);

        Task DeleteAsync(int id);

        Task EditAsync(Cliente cliente);

        Task<IEnumerable<Cliente>> GetAllAsync();

        Task<Cliente?> GetByIdAsync(int id);
    }
}