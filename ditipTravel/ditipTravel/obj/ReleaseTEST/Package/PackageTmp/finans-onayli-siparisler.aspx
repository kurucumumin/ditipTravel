<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="finans-onayli-siparisler.aspx.cs" Inherits="PortCRMWeb.finans_onayli_siparisler" %>

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
                        <h1 class="m-0 text-dark">Finans Onaylı Siparişler</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Finans Onaylı Siparişler</li>
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

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView1" ClientInstanceName="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False"
                CssClass="grid" EnableRowsCache="false" OnDataBound="ASPxGridView1_DataBound" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="true" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Width="5%" Caption="PSON">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TopluSiparisNo" Caption="Üst Sip No" Width="5%" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiKodu" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiAdi" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="FinansAtamaID" Caption="Atanan Kişi" AdaptivePriority="1" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="LinqDataSource1" ValueField="ID" TextField="KullaniciAdi" ValueType="System.Int32" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn FieldName="FinansAtamaTarih" VisibleIndex="4" ShowInCustomizationForm="True">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="OlusturanKisi" ReadOnly="True" VisibleIndex="5"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="OlusturmaTarih" VisibleIndex="6" ShowInCustomizationForm="True">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="OnayTarih" VisibleIndex="7" ShowInCustomizationForm="True">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="odemeKaydiTipi" VisibleIndex="8"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="TeslimTuru" Caption="Teslim Şekli" VisibleIndex="9"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="FinansaDusmeDurumu" Caption="Finans Düşme Durumu" VisibleIndex="10"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiLimit" VisibleIndex="12" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ToplamAdet" VisibleIndex="13"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="14"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Red" VisibleIndex="15"></dx:GridViewDataCheckColumn>

                </Columns>

                <%--<SettingsSearchPanel AllowTextInputTimer="false" CustomEditorID="tbToolbarSearch" ShowApplyButton="True" ShowClearButton="True" Visible="true" />--%>
                <Settings ShowFooter="false" ShowHeaderFilterButton="true" />
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
                            <dx:GridViewToolbarItem Command="ExportToXls" Text="XLS'e Çevir" />
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

                        <dx:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="ID" CssClass="grid"
                            Width="100%" EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect">

                             <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SiparisID" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="UrunKodu" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="UrunAciklamasi" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Miktar" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
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

