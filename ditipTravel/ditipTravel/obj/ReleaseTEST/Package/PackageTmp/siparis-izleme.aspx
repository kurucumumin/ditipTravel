<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="siparis-izleme.aspx.cs" Inherits="PortCRMWeb.siparis_izleme" %>

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

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView1" ClientInstanceName="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False"
                CssClass="grid" EnableRowsCache="false">

                <%--<SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="true" HighlightResults="false" />
                <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="SiparisNo" VisibleIndex="0" ReadOnly="True" Width="50">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiKodu" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiAdi" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Onay" VisibleIndex="3"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="Red" VisibleIndex="3"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="Mars" VisibleIndex="4"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="OnayTarih" VisibleIndex="5" Caption="Ödeme Onay"  ShowInCustomizationForm="True">
                        <%-- <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>--%>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="LogoSiparis" VisibleIndex="7"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="MarsBilgi" VisibleIndex="8"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="MarsBilgiTarih" VisibleIndex="9" Caption="İrsaliye Tarih Mars"  ShowInCustomizationForm="True">
                         <%--<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>--%>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="LogoIrsaliye" VisibleIndex="10"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="SAP" VisibleIndex="11"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="TAXIM" VisibleIndex="12"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="LEADTIME" VisibleIndex="13" Caption="Lead Time Minute Mars"></dx:GridViewDataTextColumn>
                     <dx:GridViewDataDateColumn FieldName="TeslimTuru" Caption="Teslim Şekli" VisibleIndex="14"></dx:GridViewDataDateColumn>
                     <dx:GridViewDataHyperLinkColumn PropertiesHyperLinkEdit-Target="_blank" FieldName="KargoTakipNo" VisibleIndex="15">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="https://www.yurticikargo.com/tr/online-servisler/gonderi-sorgula?code={0}"
                            TextFormatString="{0}" TextField="KargoTakipNo" />
                    </dx:GridViewDataHyperLinkColumn>
                     <dx:GridViewDataTextColumn FieldName="KargoTakipNoTarih" VisibleIndex="16" ShowInCustomizationForm="True">
                         <%--<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:MM:ss" EditFormat="DateTime"></PropertiesDateEdit>--%>
                    </dx:GridViewDataTextColumn>
                   
                </Columns>

                <%--<SettingsSearchPanel AllowTextInputTimer="false" CustomEditorID="tbToolbarSearch" ShowApplyButton="True" ShowClearButton="True" Visible="true" />--%>
                <Settings ShowFooter="false" ShowHeaderFilterButton="true" />
                <SettingsPopup>
                    <HeaderFilter Height="200">
                        <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" MinHeight="300" />
                    </HeaderFilter>
                </SettingsPopup>

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

                        <dx:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="IMEI" CssClass="grid"
                            Width="100%" EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect">

                            <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="IMEI" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="UrunKodu" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="MarkaModel" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="IrsaliyeNo" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FisNo" VisibleIndex="3"></dx:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowFooter="True" />
                            <SettingsPager EnableAdaptivity="true" />
                            <Styles Header-Wrap="True" />
                        </dx:ASPxGridView>
                    </DetailRow>
                </Templates>

                <SettingsDetail ShowDetailRow="true" />

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

