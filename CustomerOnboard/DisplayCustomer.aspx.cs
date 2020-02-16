using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace CustomerOnboard
{
    public partial class DisplayCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = GenericConstant.CustomerOnboardDB; ; //"Data Source=IRIS-CSG-688;Initial Catalog=CustomerOnboard;Integrated Security=Yes; Connection Timeout=600;";
            con.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = con;

            command.CommandText = "select Username, Firstname, Lastname from CredentialsTable";

            SqlDataAdapter da = new SqlDataAdapter(command);
            DataSet ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdUsers.DataSource = ds;
                grdUsers.DataBind();
            }

            else
            {
                Response.Write("No records to display");
            }
        }
    }
}