using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using System.Configuration;
using System.Web.Configuration;

namespace CustomerOnboard
{
    public partial class LoginPage : System.Web.UI.Page
    {
        
           // ConfigurationManager.ConnectionStrings["CustomerOnboardDB"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            GenericConstant.CustomerOnboardDB = "Data Source=MANJUNATH-PC\\SQLEXPRESS;Initial Catalog=CustomerOnboard;Integrated Security=Yes; Connection Timeout=600;";
            //GenericConstant.CustomerOnboardDB = "Server=localhost;Database=CustomerOnboard;User Id=192.168.10.58\\testautomation1; password=password@1;";
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string UserName = Login1.UserName;
            string Password = Login1.Password;

            Session["Username"] = UserName;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = GenericConstant.CustomerOnboardDB; //"Data Source=IRIS-CSG-688;Initial Catalog=CustomerOnboard;Integrated Security=Yes; Connection Timeout=600;";
            con.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = con;

            command.CommandText = "select * from CredentialsTable where Username = '" + UserName + "' and Password = '" + Password + "' ";

            SqlDataAdapter da = new SqlDataAdapter(command);
            DataSet ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Redirect("LoginPage.aspx");
            }


        }
    }
}