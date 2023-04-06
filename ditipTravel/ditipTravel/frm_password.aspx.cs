using System;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;

namespace ditipTravel
{
    public partial class frm_password : System.Web.UI.Page
    {
        //Loglama loglama = new Loglama();
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Loglama 

            //if (Session["BayiAdi"] != null && Session["b2bKullanici"] != null)
            //{
            //    Loglama loglama = new Loglama();
            //    loglama.logKaydi(Session["BayiAdi"].ToString(), Session["b2bKullanici"].ToString(), DateTime.Now, "Şifre Değiştir", "Sayfaya giriş yapıldı. ", "Başarılı", "Sayfa Girişi", 0);
            //}

            #endregion
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("frm_allTravel.aspx", false);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                dbDataContext db = new dbDataContext();

                if (Session["userID"] != null)
                {
                    int userID = Convert.ToInt32(Session["userID"].ToString());

                    var person = db.tbl_Users.Where(op => op.id == userID).FirstOrDefault();

                    if (person != null)
                    {
                        //Şifre değiştirmeye çalışan arkadaş mevcut şifreyi biliyor mu?
                        if (person.password == txtOldPass.Text)
                        {
                            //Girilen şifreler aynı mı?
                            if (txtNewPass.Value.ToString() == txtNewPassAgain.Value.ToString())
                            {
                                if (IsControll(txtNewPass.Text))
                                {
                                    person.password = txtNewPass.Text;
                                    db.SubmitChanges();

                                    #region Loglama

                                    //if (Session["BayiAdi"] != null && Session["b2bKullanici"] != null)
                                    //{
                                    //    loglama.logKaydi(Session["BayiAdi"].ToString(), Session["b2bKullanici"].ToString(), DateTime.Now, "Şifre Değiştir", "Şifre değiştirildi. ", "Başarılı", "Şifre Güncelle", 0);
                                    //}

                                    #endregion

                                    Response.Redirect("frm_Login.aspx?Logout=1", false); // Logout olmasını sağladık
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
                        else
                        {
                            //if (Session["BayiAdi"] != null && Session["b2bKullanici"] != null)
                            //{
                            //    loglama.logKaydi(Session["BayiAdi"].ToString(), Session["b2bKullanici"].ToString(), DateTime.Now, "Şifre Değiştir", "Eski şifrenizi yanlış girdiniz.", "Başarısız", "Şifre Güncelle", 0);
                            //}
                            lblMessageHata.Text = "You entered your old password incorrectly.";
                            PopupMessageBoxHata.ShowOnPageLoad = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //if (Session["BayiAdi"] != null && Session["b2bKullanici"] != null)
                //{
                //    loglama.logKaydi(Session["BayiAdi"].ToString(), Session["b2bKullanici"].ToString(), DateTime.Now, "Şifre Değiştir", "Hata Detayı :" + ex.ToString(), "Başarısız", "Şifre Güncelle", 0);
                //}
                lblMessageHata.Text = "Error Detail :" + ex.ToString();
                PopupMessageBoxHata.ShowOnPageLoad = true;
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