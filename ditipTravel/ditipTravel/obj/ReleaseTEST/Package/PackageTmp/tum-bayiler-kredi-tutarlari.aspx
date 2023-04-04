<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tum-bayiler-kredi-tutarlari.aspx.cs" Inherits="PortCRMWeb.tum_bayiler_kredi_tutarlari" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript">
        function OnEndCallback(s, e) {
            popup.Show();
            var keyValue = gv.cpKeyValue;
            popup.PerformCallback(keyValue);
        }
       </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Kredi Tutar Raporu</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Kredi Tutar Raporu</li>
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

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="grid1" runat="server" Width="100%" CssClass="grid" Theme="Material" AutoGenerateColumns="False"
                 EnableRowsCache="false">
                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>

                <%--<SettingsDetail ExportMode="All" />--%>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="true" />

                <Columns> 
                    <dx:GridViewDataTextColumn FieldName="bayiKodu" Caption="Bayi Kodu" VisibleIndex="0" ReadOnly="True" Width="50">
                         <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiTanim" Caption="Bayi Adı" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ToplamBorcTutari" Caption="Toplam Borç" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FaturalanmisSiparisTutari" Caption="Faturalanmamış Sipariş Tutarı" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ToplamKrediLimit" Caption="Toplam Kredi Limit" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KullanilabilirLimit" Caption="Kullanılabilir Limit" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ToplamOnOdeme" Caption="Ön Ödeme Tutarı" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                </Columns>

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

                <SettingsPager Position="Top" PageSize="15">
                    <PageSizeItemSettings Items="15, 50, 100, 200" />
                </SettingsPager>

                <SettingsExport EnableClientSideExportAPI="true" />

                <Styles>
                    <Cell Wrap="False" />
                </Styles>
                <SettingsBehavior AllowEllipsisInText="true" />
            </dx:ASPxGridView>

       

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

        </div>
    </div>



</asp:Content>



