<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dagilim-listesi.aspx.cs" Inherits="PortCRMWeb.dagilim_listesi" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        @media (max-width:599px) {

            .grid * {
                /*                font-family: 'Angsana New' !important;*/
                font-size: 11px !important;
            }

            .content {
                padding: 0px !important;
            }
        }
    </style>

    <script type="text/javascript">
        function OnContextMenuItemClick(sender, e) {
            if (e.item.name == "GUNCELLE") {
                e.processOnServer = true;
                e.usePostBack = true;
            }
            else if (e.item.name == "IPTAL") {
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
                        <h1 class="m-0 text-dark">Dağılım Listesi</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Dağılım Listesi</li>
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

                <div class="col-sm-8">

                    <table class="table" style="width: 600px;">
                        <thead>
                            <tr>
                                <th>Tarih</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <dx:ASPxDateEdit ID="deStart" Width="150px" runat="server"></dx:ASPxDateEdit>
                                </td>
                                <td>
                                    <dx:ASPxButton ID="btnGetir" runat="server" Width="50px" Text="Getir" OnClick="btnGetir_Click"></dx:ASPxButton>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

            </div>

             <dx:ASPxGridView ID="ASPxGridView1" CssClass="grid" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False"
                  OnFillContextMenuItems="ASPxGridView1_FillContextMenuItems" OnContextMenuItemClick="ASPxGridView1_ContextMenuItemClick"
                  OnDataBound="ASPxGridView1_DataBound" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />

                <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsPager Position="Top" PageSize="20">
                    <PageSizeItemSettings Items="50, 100, 250, 500" />
                </SettingsPager>
                <Settings ShowHeaderFilterButton="True" />
                <SettingsSearchPanel Visible="True" />

                <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" />
                <ClientSideEvents ContextMenuItemClick="OnContextMenuItemClick" />

                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" ShowClearFilterButton="true" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="3%" Caption="Seç" />
                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" ReadOnly="True" Width="5%">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OMT" Caption="OMY  &  SY" Width="10%" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UrunKodu" Caption="Ürün Kodu" VisibleIndex="2" Width="15%">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UrunAciklamasi" Caption="Ürün Açıklaması" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Limit" Caption="Limit" Width="5%" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SatilanSiparis" Caption="Satılan Sipariş" Width="10%" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OlusturmaTarih" Caption="Oluşturma Tarihi" VisibleIndex="6" Width="20%" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
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

                <Styles>
                    <Cell Wrap="False" />
                </Styles>
                <SettingsBehavior AllowFocusedRow="true" />

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

    <dx:ASPxPopupControl ID="PopupLimit" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
        HeaderText="<span class='fa fa-exclamation-circle' aria-hidden='true' style='color:red;'></span> Limit Değişim Ekranı" CloseOnEscape="false"
        CloseAction="CloseButton" ShowFooter="false" EncodeHtml="false">
        <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
            <Paddings Padding="0px" PaddingTop="12px" />
        </ContentStyle>
        <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div class="form-row" id="divLimit" runat="server">
                    <div class="col-3">
                        <span>Limit</span>
                    </div>
                    <div class="col-7">
                        <input id="txtLimit" runat="server" class="input100" type="number" name="Limit" />
                        <%--  <dx:ASPxMemo ID="txtLimit" CssClass="form-control" runat="server">
                    </dx:ASPxMemo>--%>
                    </div>
                </div>

                <br />

                <dx:ASPxTextBox ID="txtID" runat="server" Width="170px" Visible="false"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtStokLimit" runat="server" Width="170px" Visible="false"></dx:ASPxTextBox>

                <div style="display: flex; justify-content: flex-end">
                    <asp:Button ID="btnGuncelle" runat="server" class="btn btn-success" Text="GUNCELLE" OnClick="btnGuncelle_Click" />
                    &nbsp &nbsp
                <asp:Button ID="btnVazgeç" runat="server" class="btn btn-outline-dark" Text="VAZGEÇ" OnClick="btnVazgeç_Click" />
                </div>

            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


</asp:Content>

