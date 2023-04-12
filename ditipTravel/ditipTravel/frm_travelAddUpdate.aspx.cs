using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;

namespace ditipTravel
{
    public partial class frm_travelAddUpdate : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.NumberFormat.CurrencySymbol = "€";
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
        }

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

                        if (Request.QueryString["Uid"] != null)
                        {
                            dbDataContext db = new dbDataContext();

                            var travel = db.tbl_Travels.Where(s => s.id == Convert.ToInt32(Request.QueryString["Uid"])).FirstOrDefault();

                            if (travel != null)
                            {

                                txtName.Text = travel.name;
                                txtSurname.Text = travel.surname;
                                radioButtonListGender.SelectedIndex = (travel.gender == "Erkek" ? 0 : 1);
                                radioButtonListStudent.SelectedIndex = (travel.student == true ? 0 : 1);
                                txtBirthPlace.Text = travel.birthPlace;
                                txtBirthday.Text = travel.birthDay.ToString();
                                txtAirport.Text = travel.airport;
                                txtNationalty.Text = travel.nationality;
                                txtPassaportNo.Text = travel.passaportNo;
                                txtPassaportDate.Text = travel.passaportDate.ToString();
                                txtTc.Text = travel.tcNo.ToString();
                                txtMail.Text = travel.mailAddress;
                                txtMobileNumber.Text = travel.mobilePhone;
                                txtAddress.Text = travel.address;
                                txtState.Text = travel.state;
                                txtPrepaymentAmount.Text = travel.prepaymentAmount.ToString();
                                txtPrepaymentDate.Text = travel.prepaymentDate.ToString();
                                txtDueAmount.Text = travel.dueAmount.ToString();
                                txtDueDate.Text = travel.dueDate.ToString();
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
                tbl_Travel travel = new tbl_Travel();

                travel.name = txtName.Text;
                travel.surname = txtSurname.Text;
                travel.gender = (radioButtonListGender.SelectedIndex == 0 ? "Erkek" : "Kadın");
                travel.student = (radioButtonListStudent.SelectedIndex == 0 ? true : false);
                travel.birthPlace = txtBirthPlace.Text;
                travel.birthDay = (txtBirthday.Text != null ? DateTime.ParseExact(txtBirthday.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) : DateTime.Now);
                travel.airport = txtAirport.Text;
                travel.nationality = txtNationalty.Text;
                travel.passaportNo = txtPassaportNo.Text;
                travel.passaportDate = (txtPassaportDate.Text != null ? DateTime.ParseExact(txtPassaportDate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) : DateTime.Now);
                travel.tcNo = (txtTc.Text != null ? txtTc.Text : "00000000000");
                travel.mailAddress = txtMail.Text;
                travel.mobilePhone = txtMobileNumber.Text.Trim().Replace(" ", string.Empty);
                travel.address = txtAddress.Text;
                travel.state = txtState.Text;
                travel.prepaymentAmount = Convert.ToDecimal(txtPrepaymentAmount.Text.Remove(0, 1));
                travel.prepaymentDate = (txtPrepaymentDate.Text != null ? DateTime.ParseExact(txtPrepaymentDate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) : DateTime.Now);
                travel.dueAmount = Convert.ToDecimal(txtDueAmount.Text.Remove(0, 1));
                travel.dueDate = (txtDueDate.Text != null ? DateTime.ParseExact(txtDueDate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) : DateTime.Now);
                travel.createUser = (Session["username"] != null ? Session["username"].ToString() : "Admin");
                travel.createDate = DateTime.Now;

                db.tbl_Travels.InsertOnSubmit(travel);
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
                var travel = db.tbl_Travels.Where(s => s.id == Convert.ToInt32(Request.QueryString["Uid"])).FirstOrDefault();

                if (travel != null)
                {
                    travel.name = txtName.Text;
                    travel.surname = txtSurname.Text;
                    travel.gender = (radioButtonListGender.SelectedIndex == 0 ? "Erkek" : "Kadın");
                    travel.student = (radioButtonListStudent.SelectedIndex == 0 ? true : false);
                    travel.birthPlace = txtBirthPlace.Text;
                    travel.birthDay = (txtBirthday.Text != null ? DateTime.ParseExact(txtBirthday.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) : DateTime.Now);
                    travel.airport = txtAirport.Text;
                    travel.nationality = txtNationalty.Text;
                    travel.passaportNo = txtPassaportNo.Text;
                    travel.passaportDate = (txtPassaportDate.Text != null ? DateTime.ParseExact(txtPassaportDate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) : DateTime.Now);
                    travel.tcNo = (txtTc.Text != null ? txtTc.Text : "00000000000");
                    travel.mailAddress = txtMail.Text;
                    travel.mobilePhone = txtMobileNumber.Text.Trim().Replace(" ", string.Empty);
                    travel.address = txtAddress.Text;
                    travel.state = txtState.Text;
                    travel.prepaymentAmount = Convert.ToDecimal(txtPrepaymentAmount.Text.Remove(0, 1));
                    travel.prepaymentDate = (txtPrepaymentDate.Text != null ? DateTime.ParseExact(txtPrepaymentDate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) : DateTime.Now);
                    travel.dueAmount = Convert.ToDecimal(txtDueAmount.Text.Remove(0, 1));
                    travel.dueDate = (txtDueDate.Text != null ? DateTime.ParseExact(txtDueDate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) : DateTime.Now);

                    db.SubmitChanges();

                    lblMessageBasarili.Text = "Seyahat başarıyla güncellendi.";
                    PopupMessageBoxBasarili.ShowOnPageLoad = true;
                }
            }
        }
    }
}