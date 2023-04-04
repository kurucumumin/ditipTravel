<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="stok-kontrol.aspx.cs" Inherits="PortCRMWeb.stok_kontrol" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Stok Kontrol</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Stok Kontrol</li>
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
                  <asp:Button ID="btnKaydet" runat="server" class="btn btn-success" Text="KAYDET" OnClick="btnKaydet_Click" />
                &nbsp &nbsp
                <asp:Button ID="btnVazgeç" runat="server" class="btn btn-outline-dark" Text="VAZGEÇ" OnClick="btnVazgeç_Click" />
            </div>

            <div class="form-row">
                <div class="col-7"></div>
                <div class="col">
                </div>

            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Stok Kontrolü ?</span>
                </div>
                <div class="col-7">
                   <dx:ASPxRadioButtonList ID="radioStok" SelectedIndex="0" runat="server" RepeatColumns="2" RepeatLayout="Flow" AutoPostBack="true">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="Evet" Value="0" />
                            <dx:ListEditItem Text="Hayır" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </div>
            </div>

            <div class="form-row">
                <div class="col">
                    <hr />
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
