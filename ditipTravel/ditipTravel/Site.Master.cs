using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ditipTravel
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("frm_Login.aspx");
            }
            else
            {
                lblKullanici.Text = Session["name"].ToString() + " " + Session["surname"].ToString();
                //lblBayiSube.Text = Session["crmKullanici"].ToString();

                #region Yetkilendirmeler

                //vtDataContext db = new vtDataContext();

                //CrmKullanicilar c = db.CrmKullanicilars.Where(op => op.ID == Convert.ToInt32(Session["crmKullaniciID"].ToString())).FirstOrDefault();

                //btnSatinAlma.Visible = false;
                //btnLog.Visible = false;
                ////btnDestek.Visible = false;
                //btnUrun.Visible = false;
                //btnMusteriTemsilcisi.Visible = false;
                //btnTemlik.Visible = false;
                //btnRapor.Visible = false;
                ////btnKrediTutari.Visible = false;
                //btnBayiAtama.Visible = false;
                //btnStok.Visible = false;
                //btniade.Visible = false;
                //btnStokKontrol.Visible = false;
                //btnDuyurular.Visible = false;
                //btnVadeFarki.Visible = false;
                //btnTumIadeSeriBazli.Visible = false;
                //btnBayiTeslimatAdresi.Visible = false;
                //btnMarsDepoStok.Visible = false;
                //// btnMarsDepoAcikSiparisler.Visible = false;
                //btnTumDagilimListeleri.Visible = false;
                //btnDagilimListesiOlusturma.Visible = false;
                //btnOmySyLimit.Visible = false;
                //btnVadesiGecmisBorc.Visible = false;
                //btnOnOdeme.Visible = false;


                //if (Convert.ToInt32(Session["crmKullaniciID"].ToString()) == 26 || Convert.ToInt32(Session["crmKullaniciID"].ToString()) == 32 || Convert.ToInt32(Session["crmKullaniciID"].ToString()) == 63 || Convert.ToInt32(Session["crmKullaniciID"].ToString()) == 72) // Banu, Tuğçe, Medine ve Tuğba
                //{
                //    btnStokKontrol.Visible = true;
                //    btnExcelSiparis.Visible = true;
                //    btnBayiTeslimatAdresi.Visible = true;
                //    btnTumDagilimListeleri.Visible = true;
                //    btnDagilimListesiOlusturma.Visible = true;
                //    btnOmySyLimit.Visible = true;
                //}

                //if (c.RolID == 1 || c.RolID == 6) // OMT ve SY
                //{
                //    btnRapor.Visible = true;
                //    //btnStok.Visible = true;
                //    btnMarsSiparis.Visible = false;
                //    btnimeiRapor.Visible = true;
                //    btnimeiSorgulama.Visible = true;
                //    btnCMLK.Visible = false;
                //    btniade.Visible = true;
                //    btnBekleyenSiparisler.Visible = false;
                //}

                //if (c.RolID == 2 || c.RolID == 7 || c.RolID == 8 || c.RolID == 9) // Omt Head, Temlik, Muhasebe ve Kontrol
                //{
                //    btnSatinAlma.Visible = true;
                //    btnMusteriTemsilcisi.Visible = true;
                //    // btnDestek.Visible = true;
                //    btnTemlik.Visible = true;
                //    btnRapor.Visible = true;
                //    btnBayiAtama.Visible = true;
                //    btnStok.Visible = true;
                //    btniade.Visible = true;
                //    btnYeniIade.Visible = false;
                //    btnYeniIadeSerisiz.Visible = false;
                //    btnYeniIadeHakemHeyeti.Visible = false;
                //    btnUrun.Visible = true;
                //    btnTumIadeSeriBazli.Visible = true;
                //    btnMarsDepoStok.Visible = true;
                //    //btnMarsDepoAcikSiparisler.Visible = true;
                //    btnVadesiGecmisBorc.Visible = true;
                //    btnOnOdeme.Visible = true;
                //}

                //if (c.RolID == 3) // Finans
                //{
                //    btnYeniSiparis.Visible = false;
                //    btnDetayliSiparis.Visible = false;
                //    btnSiparisIzleme.Visible = false;
                //    btnRapor.Visible = true;
                //    btnMarsSiparis.Visible = true;
                //    btnimeiRapor.Visible = false;
                //    btnimeiSorgulama.Visible = false;
                //    btniade.Visible = true;
                //    // btnKrediTutari.Visible = true;
                //    btnStok.Visible = true;
                //    btnFinansOnayliSiparisler.Visible = true;
                //    btnVadeFarki.Visible = true;
                //}

                //if (c.RolID == 4) //IT
                //{
                //    btnLog.Visible = true;
                //    //btnDestek.Visible = true;
                //    btnSiparis.Visible = false;
                //    btnMusteriTemsilcisi.Visible = true;
                //    btnBayi.Visible = false;
                //    btnDetayliSiparis.Visible = false;
                //    btnSiparisIzleme.Visible = false;
                //}

                //if (c.RolID == 5) // Satın Alma
                //{
                //    btnUrun.Visible = true;
                //    btnSatinAlma.Visible = true;
                //    btnSiparis.Visible = false;
                //    btnDetayliSiparis.Visible = false;
                //    btnSiparisIzleme.Visible = false;
                //    btnStok.Visible = true;
                //}

                //if (c.RolID == 10)
                //{
                //    btnDuyurular.Visible = true;
                //    btnSiparis.Visible = false;
                //    //btnKullanici.Visible = false;
                //    btnBayi.Visible = false;
                //    btnUrun.Visible = true;
                //    btnStokKontrol.Visible = false;
                //    btnUrunYonetimi.Visible = false;
                //    btnMarsDepoStok.Visible = false;
                //}

                //if (Convert.ToInt32(Session["crmKullaniciID"].ToString()) == 63) // Medine özelinde bu iki modülün gözukmesi
                //{
                //    btnYeniIade.Visible = true;
                //    btnYeniIadeSerisiz.Visible = true;
                //    btnYeniIadeHakemHeyeti.Visible = true;
                //}

                ////if (c.RolID == 7) // Temlik
                ////{
                ////    btnTemlik.Visible = true;
                ////    btnSiparis.Visible = false;
                ////    btnSatinAlma.Visible = true;
                ////    btnDetayliSiparis.Visible = false;
                ////    btnSiparisIzleme.Visible = false;
                ////    btnStok.Visible = true;
                ////}


                ////if (c.RolID != 4)
                ////{
                ////    if (c.RolID != 2)
                ////        btnKullanici.Visible = false;

                ////    if (c.RolID != 3)
                ////        btnSatinAlma.Visible = false;

                ////    btnLog.Visible = false;
                ////    btnDestek.Visible = false;
                ////}
                ////else
                ////{
                ////    btnSiparis.Visible = false;
                ////    btnKullanici.Visible = false;
                ////    btnSatinAlma.Visible = false;
                ////}

                #endregion

            }
        }
    }
}