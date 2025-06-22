using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms
{
    public partial class Vendedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || ((Usuario)Session["Usuario"]).Admin != false)
            {
                Session.Add("Error", "Debes estar logueado ");
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}