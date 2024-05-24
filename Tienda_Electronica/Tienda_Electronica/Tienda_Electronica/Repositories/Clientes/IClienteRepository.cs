using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Clientes
{
    public interface IClienteRepository
    {
        Task<IEnumerable<Cliente>> GetAllAsync();
    }
}