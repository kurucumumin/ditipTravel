<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bayi-guncelleme.aspx.cs" Inherits="PortCRMWeb.bayi_guncelleme" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Bayi Güncelleme</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Bayi Güncelleme</li>
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
                <asp:Button ID="btnVazgec" runat="server" class="btn btn-danger" Text="Vazgeç" OnClick="btnVazgec_Click" />
                &nbsp &nbsp
                        <asp:Button ID="btnGuncelle" runat="server" class="btn btn-success" Text="Güncelle" OnClick="btnGuncelle_Click" />
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Ünvanı</span>
                </div>
                <div class="col-7">
                    <dx:ASPxMemo ID="txtAdi" CssClass="form-control" runat="server" Height="30px" Width="100%">
                    </dx:ASPxMemo>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Tipi</span>
                </div>
                <div class="col-7">
                    <dx:ASPxMemo ID="txtTuru" CssClass="form-control" runat="server" Height="30px" Width="40%">
                    </dx:ASPxMemo>
                </div>
            </div>


            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>LOGO Cari Kodu</span>
                </div>
                <div class="col-7">
                     <dx:ASPxMemo ID="txtCariKodu" CssClass="form-control" runat="server" Height="30px" Width="40%">
                    </dx:ASPxMemo>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>OMT</span>
                </div>
                <div class="col-7">
                    <dx:ASPxComboBox ID="drpCrmKullanici" runat="server" ValueType="System.String" DropDownStyle="DropDown" AutoPostBack="true" Height="30px" Width="100%"> </dx:ASPxComboBox>
                </div>
            </div>

             <br />

             <div class="form-row">
                <div class="col-3">
                    <span>Satış Yöneticisi</span>
                </div>
                <div class="col-7">
                    <dx:ASPxComboBox ID="drpCrmSyKullanici" runat="server" ValueType="System.String" DropDownStyle="DropDown" AutoPostBack="true" Height="30px" Width="100%"></dx:ASPxComboBox>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Bayi Maili</span>
                </div>
                <div class="col-7">
                     <dx:ASPxMemo ID="txtMail" CssClass="form-control" runat="server" Height="30px" Width="100%">
                    </dx:ASPxMemo>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>İl</span>
                </div>
                <div class="col-7">
                     <dx:ASPxMemo ID="txtIl" CssClass="form-control" runat="server" Height="30px" Width="40%">
                    </dx:ASPxMemo>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>İlçe</span>
                </div>
                <div class="col-7">
                     <dx:ASPxMemo ID="txtIlce" CssClass="form-control" runat="server" Height="30px" Width="40%">
                    </dx:ASPxMemo>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Bayi Sahibinin Adı</span>
                </div>
                <div class="col-7">
                     <dx:ASPxMemo ID="txtBayiSahibiAdi" CssClass="form-control" runat="server" Height="30px" Width="40%">
                    </dx:ASPxMemo>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Bayi Sahibinin Telefonu</span>
                </div>
                <div class="col-7">
                     <dx:ASPxMemo ID="txtBayiSahibiTel" CssClass="form-control" runat="server" Height="30px" Width="40%">
                    </dx:ASPxMemo>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Yetkili Adı</span>
                </div>
                <div class="col-7">
                     <dx:ASPxMemo ID="txtYetkiliAdi" CssClass="form-control" runat="server" Height="30px" Width="40%">
                    </dx:ASPxMemo>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Yetkili Telefonu</span>
                </div>
                <div class="col-7">
                     <dx:ASPxMemo ID="txtYetkiliTel" CssClass="form-control" runat="server" Height="30px" Width="40%">
                    </dx:ASPxMemo>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Not</span>
                </div>
                <div class="col-7">
                    <dx:ASPxMemo ID="txtNot" CssClass="form-control" runat="server" Height="100px" Width="100%">
                    </dx:ASPxMemo>
                </div>
            </div>

             <br />

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
                                <dx:ASPxLabel ID="lblMessageHata" runat="server" Text="Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!."></dx:ASPxLabel>
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

