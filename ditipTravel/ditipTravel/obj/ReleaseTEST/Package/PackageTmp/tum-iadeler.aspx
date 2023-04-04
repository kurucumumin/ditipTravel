<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tum-iadeler.aspx.cs" Inherits="PortCRMWeb.tum_iadeler" %>
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
           }
           else if (e.item.name == "KOPYALA") {
               e.processOnServer = true;
               e.usePostBack = true;
           }
       }
       function OnEndCallback(s, e) {
           popup.Show();
           var keyValue = gv.cpKeyValue;
           popup.PerformCallback(keyValue);
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
                        <h1 class="m-0 text-dark">Tüm İadeler</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Tüm İadeler</li>
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
                CssClass="grid" EnableRowsCache="false" OnFillContextMenuItems="ASPxGridView1_FillContextMenuItems" OnContextMenuItemClick="ASPxGridView1_ContextMenuItemClick">

              <%--  <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                  <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="true" />
                <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />
                <ClientSideEvents ContextMenuItemClick="OnContextMenuItemClick" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Width="5%" Caption="PSRN">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiKodu" VisibleIndex="1" Width="5%"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiAdi" VisibleIndex="2" Width="10%"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="IadeDurumu" Caption="İade Durumu" VisibleIndex="3" Width="16%"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OlusturanKisi" ReadOnly="True" VisibleIndex="4" Width="5%"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="OlusturmaTarih" VisibleIndex="5" Width="5%"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ToplamAdet" VisibleIndex="6" Width="3%"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="7" Width="10%"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="omtOnay" VisibleIndex="8" Width="5%"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn FieldName="omtOnayTarih" VisibleIndex="9" Width="5%"></dx:GridViewDataDateColumn>
                     <dx:GridViewDataCheckColumn FieldName="omtHeadOnay" VisibleIndex="10" Width="5%"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn FieldName="omtHeadOnayTarih" VisibleIndex="11" Width="5%"></dx:GridViewDataDateColumn>
                     <dx:GridViewDataCheckColumn FieldName="TemlikOnay" VisibleIndex="12" Width="5%"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn FieldName="TemlikOnayTarih" VisibleIndex="13" Width="5%"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataCheckColumn FieldName="UrunYonetimiOnay" VisibleIndex="14" Width="5%"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn FieldName="UrunYonetimiOnayTarih" VisibleIndex="15" Width="5%"></dx:GridViewDataDateColumn>
                      <dx:GridViewDataCheckColumn FieldName="SAPSistemOnay" VisibleIndex="16" Width="5%"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn FieldName="SAPSistemOnayTarih" VisibleIndex="17" Width="5%"></dx:GridViewDataDateColumn>
                      <dx:GridViewDataCheckColumn FieldName="DepoOnay" VisibleIndex="18" Width="5%"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn FieldName="DepoOnayTarih" VisibleIndex="19" Width="5%"></dx:GridViewDataDateColumn>
                      <dx:GridViewDataCheckColumn FieldName="MuhasebeOnay" VisibleIndex="20" Width="5%"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn FieldName="MuhasebeOnayTarih" VisibleIndex="21" Width="5%"></dx:GridViewDataDateColumn>  
                    <dx:GridViewDataCheckColumn FieldName="Onay" VisibleIndex="22" Width="5%"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn FieldName="OnayTarih" VisibleIndex="23" Width="5%"></dx:GridViewDataDateColumn>
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

                        <dx:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="ID" CssClass="grid"
                            Width="100%" EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect">
                            
                              <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                           <Columns>
                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0" Width="5%"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="IadeID" ReadOnly="True" VisibleIndex="1" Width="5%"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="UrunKodu" VisibleIndex="2" Width="30%"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="UrunAciklamasi" VisibleIndex="3" Width="100%"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Fiyat" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="c" Width="10%"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Miktar" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="IMEI" VisibleIndex="6"></dx:GridViewDataTextColumn>
                               <dx:GridViewDataCheckColumn FieldName="Aktivasyon" VisibleIndex="7" Width="3%"></dx:GridViewDataCheckColumn>
                               <dx:GridViewDataCheckColumn FieldName="FF" VisibleIndex="8" Width="3%"></dx:GridViewDataCheckColumn>
                               <dx:GridViewDataCheckColumn FieldName="DigerPrim" VisibleIndex="9" Width="3%"></dx:GridViewDataCheckColumn>
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
