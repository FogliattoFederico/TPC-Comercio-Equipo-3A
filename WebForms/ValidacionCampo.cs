using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace WebForms.Utils
{
    public static class ValidacionCampo
    {

        //    public static void ControlAceptar(Button boton, TextBox[] cajasDeTexto)
        //    {
        //        if (boton == null)
        //            throw new ArgumentNullException(nameof(boton));

        //        boton.Enabled = TodosCamposCompletos(cajasDeTexto);
        //    }

        //    public static bool TodosCamposCompletos(TextBox[] cajasDeTexto)
        //    {
        //        if (cajasDeTexto == null)
        //            throw new ArgumentNullException(nameof(cajasDeTexto));

        //        return cajasDeTexto.All(caja =>
        //            caja != null && !string.IsNullOrWhiteSpace(caja.Text));
        //    }
        //}

        public static void ControlAceptar(Button boton, WebControl[] controles)
        {
            if (boton == null)
                throw new ArgumentNullException(nameof(boton));

            boton.Enabled = TodosCamposCompletos(controles);
        }

        // Sobrecarga para mantener compatibilidad con código existente
        //public static void ControlAceptar(Button boton, TextBox[] cajasDeTexto)
        //{
        //    ControlAceptar(boton, cajasDeTexto.Cast<WebControl>().ToArray());
        //}

        // Método principal de validación
        public static bool TodosCamposCompletos(WebControl[] controles)
        {
            if (controles == null)
                throw new ArgumentNullException(nameof(controles));

            return controles.All(control =>
            {
                if (control == null) return false;

                if (control is TextBox textBox)
                {
                    return !string.IsNullOrWhiteSpace(textBox.Text);
                }
                else if (control is DropDownList dropDown)
                {
                    // Validar que tenga un ítem seleccionado y que no sea el valor por defecto
                    return dropDown.SelectedIndex > 0; // Asume que el índice 0 es el valor por defecto como "--Seleccione--"
                }

                return true; // Si no es TextBox ni DropDownList, lo consideramos válido
            });
        }

        // Sobrecarga para mantener compatibilidad con código existente
        //public static bool TodosCamposCompletos(TextBox[] cajasDeTexto)
        //{
        //    return TodosCamposCompletos(cajasDeTexto.Cast<WebControl>().ToArray());
        //}
    }

}
