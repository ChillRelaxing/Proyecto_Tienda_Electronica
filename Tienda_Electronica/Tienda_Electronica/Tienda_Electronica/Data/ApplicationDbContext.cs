using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Collections;
using Tienda_Electronica.Models;

namespace Tienda_Electronica.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        
        //public DbSet<Producto> Productos { get; set; }
        //public DbSet<Venta> Ventas { get; set; }
        //public DbSet<DetalleVenta> DetallesVenta { get; set; }
        //public DbSet<Inventario> Inventarios { get; set; }
        //public DbSet<Cliente> Clientes { get; set; }
        //public DbSet<Categoria> Categorias { get; set; }

    }
}
