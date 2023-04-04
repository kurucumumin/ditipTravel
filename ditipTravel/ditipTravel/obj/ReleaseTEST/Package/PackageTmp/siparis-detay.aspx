<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="siparis-detay.aspx.cs" Inherits="PortCRMWeb.siparis_detay" %>
<%@ Register Assembly="DevExpress.Web.v18.2" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Sipariş Detayı <asp:Label ID="lblSiparisNo2" runat="server" Text="PSON"></asp:Label></h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item"><a href="tum-siparisler.aspx">Tüm Siparişler</a></li>
                            <li class="breadcrumb-item active">Sipariş Detayı <asp:Label ID="lblSiparisNo" runat="server" Text="PSON"></asp:Label></li>
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

            <dx:ASPxGridView Paddings-PaddingBottom="100" ID="ASPxGridView2" CssClass="grid" ClientInstanceName="grid2" runat="server" Theme="Material" Width="100%"
                AutoGenerateColumns="False" DataSourceID="LinqDataSource2">

                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="UrunKodu" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UrunAciklamasi" ReadOnly="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Miktar" ReadOnly="True" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Fiyati" ReadOnly="True" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Tutar" ReadOnly="True" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="c"></dx:GridViewDataTextColumn>
                </Columns>

                <SettingsPager Position="Top" PageSize="50">
                    <PageSizeItemSettings Items="5, 10, 25, 50" />
                </SettingsPager>

                <SettingsExport EnableClientSideExportAPI="true" />

                <Styles>
                    <Cell Wrap="False" />
                </Styles>

            </dx:ASPxGridView>

            <asp:LinqDataSource runat="server" EntityTypeName="" ID="LinqDataSource2" ContextTypeName="PortCRMWeb.vtDataContext"
                Select="new (UrunKodu, UrunAciklamasi, UrunTipi, Miktar, Fiyati, KdvOrani, Kdv, Tutar, SiparisID, ID)" Where="SiparisID == @SiparisID" TableName="SiparisSatirs">
                <WhereParameters>
                    <asp:QueryStringParameter QueryStringField="Uid" Name="SiparisID" Type="Int32"></asp:QueryStringParameter>
                </WhereParameters>
            </asp:LinqDataSource>

        </div>
    </div>
</asp:Content>
