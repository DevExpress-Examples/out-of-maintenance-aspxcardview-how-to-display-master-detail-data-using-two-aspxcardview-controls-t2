using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CategoryID"] != null)
        {
            ASPxCardView2.DataSource = dsProducts;
            ASPxCardView2.DataBind();
        }
    }
    protected void ASPxCardView2_CustomCallback(object sender, DevExpress.Web.ASPxCardViewCustomCallbackEventArgs e)
    {
        object masterKeyValue = ASPxCardView1.GetCardValues(Convert.ToInt32(e.Parameters), "CategoryID");
        Session["CategoryID"] = masterKeyValue;
        ASPxCardView2.DataSource = dsProducts;
        ASPxCardView2.PageIndex = 0;
        ASPxCardView2.DataBind();

    }
}