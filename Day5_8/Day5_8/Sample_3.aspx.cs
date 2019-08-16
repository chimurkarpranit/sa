using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Day5_8
{
    public partial class Sample_3 : System.Web.UI.Page
    {
        CommanFunction objcmnfunction;
        DataTable dtCustomers;
        ConstantMessages objconstmsg;
        public void Page_Load(object sender, EventArgs e)
        {
            LblHDeleteEmployee.Visible = false;
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        public void BindGrid()
        {
            try
            {
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                MySqlCommand cmd = new MySqlCommand("SELECT CustomerID,CompanyName,ContactTitle,City,PostalCode,Phone,Fax from Customers", con);
                MySqlDataAdapter sda = new MySqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                CustomerGrid.DataSource = ds;
                CustomerGrid.DataBind();                
            }
            catch (Exception)
            {
                Response.Redirect(objconstmsg.strerrorpage, false);
            }
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CustomerGrid.PageIndex = e.NewPageIndex;
            BindGrid();
            CustomerGrid.DataBind();
        }
        MySqlConnection sqlconn;
        SqlCommand sqlcmd;
        SqlTransaction sqltransact;
        StringBuilder strBrDeleteQuery;
        object id;

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string cstring = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                MySqlConnection con = new MySqlConnection(cstring);
                GridViewRow row = GridView1.Rows[e.RowIndex];
                con.Open();
                MySqlCommand cmd1 = new MySqlCommand("SET FOREIGN_KEY_CHECKS = 0;" + "delete FROM Customers where CustomerID=" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "", con);
                cmd1.ExecuteNonQuery();
                con.Close();
                BindGrid();
                id = CustomerGrid.DataKeys[e.RowIndex].Value;
                if (sqlconn != null && sqlconn.State == ConnectionState.Closed)
                {
                    sqlconn.Open();//open the connection                                                      
                }
                sqltransact = sqlconn.BeginTransaction("Transaction"); //Transaction start
                //Query execution
                strBrDeleteQuery = new StringBuilder("DELETE  ");
                strBrDeleteQuery.Append(" FROM Customers ");
                strBrDeleteQuery.Append(" WHERE CustomerID=@CustomerID;");
                strBrDeleteQuery.Append("DELETE FROM Orders ");
                strBrDeleteQuery.Append(" WHERE CustomerID=@CustomerID;");
                sqlcmd = new SqlCommand(strBrDeleteQuery.ToString(), sqlconn, sqltransact);
                sqlcmd.Parameters.AddWithValue("@CustomerID", id);
                sqlcmd.ExecuteNonQuery();
                LblHDeleteEmployee.Visible = true;
                sqltransact.Commit();
                BindGrid();//Display Gridview                 
            }
            catch (Exception ex)
            {
                Response.Write(ex.GetType());
                Response.Write(ex.Message);
                try
                {
                    sqltransact.Rollback();//Rollback transaction
                }
                catch (Exception exc)
                {
                    Response.Write(exc.GetType());
                    Response.Write(exc.Message);
                }
            }
            finally
            {
                if (sqlconn.State == ConnectionState.Open)
                {
                    sqlconn.Close();
                }
                sqlcmd = null;
                sqltransact = null;
                strBrDeleteQuery = null;
            }
        }
        protected void BtnHADD_Click(object sender, EventArgs e)
        {
            objconstmsg = new ConstantMessages();
            Response.Redirect(objconstmsg.strAdd_Edit_CustomerPage, false);
        }
    }
}