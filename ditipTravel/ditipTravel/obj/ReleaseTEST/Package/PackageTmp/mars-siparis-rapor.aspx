<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mars-siparis-rapor.aspx.cs" Inherits="PortCRMWeb.nakit_satis_rapor" %>

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
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Mars Sipariş Raporu</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Mars Sipariş Raporu</li>
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

            <dx:ASPxGridView ID="grid1" runat="server" Width="100%" CssClass="grid" Theme="Material" DataSourceID="LinqServerModeDataSource1" KeyFieldName="SipID">

               <%-- <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <%--<SettingsDetail ExportMode="All" />--%>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />

                <Columns> 
                    <dx:GridViewDataTextColumn FieldName="SipID" VisibleIndex="0" Visible="false"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SiparisNo" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiKodu" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiAdi" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="MarsTarih" VisibleIndex="4"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>                    
                </Columns>

                <SettingsSearchPanel AllowTextInputTimer="false" CustomEditorID="tbToolbarSearch" ShowApplyButton="True" ShowClearButton="True" Visible="true" />

                <Settings ShowFooter="false" ShowHeaderFilterButton="true" />
                <SettingsPopup>
                    <HeaderFilter Height="200">
                        <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" MinHeight="300" />
                    </HeaderFilter>
                </SettingsPopup>

                <Toolbars>
                    <dx:GridViewToolbar>
                        <Items>

                            <dx:GridViewToolbarItem Text="Dışarı Aktar" Image-IconID="actions_download_16x16office2013" BeginGroup="true" AdaptivePriority="1" Alignment="Left">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="CSV'e Çevir" />
                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="XLS'e Çevir" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="XLSX'e Çevir" />
                                </Items>
                            </dx:GridViewToolbarItem>

                            <dx:GridViewToolbarItem Alignment="Right">
                                <Template>
                                    <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Ara..." Height="100%" Width="300px" ClearButton-DisplayMode="Always">
                                        <Buttons>
                                            <%--<dx:ClearButton DisplayMode="Always" ImagePosition="Right" Image-IconID="find_find_16x16gray" />--%>
                                            <dx:SpinButtonExtended Position="Left" Image-IconID="find_find_16x16gray" />
                                        </Buttons>
                                    </dx:ASPxButtonEdit>
                                </Template>
                            </dx:GridViewToolbarItem>

                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>

                <SettingsPager Position="Top" PageSize="15">
                    <PageSizeItemSettings Items="15, 50, 100, 200" />
                </SettingsPager>

                <SettingsExport EnableClientSideExportAPI="true" />

                <Styles>
                    <Cell Wrap="False" />
                </Styles>

            </dx:ASPxGridView>
            
            <dx:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="PortB2B.vtDataContext" TableName="viewMarsSiparis" OnSelecting="LinqServerModeDataSource1_Selecting" />

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

        </div>
    </div>



</asp:Content>



