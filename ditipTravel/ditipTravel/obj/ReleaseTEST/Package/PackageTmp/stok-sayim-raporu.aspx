<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="stok-sayim-raporu.aspx.cs" Inherits="PortCRMWeb.stok_sayim_raporu" %>

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
        function UpdateInfo() {
            var daysTotal = deEnd.GetRangeDayCount();
            tbInfo.SetText(daysTotal !== -1 ? daysTotal+1 + ' gün' : '');
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
                        <h1 class="m-0 text-dark">Stok Sayım Raporu</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Stok Sayım Raporu</li>
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

            <dx:ASPxFormLayout ID="flDateRangePicker" runat="server" RequiredMarkDisplayMode="None" CssClass="indent" UseDefaultPaddings="false">
                <SettingsItemCaptions Location="Top"></SettingsItemCaptions>
                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
                <Items>
                    <dx:LayoutGroup ColCount="3" GroupBoxDecoration="none" UseDefaultPaddings="false">
                        <Items>
                            <dx:LayoutItem Caption="Başlangıç Tarihi">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxDateEdit ID="deStart" ClientInstanceName="deStart" runat="server">
                                            <ClientSideEvents DateChanged="UpdateInfo"></ClientSideEvents>
                                            <CalendarProperties>
                                                <FastNavProperties DisplayMode="Inline" />
                                            </CalendarProperties>
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" CausesValidation="True" ErrorDisplayMode="ImageWithTooltip">
                                                <RequiredField IsRequired="True" ErrorText="Başlangıç tarihi seçmelisiniz"></RequiredField>
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Bitiş Tarihi">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxDateEdit ID="deEnd" ClientInstanceName="deEnd" runat="server">
                                            <CalendarProperties>
                                                <FastNavProperties DisplayMode="Inline" />
                                            </CalendarProperties>
                                            <DateRangeSettings StartDateEditID="deStart"></DateRangeSettings>
                                            <ClientSideEvents DateChanged="UpdateInfo"></ClientSideEvents>
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" CausesValidation="True" ErrorDisplayMode="ImageWithTooltip">
                                                <RequiredField IsRequired="True" ErrorText="Bitişi tarihi seçmelisiniz"></RequiredField>
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Seçili Gün Sayısı">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="tbInfo" ClientInstanceName="tbInfo" runat="server" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False" ColSpan="3" Height="50" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxValidationSummary ID="ASPxValidationSummary1" runat="server" ClientInstanceName="validationSummary" ShowErrorsInEditors="True">
                                        </dx:ASPxValidationSummary>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False" Width="100%" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxButton ID="btnSubmit" runat="server" Text="Getir" OnClick="btnSubmit_Click">
                                           <ClientSideEvents Click="function(s, e) {LoadingPanel.Show();}" />
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="grid1" runat="server"  Width="100%" AutoGenerateColumns="False"
                CssClass="grid" Theme="Material" ClientInstanceName="grid" OnDataBinding="grid1_DataBinding">

              <%--  <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="false" />
                <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" Visible="false" Caption="ID"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Seri" VisibleIndex="1" Caption="Seri"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UrunKodu" VisibleIndex="2" Caption="Ürün Kodu"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UrunAdi" VisibleIndex="3" Caption="Ürün Adı"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="OkumaTarihi" VisibleIndex="4" Caption="Okuma Tarihi">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="DateTime"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiKodu" VisibleIndex="5" Caption="Bayi Kodu"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiAdi" VisibleIndex="6" Caption="Bayi Adı" Width="250"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SahaYetkilisi" VisibleIndex="7" Caption="Saha Yetkilisi"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="12" Caption="Açıklama"></dx:GridViewDataTextColumn>

                    <dx:GridViewDataDateColumn FieldName="FaturaTarihi" VisibleIndex="8" Caption="Fatura Tarihi">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="DateTime"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn FieldName="FaturaNo" VisibleIndex="9" Caption="Fatura No"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Fiyat" VisibleIndex="10" Caption="Fiyat" PropertiesTextEdit-DisplayFormatString="c" Width="250"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="StokYasi" VisibleIndex="11" Caption="Stok Yaşı"></dx:GridViewDataTextColumn>
                    
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
                                    <%--<dx:GridViewToolbarItem Command="ExportToXls" Text="XLS'e Çevir" />--%>
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

    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>

</asp:Content>
