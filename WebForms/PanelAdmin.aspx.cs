using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace WebForms
{
    public partial class PanelAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || ((Usuario)Session["Usuario"]).Admin != true)
            {
                Session.Add("Error", "Debes tener permiso de administrador");
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}