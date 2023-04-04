<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="vade-farki-detaylari.aspx.cs" Inherits="PortCRMWeb.vade_farki_detaylari" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header)    deneme -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Vade Farkı Detayları</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Vade Farkı Detayları</li>
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
                                    <dx:ASPxDateEdit ID="deStart" Width="150px" runat="server" PickerType="Months"></dx:ASPxDateEdit>
                                </td>
                                <td>
                                    <dx:ASPxButton ID="btnGetir" runat="server" Width="50px" Text="Getir" OnClick="btnGetir_Click"></dx:ASPxButton>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

            </div>

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="grid" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableRowsCache="false" 
                DataSourceID="LinqServerModeDataSource1" KeyFieldName="ID">

                <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="PortExcel" />
                <SettingsSearchPanel Visible="true" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" Width="10%" VisibleIndex="1" Visible="false">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="VadeFarklariID" Width="10%" VisibleIndex="2" Visible="false">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Donem" Caption="Dönem" VisibleIndex="1" Visible="false">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd HH:mm:ss.fff" EditFormat="DateTime">  
                         </PropertiesDateEdit>  
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Aciklama" Caption="Açıklama" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CariHesapKodu" Caption="Cari Kodu" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CariHesapAdi" Caption="Cari Adı" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ModulAdi" Caption="Modül Adı" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="HareketTuru" Caption="Hareket Türü" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="IslemTarih" Caption="İşlem Tarihi" VisibleIndex="8">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Date">  
                         </PropertiesDateEdit>  
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="VadeTarih" Caption="Vade Tarihi" VisibleIndex="9">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Date">  
                         </PropertiesDateEdit>  
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="FisNo" Caption="Fatura No" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Toplam" Caption="Toplam" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="c">
                    </dx:GridViewDataTextColumn>
                     <dx:GridViewDataDateColumn FieldName="KarsiHareketTarih" Caption="K. Hareket Tarihi" VisibleIndex="12">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Date">  
                         </PropertiesDateEdit>  
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="KarsiVadeTarih" Caption="K. Vade Tarihi" VisibleIndex="13">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Date">  
                         </PropertiesDateEdit>  
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="KarsiHareketTuru" Caption="K. Hareket Türü" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KarsiHareketFisNo" Caption="K. Hareket Fatura No" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="VadeGun" Caption="Vade Gün" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Durum" Caption="Durum" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TicariIslemAciklamasi" Caption="İşlem Açıklaması" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KarsiTigAciklamasi" Caption="K. TIG Açıklaması" VisibleIndex="19">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="VadeFarkiGun" Caption="Vade Farkı Günü" VisibleIndex="20">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="VadeFarkiKDVDahil" Caption="Vade Farkı KDV Dahil" VisibleIndex="21">
                    </dx:GridViewDataTextColumn>
                  
                  
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

                <SettingsPager Position="Top" PageSize="50">
                    <PageSizeItemSettings Items="50, 100, 250, 500" />
                </SettingsPager>

                <SettingsExport EnableClientSideExportAPI="true" />

                <Styles Header-HorizontalAlign="Center">
                    <Cell Wrap="False" HorizontalAlign="Center" />
                </Styles>
                <SettingsBehavior AllowEllipsisInText="true" />
            </dx:ASPxGridView>

             <dx:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="PortB2B.vtDataContext" TableName="viewVadeFarklariSatirlaris" OnSelecting="LinqServerModeDataSource1_Selecting" />

            
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


