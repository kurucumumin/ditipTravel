﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace ditipTravel
{
    public partial class frm_Login : System.Web.UI.Page
    {
        dbDataContext db = new dbDataContext();
        //Loglama loglama = new Loglama();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["Logout"] != null)
            {
                if (Request.QueryString["Logout"].ToString() == "1")
                {
                    Session["userName"] = null;
                    Session["userID"] = null;
                }
            }

            if (!IsPostBack)
            {


            }
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            btnGirisClick();
        }

        private void btnGirisClick()
        {
            try
            {
                var kullanici = db.tbl_Users.Where(k => k.username == txtKullaniciAdi.Value).FirstOrDefault();

                if (kullanici != null)
                {
                    if (kullanici.password == txtSifre.Value)
                    {
                        if (kullanici.status == true)
                        {


                            Session["userID"] = kullanici.id;
                            Session["username"] = kullanici.username;
                            Session["name"] = kullanici.name;
                            Session["surname"] = kullanici.surname;



                            Response.Redirect("frm_allTravel.aspx", false);
                        }
                        else
                            lblMesaj.Text = "Failed to login! User is not active.";
                    }
                    else
                    {
                        //loglama.logKaydi("ALM", txtKullaniciAdi.Value + " - " + txtSifre.Value, DateTime.Now, "Login", "Giriş yapılamadı! Lütfen bilgilerinizi kontrol edip tekrar deneyin.", "Başarısız", "Login Girişi", 0);
                        //lblMesaj.Text = "Failed to login! Please password check and try again.";
                        lblMesaj.Text = "Giriş yapılamadı! Lütfen bilgilerinizi kontrol edip tekrar deneyin.";
                    }
                }
                else
                {
                    //loglama.logKaydi("ALM", txtKullaniciAdi.Value + " - " + txtSifre.Value, DateTime.Now, "Login", "Giriş yapılamadı! Lütfen bilgilerinizi kontrol edip tekrar deneyin.", "Başarısız", "Login Girişi", 0);
                    lblMesaj.Text = "Giriş yapılamadı! Lütfen bilgilerinizi kontrol edip tekrar deneyin.";
                }
            }
            catch (Exception ex)
            {
                //loglama.logKaydi("ALM", txtKullaniciAdi.Value + " - " + txtSifre.Value, DateTime.Now, "Login", "Hata Detayı : " + ex.ToString(), "Başarısız", "Login Girişi", 0);
                lblMesaj.Text = "Hata Detayı :" + ex.ToString();
            }
        }
    }
}