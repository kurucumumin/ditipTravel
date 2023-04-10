<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frm_allTravel.aspx.cs" Inherits="ditipTravel.frm_allTravel" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        @media (max-width:599px) {

            .grid * {
                /*                font-family: 'Angsana New' !important;*/
                font-size: 11px !important;
            }

            .content {
                padding: 0px !important;
            }

            .table {
                width: 80% !important;
            }

                .table * {
                    font-size: 12px !important;
                }
        }
    </style>

    <script type="text/javascript">
        function OnContextMenuItemClick(sender, e) {
            if (e.item.name == "DURUM") {
                e.processOnServer = true;
                e.usePostBack = true;
                LoadingPanel.Show();
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
                        <h1 class="m-0 text-dark">Tüm Seyahatler</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="frm_allTravel.aspx">Ana Sayfa</a></li>
                            <li class="breadcrumb-item active">Tüm Seyahatler</li>
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

            <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
                <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
            </dx:ASPxCallback>

            <div class="form-row">

                <div class="col-sm-9">
                </div>

                <div class="col-sm-3" style="display: flex; justify-content: flex-end">

                 <%--   <dx:ASPxButton ID="btnYeni" runat="server" CssClass="btn btn-info" Text="YENİ" >
                        <ClientSideEvents Click="function(s, e) {
                        LoadingPanel.Show();
                    }" />
                    </dx:ASPxButton>--%>
                </div>

            </div>

            &nbsp &nbsp

             

              <dx:ASPxGridView ID="ASPxGridView1" CssClass="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False">

                  <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="TravelExcel" />

                  <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                  <SettingsPager Position="Top" PageSize="20">
                      <PageSizeItemSettings Items="50, 100, 250, 500" />
                  </SettingsPager>
                  <Settings ShowHeaderFilterButton="True" />
                  <SettingsSearchPanel Visible="True" />
                   
                  <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />


                  <Columns>

                      <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="0" Visible="false"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="name" VisibleIndex="1" Caption="İsim"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="surname" VisibleIndex="2" Caption="Soyisim"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="gender" VisibleIndex="3" Caption="Cinsiyet"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataCheckColumn FieldName="student" VisibleIndex="2" Caption="Öğrenci mi?"></dx:GridViewDataCheckColumn>
                      <dx:GridViewDataDateColumn FieldName="birthDay" VisibleIndex="3" Caption="Doğum Tarihi"></dx:GridViewDataDateColumn>
                      <dx:GridViewDataTextColumn FieldName="airport" VisibleIndex="3" Caption="Havaalanı"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="nationality" VisibleIndex="3" Caption="Uyruk"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="passaportNo" VisibleIndex="3" Caption="Pasaport No"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataDateColumn FieldName="passaportDate" VisibleIndex="3" Caption="Pasaport Tarihi"></dx:GridViewDataDateColumn>
                      <dx:GridViewDataTextColumn FieldName="tcNo" VisibleIndex="3" Caption="TC No"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="mailAddress" VisibleIndex="3" Caption="Mail Adres"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="mobilePhone" VisibleIndex="3" Caption="Telefon"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="address" VisibleIndex="3" Caption="Adres"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="state" VisibleIndex="3" Caption="Eyalet"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="prepaymentAmount" VisibleIndex="3" Caption="Ön Ödeme Tutarı"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataDateColumn FieldName="prepaymentDate" VisibleIndex="3" Caption="Ön Ödeme Tarihi"></dx:GridViewDataDateColumn>
                      <dx:GridViewDataTextColumn FieldName="dueAmount" VisibleIndex="3" Caption="Son Ödeme Tutarı"></dx:GridViewDataTextColumn>
                      <dx:GridViewDataDateColumn FieldName="dueDate" VisibleIndex="3" Caption="Son Ödeme Tarihi"></dx:GridViewDataDateColumn>
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

                <%--  <Templates>
                      <DetailRow>

                          <dx:ASPxGridView ID="detailGrid" runat="server" KeyFieldName="ID" AutoGenerateColumns="False" CssClass="grid" Theme="Material"
                              Width="100%" EnablePagingGestures="False" >

                              <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                              <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />

                              <Columns>
                                  <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0" Visible="false"></dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="SureclerID" Caption="Konu" SortIndex="0" SortOrder="Ascending" AdaptivePriority="1" VisibleIndex="1">
                                      <PropertiesComboBox DataSourceID="LinqDataSource4" ValueField="ID" TextField="Konu" ValueType="System.Int32" />
                                  </dx:GridViewDataComboBoxColumn>
                                  <dx:GridViewDataComboBoxColumn FieldName="DurumID" Caption="Durum" SortIndex="0" SortOrder="Ascending" AdaptivePriority="1" VisibleIndex="2">
                                      <PropertiesComboBox DataSourceID="LinqDataSource3" ValueField="ID" TextField="DurumAdi" ValueType="System.Int32" />
                                  </dx:GridViewDataComboBoxColumn>
                                  <dx:GridViewDataTextColumn FieldName="Aciklama" Caption="Açıklama" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                 <dx:GridViewDataDateColumn FieldName="OlusturmaTarihi" Caption="İşlem Tarihi" VisibleIndex="4" ShowInCustomizationForm="True" Width="120"></dx:GridViewDataDateColumn>
                              </Columns>
                              <Settings ShowFooter="True" />
                              <SettingsPager EnableAdaptivity="true" Position="Top" PageSize="50">
                                  <PageSizeItemSettings Items="50, 100, 250, 500" />
                              </SettingsPager>
                              <Styles Header-Wrap="True" />
                          </dx:ASPxGridView>
                      </DetailRow>
                  </Templates>

                  <SettingsDetail ShowDetailRow="true" />--%>

                  <Styles>
                      <Cell Wrap="False" />
                  </Styles>
                  <SettingsBehavior AllowFocusedRow="true" />

              </dx:ASPxGridView>

           <%-- <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ALM.vtDataContext" EntityTypeName="" Select="new (ID,KullaniciAdi)" TableName="Kullanicilars"></asp:LinqDataSource>
            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="ALM.vtDataContext" EntityTypeName="" Select="new (ID,ProjeAdi)" TableName="Projelers"></asp:LinqDataSource>
            <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="ALM.vtDataContext" EntityTypeName="" Select="new (ID,DurumAdi)" TableName="Durumlars"></asp:LinqDataSource>
            <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="ALM.vtDataContext" EntityTypeName="" Select="new (ID,Konu)" TableName="Sureclers"></asp:LinqDataSource>--%>


        </div>
    </div>

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
                    <dx:ASPxLabel ID="lblMessageBilgi" Font-Bold="true" runat="server" Text=""></dx:ASPxLabel>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>



    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ContainerElementID="Content2" ClientInstanceName="LoadingPanel" Text="İşleminiz yapılıyor. <br/>Lütfen bekleyin!..."
        Modal="True">
    </dx:ASPxLoadingPanel>

</asp:Content>

