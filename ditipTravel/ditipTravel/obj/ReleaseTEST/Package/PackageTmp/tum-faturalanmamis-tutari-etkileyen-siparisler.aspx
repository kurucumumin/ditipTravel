<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tum-faturalanmamis-tutari-etkileyen-siparisler.aspx.cs" Inherits="PortCRMWeb.tum_faturalanmamis_tutari_etkileyen_siparisler" %>

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
                        <h1 class="m-0 text-dark">Faturalanmamış Sipariş Tutarını Etkileyen Siparişler</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Faturalanmamış Sipariş Tutarını Etkileyen Siparişler</li>
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

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView1" runat="server" CssClass="grid" ClientInstanceName="grid" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False">

                <%--<SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="true" />

                <Columns>
                      <dx:GridViewDataTextColumn FieldName="SiparisNumarasi" Caption="Sipariş Numarası" Width="7%" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiKodu" Caption="Bayi Kodu" Width="5%" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="BayiAdi" Caption="Bayi Adı" Width="30%" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="TeslimatAdresi" Caption="Teslimat Adresi" Width="50%" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                   <%-- <dx:GridViewDataTextColumn FieldName="Miktar" Caption="Adet" Width="5%" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>--%>
                       <dx:GridViewDataTextColumn FieldName="Tutar" Caption="Tutar" Width="5%" PropertiesTextEdit-DisplayFormatString="c" CellStyle-HorizontalAlign="Left" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                </Columns>

               <%-- <SettingsSearchPanel AllowTextInputTimer="false" CustomEditorID="tbToolbarSearch" ShowApplyButton="True" ShowClearButton="True" Visible="true" />--%>
                <Settings ShowFooter="false" ShowHeaderFilterButton="true" ShowFilterBar="Visible"/>
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

                <Styles >
                    <Cell Wrap="False"  />
                </Styles>
                <SettingsBehavior AllowEllipsisInText="true" />

                 <Templates>
                    <DetailRow>

                        <dx:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="OrderNumber" CssClass="grid"
                            Width="100%" EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect" OnHtmlRowPrepared="detailGrid_HtmlRowPrepared">

                              <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="OrderNumber" ReadOnly="True" VisibleIndex="0" Visible="false"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="MaterialCode" VisibleIndex="0" Caption="Ürün Kodu"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="MaterialName" VisibleIndex="1" Caption="Ürün Açıklaması"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="2" Caption="Miktar"></dx:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowFooter="True" />
                            <SettingsPager EnableAdaptivity="true" />
                            <Styles Header-Wrap="True" />
                        </dx:ASPxGridView>
                    </DetailRow>
                </Templates>

                <SettingsDetail ShowDetailRow="true" />

            </dx:ASPxGridView>
            
            <%--  <dx:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="PortB2B.vtDataContext" TableName="viewBekleyenSiparislers" OnSelecting="LinqServerModeDataSource1_Selecting" />--%>

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

