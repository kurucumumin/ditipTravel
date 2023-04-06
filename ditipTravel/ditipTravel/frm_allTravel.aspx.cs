using DevExpress.Web;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.UI.WebControls;

namespace ditipTravel
{
    public partial class frm_allTravel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userID"] != null)
                    LoadGrid();

                //foreach (GridViewDataColumn column in ASPxGridView1.DataColumns)
                //{
                //    if (column.FieldName != "OlusturmaTarihi" && column.FieldName != "TahminiBitisTarihi" && column.FieldName != "TamamlanmaTarihi")
                //        column.SettingsHeaderFilter.Mode = GridHeaderFilterMode.CheckedList;
                //    else
                //        column.SettingsHeaderFilter.Mode = GridHeaderFilterMode.DateRangePicker;
                //}

                ASPxGridView1.SettingsResizing.ColumnResizeMode = (ColumnResizeMode)Enum.Parse(typeof(ColumnResizeMode), "NextColumn", true);
                ASPxGridView1.SettingsResizing.Visualization = (ResizingMode)Enum.Parse(typeof(ResizingMode), "Postponed", true);
                ASPxGridView1.SettingsPager.PageSizeItemSettings.Visible = true;
                ASPxGridView1.SettingsPager.PageSizeItemSettings.Position = PagerPageSizePosition.Right;
                ASPxGridView1.SettingsPopup.HeaderFilter.Width = 320;
                ASPxGridView1.SettingsPopup.HeaderFilter.Height = 320;
            }

            if (Session["tbl_Travels"] != null)
            {
                ASPxGridView1.DataSource = Session["tbl_Travels"];
                ASPxGridView1.KeyFieldName = "id";
                ASPxGridView1.DataBind();
            }
        }

        private void LoadGrid()
        {
            Session["tbl_Travels"] = null;
            SqlCommand sqlCmd = new SqlCommand();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ditipTravelConnectionString"].ConnectionString);

            sqlCmd.Connection = con;
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.CommandText = @"SELECT * FROM tbl_Travels WITH(NOLOCK)";

            SqlDataAdapter sqlDataAdap = new SqlDataAdapter(sqlCmd);
            sqlDataAdap.SelectCommand.CommandTimeout = 600;

            DataTable dt = new DataTable();

            sqlDataAdap.Fill(dt);
            con.Close();

            Session["tbl_Travels"] = dt;
            ASPxGridView1.DataSource = Session["tbl_Travels"];
            ASPxGridView1.KeyFieldName = "id";
            ASPxGridView1.DataBind();
        }
    }
}