using FluentValidation;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using Tienda_Electronica.Data;
using Tienda_Electronica.Models;
using Tienda_Electronica.Repositories.Categorias;
using Tienda_Electronica.Repositories.Clientes;
using Tienda_Electronica.Repositories.DetalleVentas;
using Tienda_Electronica.Repositories.Inventarios;
using Tienda_Electronica.Repositories.Productos;
using Tienda_Electronica.Repositories.Ventas;
using Tienda_Electronica.Services.Email;
using Tienda_Electronica.Validations;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));
builder.Services.AddDatabaseDeveloperPageExceptionFilter();

builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<ApplicationDbContext>();
builder.Services.AddControllersWithViews();

//Inyeccion de dependencias
builder.Services.AddSingleton<ISqlDataAccess, SqlDataAccess>();

builder.Services.AddScoped<IVentaRepository, VentaRepository>();

builder.Services.AddScoped<IDetalleVentaRepository, DetalleVentaRepository>();

builder.Services.AddScoped<IProductoRepository, ProductoRepository>();

builder.Services.AddScoped<ICategoriaRepository, CategoriaRepository>();

builder.Services.AddScoped<IClienteRepository, ClienteRepository>();

builder.Services.AddScoped<IInventarioRepository, InventarioRepository>();

//Inyeccion de dependencias de Email
builder.Services.AddTransient<IEmailService, EmailService>();

//Inyecion de dependencias de validaciones
builder.Services.AddScoped<IValidator<DetalleVenta>, DetalleVentaValidator>();
builder.Services.AddScoped<IValidator<Categoria>, CategoriaValidator>();
builder.Services.AddScoped<IValidator<Venta>, VentaValidator>();
builder.Services.AddScoped<IValidator<Producto>, ProductoValidator>();




//Validaciones en espa�ol
ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("es");

//NUEVO
// Configuraci�n de cookies de autenticaci�n
builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = "/Identity/Account/Login";
    options.AccessDeniedPath = "/Identity/Account/AccessDenied";
});
//NUEVO
// Configuraci�n de Razor Pages para definir la p�gina predeterminada
builder.Services.AddRazorPages().AddRazorPagesOptions(options =>
{
    options.Conventions.AddPageRoute("/Identity/Account/Login", "");
});
//
//


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseMigrationsEndPoint();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

//NUEVO
app.UseAuthentication(); // Aseg�ra que la autenticaci�n est� habilitada
//

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
app.MapRazorPages();

app.Run();
