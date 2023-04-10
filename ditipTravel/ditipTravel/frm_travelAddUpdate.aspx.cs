using System;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;

namespace ditipTravel
{
    public partial class frm_travelAddUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["Mod"] == "New")
                    {
                        pageName.InnerText = "Seyahat Ekle";
                        pageName2.InnerText = "Seyahat Ekle";
                        btnUpdate.Text = "EKLE";
                    }
                    else if (Request.QueryString["Mod"] == "Update")
                    {
                        pageName.InnerText = "Seyahat Güncelle";
                        pageName2.InnerText = "Seyahat Güncelle";
                        btnUpdate.Text = "Güncelle";
                        passDiv.Visible = false;

                        if (Request.QueryString["Uid"] != null)
                        {
                            dbDataContext db = new dbDataContext();

                            var user = db.tbl_Travels.Where(s => s.id == Convert.ToInt32(Request.QueryString["Uid"])).FirstOrDefault();

                            if (user != null)
                            {
                                txtName.Text = user.name;
                                txtSurname.Text = user.surname;
                                
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessageHata.Text = "Hata Detayı: " + ex.ToString();
                PopupMessageBoxHata.ShowOnPageLoad = true;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("frm_allTravel.aspx", false);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            dbDataContext db = new dbDataContext();

            if (Request.QueryString["Mod"] == "New")
            {
                tbl_User user = new tbl_User();

                user.name = txtName.Text;
                user.surname = txtSurname.Text;
                user.username = txtUsername.Text;
                user.password = txtNewPass.Text;
                user.status = (radioButtonList.SelectedIndex == 0 ? true : false);

                db.tbl_Users.InsertOnSubmit(user);
                db.SubmitChanges();

                #region Loglama

                //if (Session["BayiAdi"] != null && Session["b2bKullanici"] != null)
                //{
                //    loglama.logKaydi(Session["BayiAdi"].ToString(), Session["b2bKullanici"].ToString(), DateTime.Now, "Şifre Değiştir", "Şifre değiştirildi. ", "Başarılı", "Şifre Güncelle", 0);
                //}

                #endregion

                lblMessageBasarili.Text = "Seyahat başarıyla eklendi.";
                PopupMessageBoxBasarili.ShowOnPageLoad = true;
            }
            else if (Request.QueryString["Mod"] == "Update")
            {
                var user = db.tbl_Users.Where(s => s.id == Convert.ToInt32(Request.QueryString["Uid"])).FirstOrDefault();

                if (user != null)
                {
                    user.name = txtName.Text;
                    user.surname = txtSurname.Text;
                    user.username = txtUsername.Text;
                    user.status = (radioButtonList.SelectedIndex == 0 ? true : false);

                    db.SubmitChanges();

                    lblMessageBasarili.Text = "Seyahat başarıyla güncellendi.";
                    PopupMessageBoxBasarili.ShowOnPageLoad = true;
                }
            }
        }
    }
}