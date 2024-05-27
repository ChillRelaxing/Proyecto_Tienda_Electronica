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

        public async Task<Cliente?> GetByIdAsync(int id)
        {
            var cliente = await _dataAccess.GetDataAsync<Cliente, dynamic>(
                "dbo.spCliente_GetByID",
                new { ID_Cliente = id }
                );

            return cliente.FirstOrDefault();
        }

        public async Task EditAsync(Cliente cliente)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spCliente_Update",
                cliente
                );
        }

        public async Task DeleteAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spCliente_Delete",
                new { ID_Cliente = id }
                );
        }

        public async Task AddAsync(Cliente cliente)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spCliente_Insert",
                new { cliente.Nombre_Cliente, cliente.Direccion_Cliente, cliente.Telefono_Cliente, cliente.Email_Cliente });
        }

    }
}
