using System;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;

namespace ditipTravel
{
    public partial class frm_userAddUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["Mod"] == "New")
                    {
                        pageName.InnerText = "User Add";
                        pageName2.InnerText = "User Add";
                        btnUpdate.Text = "Add";
                    }
                    else if (Request.QueryString["Mod"] == "Update")
                    {
                        pageName.InnerText = "User Update";
                        pageName2.InnerText = "User Update";
                        btnUpdate.Text = "Update";
                        passDiv.Visible = false;

                        if (Request.QueryString["Uid"] != null)
                        {
                            dbDataContext db = new dbDataContext();

                            var user = db.tbl_Users.Where(s => s.id == Convert.ToInt32(Request.QueryString["Uid"])).FirstOrDefault();

                            if (user != null)
                            {
                                txtName.Text = user.name;
                                txtSurname.Text = user.surname;
                                txtUsername.Text = user.username;
                                radioButtonList.SelectedIndex = (user.status == true ? 0 : 1);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessageHata.Text = "Error Detail :" + ex.ToString();
                PopupMessageBoxHata.ShowOnPageLoad = true;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("frm_userList.aspx", false);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            dbDataContext db = new dbDataContext();

            if (Request.QueryString["Mod"] == "New")
            {
                //Girilen şifreler aynı mı?
                if (txtNewPass.Value.ToString() == txtNewPassAgain.Value.ToString())
                {
                    if (IsControll(txtNewPass.Text))
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

                        lblMessageBasarili.Text = "User added.";
                        PopupMessageBoxBasarili.ShowOnPageLoad = true;
                    }
                    else
                    {
                        //if (Session["BayiAdi"] != null && Session["b2bKullanici"] != null)
                        //{
                        //    loglama.logKaydi(Session["BayiAdi"].ToString(), Session["b2bKullanici"].ToString(), DateTime.Now, "Şifre Değiştir", "Şifre en az 6 karakterden oluşmalıdır. Rakam ve harf içermelidir.", "Başarısız", "Şifre Güncelle", 0);
                        //}
                        lblMessageHata.Text = "Password must be at least 6 characters. It must contain numbers and letters.";
                        PopupMessageBoxHata.ShowOnPageLoad = true;
                    }
                }
                else
                {
                    //if (Session["BayiAdi"] != null && Session["b2bKullanici"] != null)
                    //{
                    //    loglama.logKaydi(Session["BayiAdi"].ToString(), Session["b2bKullanici"].ToString(), DateTime.Now, "Şifre Değiştir", "Girmiş olduğunuz şifreler aynı değil.", "Başarısız", "Şifre Güncelle", 0);
                    //}
                    lblMessageHata.Text = "The passwords you entered are not the same.";
                    PopupMessageBoxHata.ShowOnPageLoad = true;
                }
            }
            else if (Request.QueryString["Mod"] == "Update")
            {
                var user = db.tbl_Users.Where(s => s.id == Convert.ToInt32(Request.QueryString["Uid"])).FirstOrDefault();

                if (user != null)
                {
                    if (!txtUsername.Text.Contains(" "))
                    {
                        user.name = txtName.Text;
                        user.surname = txtSurname.Text;
                        user.username = txtUsername.Text;
                        user.status = (radioButtonList.SelectedIndex == 0 ? true : false);

                        db.SubmitChanges();

                        lblMessageBasarili.Text = "User update.";
                        PopupMessageBoxBasarili.ShowOnPageLoad = true;
                    }
                    else
                    {
                        lblMessageHata.Text = "The username cannot have space!";
                        PopupMessageBoxHata.ShowOnPageLoad = true;
                    }
                }
            }
        }

        #region password policy Şifre

        private static int Minimum_Length = 6;
        private static int Numeric_length = 0;

        public static bool IsControll(string Password)
        {
            if (Password.Length <= Minimum_Length)
                return false;
            if (UpperCaseCount(Password) == 0 || LowerCaseCount(Password) == 0)
                return false;
            if (NumericCount(Password) == Numeric_length)
                return false;

            return true;
        }

        private static int UpperCaseCount(string Password)
        {
            return Regex.Matches(Password, "[A-Z]").Count;
        }
        private static int LowerCaseCount(string Password)
        {
            return Regex.Matches(Password, "[a-z]").Count;
        }
        private static int NumericCount(string Password)
        {
            return Regex.Matches(Password, "[0-9]").Count;
        }
        //private static int NonAlphaCount(string Password)
        //{
        //    return Regex.Matches(Password, @"[^0-9a-zA-Z\._]").Count;
        //}

        #endregion
    }
}