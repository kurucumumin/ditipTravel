<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tum-siparisler.aspx.cs" Inherits="PortCRMWeb.tum_siparisler" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        @media (max-width:599px) {

            .grid * {
                /*                font-family: 'Angsana New' !important;*/
                font-size: 11px !important;
            }

            .content {
                padding: 0px !important;
            }
        }
    </style>

    <script type="text/javascript">
        function OnContextMenuItemClick(sender, e) {
            if (e.item.name == "GUNCELLE") {
                e.processOnServer = true;
                e.usePostBack = true;
            }
            else if (e.item.name == "KOPYALA") {
                e.processOnServer = true;
                e.usePostBack = true;
            }
            else if (e.item.name == "IPTAL") {
                e.processOnServer = true;
                e.usePostBack = true;
            }
            else if (e.item.name == "TARIH") {
                e.processOnServer = true;
                e.usePostBack = true;
            }
        }
        function OnContextMenuItemClickDetail(sender, e) {
            if (e.item.name == "IPTAL") {
                e.processOnServer = true;
                e.usePostBack = true;
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
                        <h1 class="m-0 text-dark">Tüm Siparişler</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Tüm Siparişler</li>
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

            <div class="row mb-2">

                <div class="col-sm-6">

                    <dx:ASPxRadioButtonList ID="radioButtonList" SelectedIndex="0" runat="server" RepeatColumns="3" RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="radioButtonList_SelectedIndexChanged">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="Bugün" Value="0" />
                            <dx:ListEditItem Text="Hepsi" Value="1" />
                            <dx:ListEditItem Text="B2B" Value="2" />
                        </Items>

                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
                        LoadingPanel.Show();
                    }" />

                    </dx:ASPxRadioButtonList>

                </div>


                <div class="col-sm-6" style="display: flex; justify-content: flex-end">
                    <dx:ASPxTextBox ID="txtAra" NullText="Sipariş numarasıyla arama yapınız..." CssClass="border-info" runat="server" Width="250px"></dx:ASPxTextBox>
                    &nbsp &nbsp
                        <dx:ASPxButton ID="btnAra" runat="server" CssClass="btn btn-info" Text="ARA" OnClick="btnAra_Click">
                            <ClientSideEvents Click="function(s, e) {
                        LoadingPanel.Show();
                    }" />
                        </dx:ASPxButton>
                </div>

            </div>

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

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView1" ClientInstanceName="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource1"
                KeyFieldName="ID" CssClass="grid" EnableRowsCache="false" OnCustomButtonCallback="ASPxGridView1_CustomButtonCallback"
                OnFillContextMenuItems="ASPxGridView1_FillContextMenuItems" OnContextMenuItemClick="ASPxGridView1_ContextMenuItemClick"
                OnDataBound="ASPxGridView1_DataBound" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">

                <%-- <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="false" HighlightResults="false" />
                <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />
                <ClientSideEvents ContextMenuItemClick="OnContextMenuItemClick" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Width="5%" Caption="PSON">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TopluSiparisNo" Caption="Üst Sip No" Width="5%" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiKodu" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiAdi" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SiparisDurum" Caption="Sipariş Durumu" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OlusturanKisi" ReadOnly="True" VisibleIndex="5"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ToplamAdet" VisibleIndex="6"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TeslimatAdresi" VisibleIndex="7"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="8"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OlusturmaTarih" VisibleIndex="9" ShowInCustomizationForm="True">
                        <%--<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>--%>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OnayTarih" VisibleIndex="10" ShowInCustomizationForm="True">
                        <%-- <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>--%>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Mars" VisibleIndex="11"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="MarsKismi" VisibleIndex="12" Caption="Mars Bilgi"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="MarsTarih" VisibleIndex="13" ShowInCustomizationForm="True">
                        <%-- <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>--%>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="odemeKaydiTipi" VisibleIndex="14"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="TeslimTuru" Caption="Teslim Şekli" VisibleIndex="15"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataHyperLinkColumn PropertiesHyperLinkEdit-Target="_blank" FieldName="KargoTakipNo" VisibleIndex="16">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="https://www.yurticikargo.com/tr/online-servisler/gonderi-sorgula?code={0}"
                            TextFormatString="{0}" TextField="KargoTakipNo" />
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataTextColumn FieldName="KargoTakipNoTarih" VisibleIndex="17" ShowInCustomizationForm="True">
                        <%--<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>--%>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FaturalanmaDurumu" ReadOnly="True" VisibleIndex="18"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="FaturaNumarası" ReadOnly="True" VisibleIndex="19"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataCheckColumn FieldName="B2B" VisibleIndex="20"></dx:GridViewDataCheckColumn>
                </Columns>

                <SettingsSearchPanel AllowTextInputTimer="false" CustomEditorID="tbToolbarSearch" ShowApplyButton="True" ShowClearButton="True" Visible="true" />

                <Settings ShowFooter="false" ShowHeaderFilterButton="true" ShowFilterBar="Hidden" />
                <SettingsPopup>
                    <HeaderFilter Height="200">
                        <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" MinHeight="300" />
                    </HeaderFilter>
                </SettingsPopup>

                <ClientSideEvents EndCallback="OnEndCallback" Init="OnInit" />

                <TotalSummary>
                    <dx:ASPxSummaryItem FieldName="Tutar" SummaryType="Sum" />
                </TotalSummary>

                <Toolbars>
                    <dx:GridViewToolbar>
                        <Items>
                            <dx:GridViewToolbarItem Command="ExportToCsv" Text="CSV'e Çevir" />
                            <dx:GridViewToolbarItem Command="ExportToXlsx" Text="XLSX'e Çevir" />

                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>

                <SettingsPager Position="Top" PageSize="50">
                    <PageSizeItemSettings Items="50, 100, 250, 500" />
                </SettingsPager>
                <SettingsExport EnableClientSideExportAPI="true" />
                <Styles>
                    <Cell Wrap="False" />
                </Styles>
                <SettingsBehavior AllowEllipsisInText="true" />
                <Templates>
                    <DetailRow>

                        <dx:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="ID" AutoGenerateColumns="False" CssClass="grid" Theme="Material"
                            Width="100%" EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect" OnHtmlRowPrepared="detailGrid_HtmlRowPrepared"
                            OnContextMenuItemClick="detailGrid_ContextMenuItemClick" OnFillContextMenuItems="detailGrid_FillContextMenuItems">

                            <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                            <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />
                            <ClientSideEvents ContextMenuItemClick="OnContextMenuItemClickDetail" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SiparisID" ReadOnly="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="UrunKodu" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="UrunAciklamasi" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Miktar" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="GidenMiktar" VisibleIndex="6"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn FieldName="Iptal" VisibleIndex="7"></dx:GridViewDataCheckColumn>
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

            <dx:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="PortB2B.vtDataContext" TableName="viewTumSiparislers" OnSelecting="LinqServerModeDataSource1_Selecting" />


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

    <dx:ASPxPopupControl ID="PopupMessageBoxIptal" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
        HeaderText="<span class='fa fa-exclamation-circle' aria-hidden='true' style='color:red;'></span> Mesaj Ekranı" CloseOnEscape="false"
        CloseAction="CloseButton" ShowFooter="false" EncodeHtml="false">
        <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
            <Paddings Padding="0px" PaddingTop="12px" />
        </ContentStyle>
        <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div class="alert alert-warning" runat="server" id="div1" role="alert" style="margin: 0 10px 10px 10px;">
                    <dx:ASPxLabel ID="lblMessageIptal" Font-Bold="true" runat="server" Text="Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!."></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblSipID" Font-Bold="true" runat="server" Visible="false"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblDetailSipID" Font-Bold="true" runat="server" Visible="false"></dx:ASPxLabel>
                </div>
                <br />
                <dx:ASPxButton ID="btnIptal" runat="server" Text="EVET" CssClass="btn btn-success" OnClick="btnIptal_Click"></dx:ASPxButton>
                &nbsp &nbsp
                       <dx:ASPxButton ID="btnVazgec" runat="server" Text="HAYIR" CssClass="btn btn-danger" OnClick="btnVazgec_Click"></dx:ASPxButton>
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

    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ContainerElementID="Content2" ClientInstanceName="LoadingPanel" Text="İşleminiz yapılıyor. <br/>Lütfen bekleyin!..."
        Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
