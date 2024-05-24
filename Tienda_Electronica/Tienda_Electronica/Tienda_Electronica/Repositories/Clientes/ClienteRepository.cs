using Tienda_Electronica.Data;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Clientes
{
    public class ClienteRepository : IClienteRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public ClienteRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Cliente>> GetAllAsync()
        {
            return await _dataAccess.GetDataAsync<Cliente, dynamic>(
                "dbo.spCliente_GetAll",
                new { }
                );
        }
    }
}
