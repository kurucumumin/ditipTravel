<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="urun-ozellikleri.aspx.cs" Inherits="PortCRMWeb.urun_ozellikleri" %>

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
                        <h1 class="m-0 text-dark">Ürün Yönetimi</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Ürün Yönetimi</li>
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

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView1" runat="server" Width="100%" CssClass="grid" Theme="Material" ClientInstanceName="grid" AutoGenerateColumns="False" 
                OnRowUpdating="ASPxGridView1_RowUpdating" OnRowInserting="ASPxGridView1_RowInserting">

               <%-- <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="false" />

                <Columns>
                    <dx:GridViewCommandColumn ShowCancelButton="true" ShowEditButton="true" ShowNewButton="true" Width="150" VisibleIndex="0" />
                    <dx:GridViewDataTextColumn FieldName="ID" Caption="ID" VisibleIndex="0" ReadOnly="True" Width="150">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UrunKodu" Caption="Ürün Kodu" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Kategori" Caption="Kategori" VisibleIndex="2" Width="150"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Marka" Caption="Marka" VisibleIndex="3" Width="150"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Model" Caption="Model" VisibleIndex="7" Width="150"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Renk" Caption="Renk" VisibleIndex="7" Width="60"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UrunAciklama" Caption="Ürün Açıklama" VisibleIndex="8" Width="150"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="EkranBoyutu" Caption="Ekran Boyutu" VisibleIndex="9" Width="60"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MegapikselKamera" Caption="Megapiksel Kamera" VisibleIndex="9" Width="60"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DahiliHafiza" Caption="Dahili Hafıza" VisibleIndex="9" Width="60"></dx:GridViewDataTextColumn>
                    <%--<dx:GridViewDataCheckColumn FieldName="Aktif" Caption="Aktif" VisibleIndex="9" Width="150"></dx:GridViewDataCheckColumn>--%>
                    <dx:GridViewDataTextColumn FieldName="TanitimYazilari" Caption="Tanıtım Yazıları" VisibleIndex="9" Width="150"></dx:GridViewDataTextColumn>
                </Columns>


                <SettingsSearchPanel AllowTextInputTimer="false" CustomEditorID="tbToolbarSearch" ShowApplyButton="True" ShowClearButton="True" Visible="true" />

                <Settings ShowFooter="false" ShowHeaderFilterButton="true" ShowFilterBar="Visible" />

                <%--<SettingsDataSecurity AllowInsert="false" />
                <EditFormLayoutProperties>
                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
                </EditFormLayoutProperties>--%>

                <SettingsPopup>
                    <HeaderFilter Height="500">
                        <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
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

                            <dx:GridViewToolbarItem ItemStyle-CssClass="alert alert-default-light" NavigateUrl="javascript:grid.ClearFilter();" Name="YeniKullanici" Text="Tüm Filtreleri Temizle" Image-IconID="filter_clearfilter_16x16office2013" BeginGroup="true">
                                <Image IconID="filter_clearfilter_16x16office2013">
                                </Image>
                            </dx:GridViewToolbarItem>

                            <dx:GridViewToolbarItem Alignment="Right">
                                <Template>
                                    <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Ara..." Height="100%" Width="300px" ClearButton-DisplayMode="Always">
                                        <Buttons>
                                            <dx:SpinButtonExtended Position="Left" Image-IconID="find_find_16x16gray" />
                                        </Buttons>
                                    </dx:ASPxButtonEdit>
                                </Template>
                            </dx:GridViewToolbarItem>

                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>

                <SettingsPager Position="Top" PageSize="100">
                    <PageSizeItemSettings Items="100, 200, 250, 500" />
                </SettingsPager>

                <SettingsExport EnableClientSideExportAPI="true" />

                <Styles Header-HorizontalAlign="Center">
                    <Cell Wrap="False" HorizontalAlign="Center" />
                </Styles>

                <%-- <SettingsBehavior AllowEllipsisInText="true" />--%>
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
