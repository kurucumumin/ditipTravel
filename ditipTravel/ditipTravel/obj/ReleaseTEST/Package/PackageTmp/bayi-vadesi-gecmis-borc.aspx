<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bayi-vadesi-gecmis-borc.aspx.cs" Inherits="PortCRMWeb.bayi_vadesi_gecmis_borc" %>

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
                label.SetText("Toplam: " + s.cp_UnitPriceSummary);
                delete (s.cp_UnitPriceSummary);
            }
        }
        function OnEndCallback(s, e) {
            if (s.cp_UnitPriceSummary != null) {
                label.SetText("Toplam: " + s.cp_UnitPriceSummary);
                delete (s.cp_UnitPriceSummary);
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
                        <h1 class="m-0 text-dark">Açık Faturalarım</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Açık Faturalarım</li>
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

             <div class="form-row">
                    <div class="col-1">
                        <span>Bayi Seçimi</span>
                    </div>
                    <div class="col-5">
                        <dx:ASPxComboBox ID="cmbBayi" CssClass="form-control" runat="server" ValueType="System.String" Width="100%"
                            OnSelectedIndexChanged="cmbBayi_SelectedIndexChanged" AutoPostBack="true">
                        </dx:ASPxComboBox>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-7"></div>
                    <div class="col"></div>

                </div>

                <br />

            <div class="row mb-2">

                <div class="col-sm-4">

                    <dx:ASPxRadioButtonList ID="radioButtonList" SelectedIndex="0" runat="server" RepeatColumns="2" RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="radioButtonList_SelectedIndexChanged">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="Hepsi" Value="0" />
                            <dx:ListEditItem Text="Vadesi Geçmiş" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>

                </div>

                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-left">
                        <li class="breadcrumb-item active">
                            <asp:Label ID="lblGecmis" runat="server" ForeColor="Red" Font-Size="Large" Font-Bold="true" Text="Vadesi Geçmiş Faturalarım" Style="padding-right: 20px;"></asp:Label>
                            <asp:Label ID="lblGelecek" runat="server" ForeColor="orange" Font-Size="Large" Font-Bold="true" Text="Vadesi Gelecek Faturalarım" Style="padding-right: 20px;"></asp:Label>
                            <asp:Label ID="lblGelmemis" runat="server" ForeColor="Green" Font-Size="Large" Font-Bold="true" Text="Vadesi Gelmemiş Faturalarım" Style="padding-right: 20px;"></asp:Label>
                        </li>
                    </ol>
                </div>

                <div class="col-sm-2">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">
                            <dx:ASPxLabel ID="ASPxLabel9" Font-Bold="true" runat="server" Text="" ClientInstanceName="label">
                            </dx:ASPxLabel>
                        </li>
                    </ol>
                </div>
            </div>


            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView1" ClientInstanceName="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False" CssClass="grid"
                OnDataBound="ASPxGridView1_DataBound" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared">

                <%--<SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="false" />
                <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />

                <Columns>
                   <%-- <dx:GridViewDataTextColumn FieldName="CARI_HESAP_KOD" ReadOnly="True" VisibleIndex="0" Visible="true" Width="120"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CARI_HESAP_ADI" ReadOnly="True" VisibleIndex="1" Visible="true"></dx:GridViewDataTextColumn>--%>
                   <%-- <dx:GridViewDataTextColumn FieldName="MODUL_ADI" Caption="Modül Adı" ReadOnly="True" VisibleIndex="6" Visible="true" Width="200"></dx:GridViewDataTextColumn>--%>
                   <%-- <dx:GridViewDataTextColumn FieldName="BORC_ALACAK" Caption="Borç Alacak" ReadOnly="True" VisibleIndex="7" Visible="true" Width="200"></dx:GridViewDataTextColumn>--%>
                    <dx:GridViewDataTextColumn FieldName="HAREKET_TURU" Caption="Hareket Türü" ReadOnly="True" VisibleIndex="8" Visible="true" Width="200"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="ISLEM_TARIHI" Caption="Fatura Tarihi" ReadOnly="True" VisibleIndex="1" Visible="true" Width="300">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="DateTime"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="VADE_TARIHI" Caption="Vade Tarihi" ReadOnly="True" VisibleIndex="2" Visible="true" Width="300">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="DateTime"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="FIS_NO" Caption="Fatura No" ReadOnly="True" VisibleIndex="0" Visible="true" Width="200"></dx:GridViewDataTextColumn>
                     <%--<dx:GridViewDataHyperLinkColumn PropertiesHyperLinkEdit-Target="_blank" FieldName="DOSYA_ADI" VisibleIndex="0" Caption="Fatura No" Width="200">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="http://b2b.portonline.com.tr/{0}.pdf"
                            TextFormatString="{0}" TextField="FIS_NO" />
                    </dx:GridViewDataHyperLinkColumn>--%>
                    <dx:GridViewDataTextColumn FieldName="DOSYA_ADI" VisibleIndex="1" Visible="false"></dx:GridViewDataTextColumn>
                   <%-- <dx:GridViewDataTextColumn FieldName="FIS_NO" Caption="Fatura No" UnboundType="String" VisibleIndex="0" Width="200">
                        <DataItemTemplate>
                            <a href="<%# FaturaDetay(Eval("REF").ToString(),Eval("SIPNO").ToString(),Eval("FIS_NO").ToString()) %>" target="_blank" style="margin-left: 10% !important; margin-right: 10% !important"><%#Eval("FIS_NO").ToString() %></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>--%>
                    <dx:GridViewDataTextColumn FieldName="TOPLAM" Caption="Tutar" ReadOnly="True" VisibleIndex="3" Visible="true" PropertiesTextEdit-DisplayFormatString="c" CellStyle-HorizontalAlign="Left" Width="200"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GECIKME_GUN" Caption="Gecikme Gün" ReadOnly="True" VisibleIndex="4" Visible="true" CellStyle-HorizontalAlign="Left" Width="200"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TICARI_ISLEM_ACIKLAMASI" Caption="Ticari İşlem Açıklaması" ReadOnly="True" VisibleIndex="5" Visible="true" Width="200"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="REF" ReadOnly="True" VisibleIndex="11" Visible="false"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SIPNO" ReadOnly="True" VisibleIndex="12" Visible="false"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SIGN" ReadOnly="True" VisibleIndex="12" Visible="false"></dx:GridViewDataTextColumn>

                </Columns>

                <ClientSideEvents EndCallback="OnEndCallback" Init="OnInit" />

                <SettingsSearchPanel AllowTextInputTimer="false" CustomEditorID="tbToolbarSearch" ShowApplyButton="True" ShowClearButton="True" Visible="true" />


                <Settings ShowFooter="false" ShowHeaderFilterButton="true"  ShowFilterBar="Visible" />
                <SettingsPopup>
                    <HeaderFilter Height="200">
                        <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" MinHeight="300" />
                    </HeaderFilter>
                </SettingsPopup>

                <TotalSummary>
                    <dx:ASPxSummaryItem FieldName="TOPLAM" SummaryType="Sum" />
                </TotalSummary>

               <SettingsPager Position="Top" PageSize="100">
                    <PageSizeItemSettings Items="100, 200, 250, 500" />
                </SettingsPager>

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
                                            <%--<dx:ClearButton DisplayMode="Always" ImagePosition="Right" Image-IconID="find_find_16x16gray" />--%>
                                            <dx:SpinButtonExtended Position="Left" Image-IconID="find_find_16x16gray" />
                                        </Buttons>
                                    </dx:ASPxButtonEdit>
                                </Template>
                            </dx:GridViewToolbarItem>

                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>

                  <Templates>
                    <DetailRow>

                        <dx:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="Kod" CssClass="grid"
                            Width="100%" EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect">

                            <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Kod" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="IMEI" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Birim" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Fiyat" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="KdvOran" VisibleIndex="6"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Kdv" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="c">
                                    <CellStyle HorizontalAlign="Right">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowFooter="True" />
                            <SettingsPager EnableAdaptivity="true" />
                            <Styles Header-Wrap="True" />
                            <%--<TotalSummary>
                                <dx:ASPxSummaryItem FieldName="CompanyName" SummaryType="Count" />
                                <dx:ASPxSummaryItem FieldName="Total" SummaryType="Sum" />
                                <dx:ASPxSummaryItem FieldName="Quantity" SummaryType="Sum" />
                            </TotalSummary>--%>
                        </dx:ASPxGridView>
                    </DetailRow>
                </Templates>

                <SettingsDetail ShowDetailRow="true" />

                <SettingsExport EnableClientSideExportAPI="true" />

                <Styles>
                    <Cell Wrap="False" />
                </Styles>

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


