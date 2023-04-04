<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="omt-bazli-urunler.aspx.cs" Inherits="PortCRMWeb.omt_bazli_urunler" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header)    deneme -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Satışa Kapanan Ürünler</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Satışa Kapanan Ürünler</li>
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
                <div class="col-sm-9">
                </div>

                <div class="col-sm-3" style="display: flex; justify-content: flex-end">
                    <asp:Button ID="btnVazgeç" runat="server" class="btn btn-outline-dark" Text="VAZGEÇ" OnClick="btnVazgeç_Click" />
                    &nbsp &nbsp
                        <asp:Button ID="btnKaydet" runat="server" class="btn btn-success" Text="KAYDET" OnClick="btnKaydet_Click" />
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-1">
                    <span>Müşteri Temsilcisi</span>
                </div>
                <div class="col-5">
                    <dx:ASPxComboBox ID="cmbMusteriTemsilcisi" CssClass="form-control" runat="server" ValueType="System.String" Width="50%" AutoPostBack="true"></dx:ASPxComboBox>
                </div>
            </div>

            <br />

            <br />

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False">

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />

                <SettingsAdaptivity AdaptivityMode="HideDataCells" />
                <SettingsPager Position="Top" PageSize="20">
                    <PageSizeItemSettings Items="50, 100, 250, 500" />
                </SettingsPager>
                <Settings ShowHeaderFilterButton="True" />
                <SettingsSearchPanel Visible="True" />

                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" ShowClearFilterButton="true" SelectAllCheckboxMode="Page" Width="5%" Caption="Seç" />
                    <dx:GridViewDataTextColumn FieldName="CODE" VisibleIndex="1" Width="10%" Caption="Ürün Kodu">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NAME" VisibleIndex="2" Width="30%" Caption="Ürün Açıklaması">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FIYAT" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="c" Width="5%" Caption="Fiyat">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="STOK" VisibleIndex="4" Width="5%" Caption="Stok">
                    </dx:GridViewDataTextColumn>
                </Columns>


                <Toolbars>
                    <dx:GridViewToolbar>
                        <Items>
                            <dx:GridViewToolbarItem Command="ExportToCsv" Text="CSV'e Çevir" />
                            <dx:GridViewToolbarItem Command="ExportToXls" Text="XLS'e Çevir" />
                            <dx:GridViewToolbarItem Command="ExportToXlsx" Text="XLSX'e Çevir" />
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Styles>
                    <Cell Wrap="False" />
                </Styles>
                <SettingsBehavior AllowFocusedRow="true" />
            </dx:ASPxGridView>
        </div>
    </div>

    <dx:ASPxPopupControl ID="PopupMessageBoxBilgi" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
        HeaderText="<span class='fa fa-exclamation-circle' aria-hidden='true' style='color:red;'></span> Mesaj Ekranı" CloseOnEscape="false"
        CloseAction="CloseButton" ShowFooter="false" EncodeHtml="false">
        <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
            <Paddings Padding="0px" PaddingTop="12px" />
        </ContentStyle>
        <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div class="alert alert-warning" runat="server" id="div2" role="alert" style="margin: 0 10px 10px 10px;">
                    <dx:ASPxLabel ID="lblMessageBilgi" Font-Bold="true" runat="server" Text="Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!."></dx:ASPxLabel>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

