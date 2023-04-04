<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tum-bayiler.aspx.cs" Inherits="PortCRMWeb.tum_bayiler" %>

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
                        <h1 class="m-0 text-dark">Tüm Bayiler</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Tüm Bayiler</li>
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
                CssClass="grid" EnableRowsCache="false"
                OnFillContextMenuItems="ASPxGridView1_FillContextMenuItems" OnContextMenuItemClick="ASPxGridView1_ContextMenuItemClick">

              <%--  <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                 <SettingsSearchPanel Visible="true" />

                 <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />
                 <ClientSideEvents ContextMenuItemClick="OnContextMenuItemClick" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="BayiID" Caption="ID" VisibleIndex="0" ReadOnly="True" Width="60px">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiKodu" Caption="Kodu" VisibleIndex="1" Width="90px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiTanim" Caption="Ünvanı" VisibleIndex="2" Width="250px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiTuru" Caption="Türü" VisibleIndex="3" Width="60px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="CrmKullaniciID" VisibleIndex="4" Caption="OMT" SortIndex="0" SortOrder="Ascending" AdaptivePriority="1" ReadOnly="True" Width="80px">
                        <PropertiesComboBox DataSourceID="LinqDataSource1" ValueField="ID" TextField="Adi" ValueType="System.Int32" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="CrmSyKullaniciID" VisibleIndex="5" Caption="SY" SortIndex="0" SortOrder="Ascending" AdaptivePriority="1" ReadOnly="True" Width="80px">
                        <PropertiesComboBox DataSourceID="LinqDataSource1" ValueField="ID" TextField="Adi" ValueType="System.Int32" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="Il" Caption="İl" VisibleIndex="6" Width="100px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Ilce" Caption="İlçe" VisibleIndex="7" Width="110px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiSahibiAdi" Caption="İletişim" VisibleIndex="8" Width="145px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiSahibiTel" Caption="İletişim" VisibleIndex="9" Width="105px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="YetkiliAdi" Caption="İletişim 2" VisibleIndex="10" Width="145px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="YetkiliTel" Caption="İletişim 2" VisibleIndex="11" Width="105px"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BayiMail" Caption="Mail" VisibleIndex="12" Width="170px"></dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="Not" Caption="Not" VisibleIndex="13" Width="80px"></dx:GridViewDataTextColumn>
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

                <Styles Header-HorizontalAlign="Center">
                    <Cell Wrap="False" HorizontalAlign="Center"/>
                </Styles>
                 <SettingsBehavior AllowEllipsisInText="true" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="PortCRMWeb.vtDataContext" EntityTypeName="" OrderBy="ID desc" Select="new (ID, Adi)" TableName="CrmKullanicilars"></asp:LinqDataSource>
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