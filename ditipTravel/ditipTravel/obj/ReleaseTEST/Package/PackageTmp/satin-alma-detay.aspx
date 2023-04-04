<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="satin-alma-detay.aspx.cs" Inherits="PortCRMWeb.satin_alma_detay" %>
<%@ Register Assembly="DevExpress.Web.v18.2" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
            if (e.item.name == "ONAYLA") {
                e.processOnServer = true;
                e.usePostBack = true;
            }
        }
     </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Satın Alma Detayı <asp:Label ID="lblSatinAlmaNo2" runat="server" Text="PPON"></asp:Label></h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item"><a href="tum-satin-almalar.aspx">Tüm Satin Almalar</a></li>
                            <li class="breadcrumb-item active">Satın Alma Detayı <asp:Label ID="lblSatinAlmaNo" runat="server" Text="PPON"></asp:Label></li>
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

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView1" CssClass="grid" ClientInstanceName="grid2" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False"
                 OnFillContextMenuItems="ASPxGridView1_FillContextMenuItems" OnContextMenuItemClick="ASPxGridView1_ContextMenuItemClick">

               <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                 <SettingsSearchPanel Visible="true" HighlightResults="false" />
                <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />
                <ClientSideEvents ContextMenuItemClick="OnContextMenuItemClick" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Consigment_Note_Nuımber" ReadOnly="True" VisibleIndex="0" Caption="İrsaliye Numarası"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CustomerOrderNumber" ReadOnly="True" VisibleIndex="1" Caption="Satın Alma Numarası"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FinansOnay" ReadOnly="True" VisibleIndex="2"></dx:GridViewDataTextColumn>
                </Columns>

                <SettingsPager Position="Top" PageSize="50">
                    <PageSizeItemSettings Items="5, 10, 25, 50" />
                </SettingsPager>

                <SettingsExport EnableClientSideExportAPI="true" />

                <Styles>
                    <Cell Wrap="False" />
                </Styles>

                <Templates>
                    <DetailRow>

                        <dx:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="TransactionNo" CssClass="grid"
                            Width="100%" EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect">

                            <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="TransactionNo" ReadOnly="True" VisibleIndex="0" Caption="Hareket Numarası"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="MaterialCode" ReadOnly="True" VisibleIndex="1" Caption="Ürün Kodu"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="MaterialName" VisibleIndex="2" Caption="Ürün Açıklaması"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="3" Caption="Miktar"></dx:GridViewDataTextColumn>
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

        </div>
    </div>
</asp:Content>
