﻿namespace Tienda_Electronica.Models
{
    public class Cliente
    {
        public int ID_Cliente { get; set; }

        public string Nombre_Cliente { get; set; }

        public string Direccion_Cliente { get; set; }

        public string Telefono_Cliente { get; set; }

        public string Email_Cliente { get; set; }


        // public Producto? Nombre_Producto { get; set; } //Captura datos del modelo Producto para obtener el Nombre_Producto

    }
}