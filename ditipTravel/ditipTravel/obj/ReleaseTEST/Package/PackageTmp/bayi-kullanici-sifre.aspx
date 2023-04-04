<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bayi-kullanici-sifre.aspx.cs" Inherits="PortCRMWeb.bayi_kullanici_sifre" %>

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
                        <h1 class="m-0 text-dark">B2B Giriş</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">B2B Giriş</li>
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
                CssClass="grid" EnableRowsCache="false">

               <%-- <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>--%>

                 <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="true" HighlightResults="false" />
                

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="KullaniciID" VisibleIndex="0" Width="5%" Visible="false">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>


                   <%--<dx:GridViewDataHyperLinkColumn PropertiesHyperLinkEdit-Target="_blank" FieldName="KullaniciAdi" VisibleIndex="1">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="https://b2b.portonline.com.tr?KullaniciID={0}"
                             TextField="KullaniciAdi" TextFormatString="{0}"/>
                    </dx:GridViewDataHyperLinkColumn>--%>

                     <dx:GridViewDataTextColumn FieldName="url" Caption="url" UnboundType="String" VisibleIndex="0" Width="5%">
                        <DataItemTemplate>
                          <a href="<%# GetFile(Eval("KullaniciID").ToString()) %>" target="_blank" style="margin-left:10% !important; margin-right:10% !important"><i class="fas fa-home"></i></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                     <dx:GridViewDataTextColumn FieldName="KullaniciAdi" Caption="KullaniciAdi"  VisibleIndex="1"></dx:GridViewDataTextColumn>

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
                            <%--<dx:GridViewToolbarItem Command="ExportToXls" Text="XLS'e Çevir" />--%>
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

            </dx:ASPxGridView>
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
    </div>
</asp:Content>


