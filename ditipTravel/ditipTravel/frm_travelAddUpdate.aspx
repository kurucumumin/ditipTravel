<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frm_travelAddUpdate.aspx.cs" Inherits="ditipTravel.frm_travelAddUpdate" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 runat="server" id="pageName" class="m-0 text-dark">Seyahat Ekle</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="frm_AllTravel.aspx">Ana Sayfa</a></li>
                            <li runat="server" id="pageName2" class="breadcrumb-item active">Seyahat Ekle</li>
                        </ol>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>

        <!-- /.content-header -->

        <div class="content" style="padding-left: 30px; padding-right: 30px;">

            <div class="form-row">
                <div class="col">
                    <hr />
                </div>
            </div>

            <div style="display: flex; justify-content: flex-end">
                <asp:Button ID="btnCancel" runat="server" class="btn btn-outline-dark" Text="İPTAL" OnClick="btnCancel_Click" />
                &nbsp &nbsp
                        <asp:Button ID="btnUpdate" runat="server" class="btn btn-success" Text="GÜNCELLE" OnClick="btnUpdate_Click" />
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>İsim</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtName" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Soyisim</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtSurname" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Cinsiyet</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxRadioButtonList ID="radioButtonListGender" SelectedIndex="0" runat="server" RepeatColumns="2" RepeatLayout="Flow">
                            <CaptionSettings Position="Top" />
                            <Items>
                                <dx:ListEditItem Text="Erkek" Value="0" />
                                <dx:ListEditItem Text="Kadın" Value="1" />
                            </Items>
                        </dx:ASPxRadioButtonList>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Öğrenci mi?</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxRadioButtonList ID="radioButtonListStudent" SelectedIndex="0" runat="server" RepeatColumns="2" RepeatLayout="Flow">
                            <CaptionSettings Position="Top" />
                            <Items>
                                <dx:ListEditItem Text="Evet" Value="0" />
                                <dx:ListEditItem Text="Hayır" Value="1" />
                            </Items>
                        </dx:ASPxRadioButtonList>
                    </div>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Doğum Yeri</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtBirthPlace" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Doğum Tarihi</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtBirthday" CssClass="form-control" runat="server" Width="70%">
                            <MaskSettings Mask="00-00-0000" />  
                        </dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Havaalanı</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtAirport" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Uyruk</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtNationalty" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Pasaport No</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtPassaportNo" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Pasaport Tarihi</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtPassaportDate" CssClass="form-control" runat="server" Width="70%">
                             <MaskSettings Mask="00-00-0000" /> 
                        </dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>TC No</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtTc" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Mail Adres</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtMail" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Cep Telefonu</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtMobileNumber" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Adres</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtAddress" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Eyalet</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtState" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Ön Ödeme Tutarı</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtPrepaymentAmount" CssClass="form-control" runat="server" Width="70%" DisplayFormatString="{0:C}"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Ön Ödeme Tarihi</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtPrepaymentDate" CssClass="form-control" runat="server" Width="70%">
                             <MaskSettings Mask="00-00-0000" /> 
                        </dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Son Ödeme Tutarı</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtDueAmount" CssClass="form-control" runat="server" Width="70%" DisplayFormatString="{0:C}"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Son Ödeme Tarihi</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtDueDate" CssClass="form-control" runat="server" Width="70%">
                             <MaskSettings Mask="00-00-0000" /> 
                        </dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <dx:ASPxPopupControl ID="PopupMessageBoxHata" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
                HeaderText="Mesaj Ekranı" CloseOnEscape="false"
                CloseAction="CloseButton" ShowFooter="false">
                <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
                    <Paddings Padding="0px" PaddingTop="12px" />
                </ContentStyle>
                <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <div class="alert alert-danger" runat="server" id="div1" role="alert">
                            <strong>
                                <dx:ASPxLabel ID="lblMessageHata" ForeColor="White" runat="server" Text="Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!."></dx:ASPxLabel>
                            </strong>
                        </div>

                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <dx:ASPxPopupControl ID="PopupMessageBoxBasarili" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
                HeaderText="Mesaj Ekranı" CloseOnEscape="false"
                CloseAction="CloseButton" ShowFooter="false">
                <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
                    <Paddings Padding="0px" PaddingTop="12px" />
                </ContentStyle>
                <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <div class="alert alert-success" runat="server" id="div2" role="alert">
                            <strong>
                                <dx:ASPxLabel ID="lblMessageBasarili" ForeColor="White" runat="server" Text="Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!."></dx:ASPxLabel>
                            </strong>
                        </div>

                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

        </div>

    </div>
</asp:Content>
