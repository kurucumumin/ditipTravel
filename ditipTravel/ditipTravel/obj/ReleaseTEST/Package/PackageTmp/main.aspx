<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="PortCRMWeb.main" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dxisControl .dxis-itemTextArea {
            top: 17px;
            left: 17px;
            bottom: auto;
            width: 285px;
            padding: 15px 16px 21px;
            color: #fff;
            border-radius: 5px;
            box-shadow: 0px 4px 0px rgba(50, 50, 50, 0.3);
            background-color: #333333;
            background-color: rgba(0, 0, 0, 0.75);
        }

            .dxisControl .dxis-itemTextArea a {
                color: white;
            }

                .dxisControl .dxis-itemTextArea a:hover, a:focus {
                    text-decoration: underline;
                }

            .dxisControl .dxis-itemTextArea p {
                color: #b0b0b0;
            }

            .dxisControl .dxis-itemTextArea > p {
                margin-bottom: 0 !important;
            }

        .dxisControl .dxis-nbDotsBottom {
            padding: 0;
            margin-top: -25px;
        }




        @media (max-width:599px) {

            .card {
                font-size: 13px !important;
            }

            .hide {
                display: none !important;
            }

            .siparis {
                font-size: 12px !important;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Özet Rapor</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Özet Rapor</li>
                        </ol>
                    </div>
                    <div class="col-sm-6" id="teminatDokuman" runat="server" visible="false" style="margin: auto; position: relative;">
                        <%--<h4 class="card-title" style="font-weight: bold; color: red; text-align: center; float: none;">TEMİNAT MEKTUBUNUZUN SÜRESİ DOLMAK ÜZEREDİR !</h4>--%>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-sm-5" style="display: flex; justify-content: flex-start">
                        <span>Bayi Seçimi</span>
                        &nbsp &nbsp
                    <dx:ASPxComboBox ID="cmbBayi" CssClass="form-control" runat="server" ValueType="System.String" Width="100%"
                        OnSelectedIndexChanged="cmbBayi_SelectedIndexChanged" AutoPostBack="true">
                    </dx:ASPxComboBox>
                    </div>
                </div>

                <br />

                <div class="row">
                    <div class="col-lg-6">

                        <div class="card">
                            <div class="card-body table-responsive p-0">

                                <div class="card-header border-transparent">
                                    <h3 class="card-title" style="font-weight: bold;">FİNANS ÖZET</h3>
                                </div>

                                <table class="table table-striped table-valign-middle">
                                    <tbody>

                                        <tr runat="server" id="Toplamborc">
                                            <td>TOPLAM BORÇ BAKİYESİ</td>
                                            <td style="font-weight: bold; color: orange; float: right;">
                                                <asp:Label ID="lblToplamBorc" runat="server" Text="₺0,00"></asp:Label></td>
                                        </tr>

                                        <tr runat="server" id="FaturalanmamisSiparis">
                                            <td>FATURALANMAMIŞ SİPARİŞ TUTARI</td>
                                            <td style="font-weight: bold; color: orange; float: right;">
                                                <asp:Label ID="lblFaturalanmamisSiparis" runat="server" Text="₺0,00"></asp:Label></td>
                                        </tr>

                                        <tr runat="server" id="VadesiGecmisBorc">
                                            <td>VADESİ GEÇMİŞ BORÇ BAKİYESİ</td>
                                            <td style="font-weight: bold; color: red; float: right;">
                                                <asp:Label ID="lblVadesiGecmisBorc" runat="server" Text="₺0,00"></asp:Label></td>
                                        </tr>

                                        <tr runat="server" id="ToplamOnOdeme">
                                            <td>TOPLAM ÖN ÖDEMELİ İŞLEM BAKİYESİ</td>
                                            <td style="font-weight: bold; color: orange; float: right;">
                                                <asp:Label ID="lblToplamOnOdeme" runat="server" Text="₺0,00"></asp:Label></td>
                                        </tr>

                                        <tr runat="server" id="TeminatMektubu">
                                            <td>TEMİNAT MEKTUBU</td>
                                            <td style="font-weight: bold; float: right;">
                                                <asp:Label ID="lblTeminatTutar" runat="server" Text="₺0,00"></asp:Label></td>
                                        </tr>

                                        <tr runat="server" id="PortKredi">
                                            <td>PORT A.Ş. KREDİ LİMİTİNİZ</td>
                                            <td style="font-weight: bold; float: right;">
                                                <asp:Label ID="lblPortKredi" runat="server" Text="₺0,00"></asp:Label></td>
                                        </tr>


                                        <tr runat="server" id="ToplamKredi">
                                            <td>TOPLAM KREDİ LİMİTİNİZ</td>
                                            <td style="font-weight: bold; float: right;">
                                                <asp:Label ID="lblToplamKrediLimiti" runat="server" Text="₺0,00"></asp:Label></td>
                                        </tr>

                                        <tr runat="server" id="ToplamKullanilabilir">
                                            <td>KULLANILABİLİR LİMİT</td>
                                            <td style="font-weight: bold; color: lightseagreen; float: right;">
                                                <asp:Label ID="lblKullanilabilirLimit" runat="server" Text="₺0,00"></asp:Label></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-6">

                        <!-- TABLE: LATEST ORDERS -->
                        <div class="card">
                            <div class="card-header border-transparent">
                                <h3 class="card-title" style="font-weight: bold;">HESAP EXTRESİ</h3>

                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table m-0">
                                        <thead>
                                            <tr>
                                                <th>Tarih</th>
                                                <th>Fistür</th>
                                                <th>Borç</th>
                                                <th>Alacak</th>
                                                <th>Bakiye</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <asp:Repeater ID="RepHesap" runat="server">
                                                <ItemTemplate>

                                                    <tr>
                                                        <td style="font-weight: bold;"><%#Eval("TARIH")%></td>
                                                        <td style="font-weight: bold;"><%#Eval("FISTUR")%></td>
                                                        <td style="font-weight: bold; color: red;"><%#Eval("BORC", "{0:c}")%></td>
                                                        <td style="font-weight: bold; color: lightgreen;"><%#Eval("ALACAK", "{0:c}")%></td>
                                                        <td style="font-weight: bold; color: deepskyblue;"><%#Eval("BAKIYE", "{0:c}")%></td>
                                                    </tr>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                                <asp:Button ID="btnTumHesap" runat="server" Text="Tüm Hesap Extresi" class="btn btn-sm btn-secondary float-right" OnClick="btnTumHesap_Click" />
                            </div>
                            <!-- /.card-footer -->
                        </div>
                        <!-- /.card -->

                    </div>
                    <div class="col-lg-6">

                        <!-- TABLE: LATEST ORDERS -->
                        <div class="card siparis">

                            <div class="card-header border-transparent">
                                <h3 class="card-title" style="font-weight: bold;">SON SİPARİŞLER</h3>

                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table m-0">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Tutarı</th>
                                                <th>Durumu</th>
                                                <th>Tarihi</th>
                                                <th>Faturalanma Durumu</th>
                                                <th>Kargo Takip Numarası</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <asp:Repeater ID="RepSip" runat="server">
                                                <ItemTemplate>

                                                    <tr>
                                                        <td style="font-weight: bold;"><a href="siparis-detay.aspx?Uid=<%#Eval("ID")%>">PON<%#Eval("ID")%></a></td>
                                                        <td style="font-weight: bold; color: lightgreen;"><%#Eval("Tutar", "{0:c}")%></td>
                                                        <td style="font-weight: bold;">
                                                            <div class="sparkbar" data-color="#00a65a" data-height="20"><%#Eval("OlusturmaTarih")%></div>
                                                        </td>
                                                        <td style="font-weight: bold; color: forestgreen;"><%#Eval("SiparisDurum")%></span></td>
                                                        <td style="font-weight: bold; color: forestgreen;"><%#Eval("FaturalanmaDurumu")%></td>
                                                        <td style="font-weight: bold; color: deepskyblue;">
                                                            <a target="_blank" href="https://www.yurticikargo.com/tr/online-servisler/gonderi-sorgula?code=<%#Eval("KargoTakipNo")%>"><%#Eval("KargoTakipNo")%> </a>
                                                        </td>
                                                    </tr>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                                <asp:Button ID="btnYeniSiparis" runat="server" Text="Yeni Sipariş +" class="btn btn-sm btn-info float-left" OnClick="btnYeniSiparis_Click" />
                                <asp:Button ID="btnTumSiparisler" runat="server" Text="Tüm Siparişler" class="btn btn-sm btn-secondary float-right" OnClick="btnTumSiparisler_Click" />
                            </div>
                            <!-- /.card-footer -->

                        </div>
                        <!-- /.card -->

                    </div>
                    <div class="col-lg-6">

                        <!-- TABLE: LATEST ORDERS -->
                        <div class="card">
                            <div class="card-header border-transparent">
                                <h3 class="card-title" style="font-weight: bold;">VADESİ GEÇMİŞ FATURALAR</h3>

                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table m-0">
                                        <thead>
                                            <tr>
                                                <th>Fatura No</th>
                                                <th>Fatura Tarihi</th>
                                                <th>Vade Tarihi</th>
                                                <th>Tutar</th>
                                                <th>Gecikme Gün</th>
                                                <th>Ticari İşlem Açıklaması</th>
                                                <th>Hareket Türü</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <asp:Repeater ID="RepVGA" runat="server">
                                                <ItemTemplate>

                                                    <tr>
                                                        <td style="font-weight: bold; color: deepskyblue;"><%#Eval("FIS_NO")%></span></td>
                                                        <td style="font-weight: bold;">
                                                            <div class="sparkbar" data-color="#00a65a" data-height="20"><%#Eval("ISLEM_TARIHI")%></div>
                                                        </td>
                                                        <td style="font-weight: bold;">
                                                            <div class="sparkbar" data-color="#00a65a" data-height="20"><%#Eval("VADE_TARIHI")%></div>
                                                        </td>
                                                        <td style="font-weight: bold; color: lightgreen;"><%#Eval("TOPLAM", "{0:c}")%></td>
                                                        <td style="font-weight: bold; color: red;"><%#Eval("GECIKME_GUN")%></span></td>
                                                        <td style="font-weight: bold; color: forestgreen;"><%#Eval("TICARI_ISLEM_ACIKLAMASI")%></span></td>
                                                        <td style="font-weight: bold; color: forestgreen;"><%#Eval("HAREKET_TURU")%></td>
                                                    </tr>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.card-body -->
                            <%-- <div class="card-footer clearfix">
                                <asp:Button ID="Button1" runat="server" Text="Yeni Sipariş +" class="btn btn-sm btn-info float-left" OnClick="btnYeniSiparis_Click" />
                                <asp:Button ID="Button2" runat="server" Text="Tüm Siparişler" class="btn btn-sm btn-secondary float-right" OnClick="btnTumSiparisler_Click" />
                            </div>--%>
                            <!-- /.card-footer -->
                        </div>
                        <!-- /.card -->

                    </div>
                    <!-- /.col-md-6 -->
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content -->
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

</asp:Content>
