<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tum-loglar.aspx.cs" Inherits="PortCRMWeb.tum_loglar" %>

<%@ Register Assembly="DevExpress.Web.v18.2" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Content Wrapper. Contains page content DENEME -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Log Hareketleri</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Log Hareketleri</li>
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

             <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView2" ClientInstanceName="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1" CssClass="grid" EnableRowsCache="false" KeyFieldName="ID" OnHtmlRowPrepared="ASPxGridView2_HtmlRowPrepared">

                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="true" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="BayiAdi" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OlusturanKisi" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OlusturmaTarih" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Modul" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mesaj" VisibleIndex="5"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="IslemTipi" VisibleIndex="0"></dx:GridViewDataTextColumn>
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

                  <SettingsPager Position="Top" PageSize="10">
                    <PageSizeItemSettings Items="50, 100, 250, 500" />
                </SettingsPager>
                <%--<SettingsBehavior ConfirmDelete="true" EnableRowHotTrack="true" />--%>
                <SettingsExport EnableClientSideExportAPI="true" />
                <Styles>
                    <Cell Wrap="False" />
                </Styles>

            </dx:ASPxGridView>

           <%-- <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView1" ClientInstanceName="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1" CssClass="grid" EnableRowsCache="false">

                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="true" />

                <Settings ShowFilterBar="Visible" />
                                        <SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />
                                        <SettingsCustomizationDialog Enabled="true" />
                           

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="BayiAdi" VisibleIndex="0"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OlusturanKisi" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OlusturmaTarih" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Modul" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mesaj" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="IslemTipi" VisibleIndex="5"></dx:GridViewDataTextColumn>
                </Columns>

                <Toolbars>
                    <dx:GridViewToolbar>
                        <Items>
                            <dx:GridViewToolbarItem Command="ShowCustomizationDialog" Text="Filtrele" />
                            <dx:GridViewToolbarItem Command="Refresh" Text="Yenile" />
                            <dx:GridViewToolbarItem Command="ExportToCsv" Text="CSV'e Çevir" />
                            <dx:GridViewToolbarItem Command="ExportToXls" Text="XLS'e Çevir" />
                            <dx:GridViewToolbarItem Command="ExportToXlsx" Text="XLSX'e Çevir" />
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>

                <SettingsPager Position="Top" PageSize="50">
                    <PageSizeItemSettings Items="5, 10, 25, 50" />
                </SettingsPager>

                <SettingsExport EnableClientSideExportAPI="true" />

                <Styles>
                    <Cell Wrap="False" />
                </Styles>

            </dx:ASPxGridView>--%>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:PortB2BConnectionString %>' SelectCommand="SELECT * FROM [Log] ORDER BY [ID] DESC"></asp:SqlDataSource>

        </div>
    </div>


</asp:Content>
