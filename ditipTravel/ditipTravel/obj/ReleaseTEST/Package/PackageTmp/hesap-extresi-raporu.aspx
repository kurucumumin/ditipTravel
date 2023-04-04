<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="hesap-extresi-raporu.aspx.cs" Inherits="PortCRMWeb.hesap_extresi_raporu" %>
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
                label.SetText("Toplam Borç: " + s.cp_UnitPriceSummary);                
                label2.SetText("Toplam Alacak: " + s.cp_UnitPriceSummary2);                
                label3.SetText("Bakiye: " + s.cp_UnitPriceSummary3);
                delete (s.cp_UnitPriceSummary);
                delete (s.cp_UnitPriceSummary2);
                delete (s.cp_UnitPriceSummary3);
            }
        }
        function OnEndCallback(s, e) {
            if (s.cp_UnitPriceSummary != null) {
                label.SetText("Toplam Borç: " + s.cp_UnitPriceSummary);
                label2.SetText("Toplam Alacak: " + s.cp_UnitPriceSummary2);
                label3.SetText("Bakiye: " + s.cp_UnitPriceSummary3);
                delete (s.cp_UnitPriceSummary);
                delete (s.cp_UnitPriceSummary2);
                delete (s.cp_UnitPriceSummary3);
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
                        <h1 class="m-0 text-dark">Hesap Ekstresi</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Hesap Ekstresi</li>
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

             <div class="row mb-2">

                <div class="col-sm-6">

                   <div class="col-3">
                        <span>Bayi Seçimi</span>
                    </div>
                    <div class="col-7">
                        <dx:ASPxComboBox ID="cmbBayi" CssClass="form-control" runat="server" ValueType="System.String" Width="100%"
                            OnSelectedIndexChanged="cmbBayi_SelectedIndexChanged" AutoPostBack="true">
                        </dx:ASPxComboBox>
                    </div>

                </div>

                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">
                            <dx:ASPxLabel ID="ASPxLabel1" Font-Bold="true" runat="server" Text="" ClientInstanceName="label3">
                            </dx:ASPxLabel>                           
                        </li>                        
                    </ol>
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">
                            <dx:ASPxLabel ID="ASPxLabel5" Font-Bold="true" runat="server" Text="" ClientInstanceName="label2">
                            </dx:ASPxLabel>                           
                        </li>                        
                    </ol>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">
                            <dx:ASPxLabel ID="ASPxLabel9" Font-Bold="true" runat="server" Text="" ClientInstanceName="label">
                            </dx:ASPxLabel>                           
                        </li>                        
                    </ol>
                </div>
            </div>
           

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView1" ClientInstanceName="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False"
                CssClass="grid" EnableRowsCache="false" OnDataBound="ASPxGridView1_DataBound" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">

              <%--  <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Width="50" Caption="NO">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TARIH" ReadOnly="True" VisibleIndex="0" Visible="true"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FISTUR" ReadOnly="True" VisibleIndex="1" Visible="true"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BORC" ReadOnly="True" VisibleIndex="2" Visible="true" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ALACAK" ReadOnly="True" VisibleIndex="3" AdaptivePriority="1" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BAKIYE" ReadOnly="True" VisibleIndex="4" Visible="true" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BA" VisibleIndex="5" Visible="true" AdaptivePriority="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BELGE" VisibleIndex="6" Visible="true" AdaptivePriority="1"></dx:GridViewDataTextColumn>
                    <%--<dx:GridViewDataTextColumn FieldName="ACIKLAMA" ReadOnly="True" VisibleIndex="7" AdaptivePriority="1"></dx:GridViewDataTextColumn>--%>
                </Columns>
                
                <%--<ClientSideEvents EndCallback="OnEndCallback" Init="OnInit" />--%>

              <%--  <SettingsSearchPanel AllowTextInputTimer="false" CustomEditorID="tbToolbarSearch" ShowApplyButton="True" ShowClearButton="True" Visible="true" />--%>

                <Settings ShowFooter="false" ShowHeaderFilterButton="true" />
                <SettingsPopup>
                    <HeaderFilter Height="200">
                        <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" MinHeight="300" />
                    </HeaderFilter>
                </SettingsPopup>

                <TotalSummary>
                    <dx:ASPxSummaryItem FieldName="BORC" SummaryType="Sum" />
                    <dx:ASPxSummaryItem FieldName="ALACAK" SummaryType="Sum" />
                     <dx:ASPxSummaryItem FieldName="BAKIYE" SummaryType="Sum" />
                </TotalSummary>

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
