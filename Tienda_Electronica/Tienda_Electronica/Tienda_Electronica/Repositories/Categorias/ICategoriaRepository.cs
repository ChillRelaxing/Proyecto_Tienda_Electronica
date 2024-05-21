using Tienda_Electronica.Models;

namespace Tienda_Electronica.Repositories.Categorias
{
    public interface ICategoriaRepository
    {
        Task AddAsync(Categoria categoria);

        Task DeleteAsync(int id);

        Task EditAsync(Categoria categoria);

        Task<IEnumerable<Categoria>> GetAllAsync();

        Task<Categoria?> GetByIdAsync(int id);
    }
}