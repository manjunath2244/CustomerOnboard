using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace CustomerOnboard
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string FirstName = txtFirstName.Text;
            string LastName = txtLastname.Text;
            string UserName = txtUsername.Text;
            string Password = txtPassword.Text;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = GenericConstant.CustomerOnboardDB;  //"Data Source=IRIS-CSG-688;Initial Catalog=CustomerOnboard;Integrated Security=Yes; Connection Timeout=600;";
            con.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = con;

            command.CommandText = "Insert into CredentialsTable(Username, Password, Firstname, Lastname) values ('" + UserName + "' , '" + Password + "', '" + FirstName + "','" + LastName + "') ";
            command.ExecuteNonQuery();

            lblMessage.Text = "Data inserted successfully";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}