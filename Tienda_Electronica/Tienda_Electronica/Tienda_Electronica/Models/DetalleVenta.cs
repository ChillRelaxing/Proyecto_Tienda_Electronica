﻿namespace Tienda_Electronica.Models
{
    public class DetalleVenta
    {
        public int ID_DetalleVenta { get; set; }

        public int Cantidad { get; set; }

        public decimal SubTotal { get; set; } //Double

        public decimal PrecioUnitario { get; set; } //Añadido

        public int ID_Venta { get; set; }

        public int ID_Producto { get; set; }

        public DateTime FechaVenta { get; set; } //Modelo Venta

        public string Nombre_Producto { get; set; } //Modelo Producto

        //public Venta? FechaVenta { get; set; } //Captura datos del modelo Ventas para obtener el Total_Venta

        //public Producto? Nombre_Producto { get; set; } //Captura datos del modelo Producto para obtener el Nombre

    }
}
