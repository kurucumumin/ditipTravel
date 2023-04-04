<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="onay-bekleyen-siparislerim.aspx.cs" Inherits="PortCRMWeb.onay_bekleyen_siparislerim" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style type="text/css">
        @media (max-width:599px) {

            .grid * {
/*                font-family: 'Angsana New' !important;*/
                font-size: 11px !important;
            }
            .content {
                padding:0px !important;
            }
        }
    </style>

    <script type="text/javascript">
        function OnContextMenuItemClick(sender, e) {
            if (e.item.name == "GUNCELLE") {
                e.processOnServer = true;
                e.usePostBack = true;
                LoadingPanel.Show();
            }
            else if (e.item.name == "ATAMA") {
                e.processOnServer = true;
                e.usePostBack = true;
                LoadingPanel.Show();
            }
            else if (e.item.name == "TARIH") {
                e.processOnServer = true;
                e.usePostBack = true;
                LoadingPanel.Show();
            }
            else if (e.item.name == "DONUSTUR") {
                e.processOnServer = true;
                e.usePostBack = true;
                LoadingPanel.Show();
            }
        }
        function OnEndCallback(s, e) {
            popup.Show();
            var keyValue = gv.cpKeyValue;
            popup.PerformCallback(keyValue);
        }
        function OnInit(s, e) {
            if (s.cp_UnitPriceSummary != null) {
                label.SetText("Toplam Tutar: " + s.cp_UnitPriceSummary);
                delete (s.cp_UnitPriceSummary);
            }
        }
        function OnEndCallback(s, e) {
            if (s.cp_UnitPriceSummary != null) {
                label.SetText("Toplam Tutar: " + s.cp_UnitPriceSummary);
                delete (s.cp_UnitPriceSummary);
            }
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <!-- Content Header (Page header)    deneme -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Onay Bekleyen Parçalı Siparişlerim</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Onay Bekleyen Parçalı Siparişlerim</li>
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

            <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
                <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
            </dx:ASPxCallback>

            <div class="form-row">

                <div class="col-sm-9">
                    <dx:ASPxRadioButtonList ID="radioButtonList" SelectedIndex="0" runat="server" RepeatColumns="3" RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="radioButtonList_SelectedIndexChanged" Visible="false">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="CRM" Value="0" />
                            <dx:ListEditItem Text="B2B" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </div>

                <div class="col-sm-3" style="display: flex; justify-content: flex-end">

                    <dx:ASPxButton ID="btnYeni" runat="server" CssClass="btn btn-info" Text="YENİ" OnClick="btnYeni_Click">
                        <ClientSideEvents Click="function(s, e) {
                        LoadingPanel.Show();
                    }" />
                    </dx:ASPxButton>
                    &nbsp &nbsp
                        <dx:ASPxButton ID="btnOnayla" runat="server" CssClass="btn btn-success" Text="ONAYLA" OnClick="btnOnayla_Click">
                            <ClientSideEvents Click="function(s, e) {
                        LoadingPanel.Show();
                    }" />
                        </dx:ASPxButton>
                    &nbsp &nbsp
                         <dx:ASPxButton ID="btnIptaEt" runat="server" CssClass="btn btn-danger" Text="İPTAL ET" OnClick="btnIptaEt_Click">
                             <ClientSideEvents Click="function(s, e) {
                        LoadingPanel.Show();
                    }" />
                         </dx:ASPxButton>

                </div>

            </div>

             &nbsp &nbsp

               <div class="row mb-2">

                <div class="col-sm-6">
                </div>

                <div class="col-sm-6">

                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">
                            <dx:ASPxLabel ID="ASPxLabel1" Font-Bold="true" runat="server" Text="" ClientInstanceName="label">
                            </dx:ASPxLabel>
                        </li>
                    </ol>

                </div>

            </div>

              <dx:ASPxGridView ID="ASPxGridView1" CssClass="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False"
                  OnFillContextMenuItems="ASPxGridView1_FillContextMenuItems" OnContextMenuItemClick="ASPxGridView1_ContextMenuItemClick"
                  OnDataBound="ASPxGridView1_DataBound" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">

                  <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />

                  <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                  <SettingsPager Position="Top" PageSize="20">
                      <PageSizeItemSettings Items="50, 100, 250, 500" />
                  </SettingsPager>
                  <Settings ShowHeaderFilterButton="True" />
                  <SettingsSearchPanel Visible="True" />

                  <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />
                  <ClientSideEvents ContextMenuItemClick="OnContextMenuItemClick" />

                  <Columns>
                      <dx:GridViewCommandColumn ShowSelectCheckbox="True" ShowClearFilterButton="true" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="3%" Caption="Seç" />
                      <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" ReadOnly="True" Width="5%" Caption="PSON">
                          <EditFormSettings Visible="False"></EditFormSettings>
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="BayiKodu" VisibleIndex="2"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="BayiAdi" VisibleIndex="3"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataDateColumn FieldName="odemeKaydiTipi" Caption="Ödeme Yöntemi" VisibleIndex="6"></dx:GridViewDataDateColumn>
                      <dx:GridViewDataDateColumn FieldName="TeslimTuru" Caption="Teslim Şekli" VisibleIndex="7"></dx:GridViewDataDateColumn>
                      <dx:GridViewDataDateColumn FieldName="FinansaDusmeDurumu" Caption="Finans Düşme Durumu" VisibleIndex="8"></dx:GridViewDataDateColumn>
                      <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="SiparisDurumu" Caption="Satış Sipariş Durumu" VisibleIndex="4"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="OlusturanKisi" ReadOnly="True" VisibleIndex="5"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataComboBoxColumn FieldName="FinansAtamaID" Caption="Atanan Kişi" AdaptivePriority="1" VisibleIndex="10">
                          <PropertiesComboBox DataSourceID="LinqDataSource1" ValueField="ID" TextField="KullaniciAdi" ValueType="System.Int32" />
                      </dx:GridViewDataComboBoxColumn>
                      <dx:GridViewDataTextColumn FieldName="ToplamAdet" VisibleIndex="11"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="TeslimatAdresi" VisibleIndex="12"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="13"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="OlusturmaTarih" VisibleIndex="14"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="FinansOnayGUID" Caption="GUID" VisibleIndex="15"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="TopluSiparisNo" Caption="Üst Sip No" VisibleIndex="16"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataCheckColumn FieldName="B2B" VisibleIndex="17" AdaptivePriority="1" Width="3%"></dx:GridViewDataCheckColumn>
                  </Columns>

                  <ClientSideEvents EndCallback="OnEndCallback" Init="OnInit" />

                  <TotalSummary>
                      <dx:ASPxSummaryItem FieldName="Tutar" SummaryType="Sum" />
                  </TotalSummary>

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

                  <Templates>
                      <DetailRow>

                          <dx:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="ID" CssClass="grid"
                              Width="100%" EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect">

                              <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                              <Columns>
                                  <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="SiparisID" ReadOnly="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="UrunKodu" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="UrunAciklamasi" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="VadeGrubu" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="Miktar" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                              </Columns>
                              <Settings ShowFooter="True" />
                              <SettingsPager EnableAdaptivity="true" Position="Top" PageSize="50">
                                  <PageSizeItemSettings Items="50, 100, 250, 500" />
                              </SettingsPager>
                              <Styles Header-Wrap="True" />
                          </dx:ASPxGridView>
                      </DetailRow>
                  </Templates>

                  <SettingsDetail ShowDetailRow="true" />

              </dx:ASPxGridView>

            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="PortCRMWeb.vtDataContext" EntityTypeName="" Select="new (ID,KullaniciAdi)" TableName="CrmKullanicilars"></asp:LinqDataSource>

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
                    <dx:ASPxLabel ID="lblMessageBilgi" Font-Bold="true" runat="server" Text=""></dx:ASPxLabel>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

     <dx:ASPxPopupControl ID="PopupMessageBoxTarih" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
        HeaderText="<span class='fa fa-exclamation-circle' aria-hidden='true' style='color:red;'></span> Mesaj Ekranı" CloseOnEscape="false"
        CloseAction="CloseButton" ShowFooter="false" EncodeHtml="false">
        <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
            <Paddings Padding="0px" PaddingTop="12px" />
        </ContentStyle>
        <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div class="form-row">
                    <div class="col-1">
                        <br />
                    </div>
                    <div class="col-3">
                        <span>Tarih</span>
                        <br />
                    </div>
                    <div class="col-8">
                        <dx:ASPxTextBox ID="txtTarihPopup" runat="server" Width="100%">
                            <MaskSettings Mask="dd-MM-yyyy HH:mm:ss" />
                        </dx:ASPxTextBox>
                    </div>
                </div>
                <dx:ASPxLabel ID="lblTarihSipID" Font-Bold="true" runat="server" Visible="false"></dx:ASPxLabel>
                <br />
                <dx:ASPxButton ID="btnDegistir" runat="server" Text="DEĞİŞTİR" CssClass="btn btn-success" OnClick="btnDegistir_Click"></dx:ASPxButton>
                &nbsp &nbsp
                       <dx:ASPxButton ID="btnVazgecTarih" runat="server" Text="VAZGEÇ" CssClass="btn btn-danger" OnClick="btnVazgecTarih_Click"></dx:ASPxButton>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

     <dx:ASPxPopupControl ID="PopupMessageBoxDonustur" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
        HeaderText="<span class='fa fa-exclamation-circle' aria-hidden='true' style='color:red;'></span> Mesaj Ekranı" CloseOnEscape="false"
        CloseAction="CloseButton" ShowFooter="false" EncodeHtml="false">
        <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
            <Paddings Padding="0px" PaddingTop="12px" />
        </ContentStyle>
        <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div class="form-row">
                    <div class="col-1">
                        <br />
                    </div>
                    <div class="col-3">
                    <span>Ödeme Şekli</span>
                </div>
                <div class="col-8">
                    <dx:ASPxRadioButtonList ID="radioButtonListDonustur" SelectedIndex="0" runat="server" RepeatColumns="3" RepeatLayout="Flow" AutoPostBack="true">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="Vadeli" Value="0" />
                            <dx:ListEditItem Text="Nakit" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </div>
                </div>
                <dx:ASPxLabel ID="lblDonusturSipID" Font-Bold="true" runat="server" Visible="false"></dx:ASPxLabel>
                <br />
                <dx:ASPxButton ID="btnDonustur" runat="server" Text="DÖNÜŞTÜR" CssClass="btn btn-success" OnClick="btnDonustur_Click"></dx:ASPxButton>
                &nbsp &nbsp
                       <dx:ASPxButton ID="btnVazgecDonustur" runat="server" Text="VAZGEÇ" CssClass="btn btn-danger" OnClick="btnVazgecDonustur_Click"></dx:ASPxButton>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ContainerElementID="Content2" ClientInstanceName="LoadingPanel" Text="İşleminiz yapılıyor. <br/>Lütfen bekleyin!..."
        Modal="True">
    </dx:ASPxLoadingPanel>

</asp:Content>

