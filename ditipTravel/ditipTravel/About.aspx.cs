using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ditipTravel
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbDataContext db = new dbDataContext();
            db.tbl_Persons.ToList();
            //db.tbl_Persons.Where(op=> op.)
        }
    }
}