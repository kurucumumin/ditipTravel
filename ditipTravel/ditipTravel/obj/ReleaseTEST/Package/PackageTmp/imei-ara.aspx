<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="imei-ara.aspx.cs" Inherits="PortCRMWeb.imei_ara" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style typeof="text/css">
        .form-control-borderless {
            border: none;
        }

            .form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
                border: none;
                outline: none;
                box-shadow: none;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>
            <asp:UpdateProgress ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                        <asp:Image Width="100px" ID="imgUpdateProgress" runat="server" ImageUrl="images/ajax_loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark">IMEI Sorgulama Ekranı</h1>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                                    <li class="breadcrumb-item active">IMEI Sorgulama Ekranı</li>
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

                    <br />
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                            <div class="card card-sm">
                                <div class="card-body row no-gutters align-items-center">
                                    <%--<div class="col-auto">
                                <i class="fas fa-search h4 text-body"></i>
                            </div>--%>
                                    <!--end of col-->
                                    <div class="col">
                                        <asp:TextBox ID="txtIMEI" runat="server" class="form-control form-control-lg form-control-borderless" type="search" placeholder="IMEI Bilgisini Girin"></asp:TextBox>
                                        <%--<input class="form-control form-control-lg form-control-borderless" type="search" placeholder="IMEI Bilgisini Girin">--%>
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto">
                                        <asp:Button ID="btnAra" class="btn btn-lg btn-success" runat="server" Text="SORGULA" OnClick="btnAra_Click" />
                                        <%--<button class="btn btn-lg btn-success" type="submit">SORGULA</button>--%>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </div>

                            <br />

                            <div class="card-body row no-gutters align-items-center">
                                <h1 style="text-align: center">
                                    <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label></h1>

                                <div class="card  col-12" runat="server" visible="false" id="info">

                                    <div class="card-body table-responsive p-0">
                                        <div class="card-header border-transparent">
                                            <h3 class="card-title" style="font-weight: bold;">IMEI BİLGİLERİ</h3>
                                        </div>

                                        <table class="table table-striped table-valign-middle">

                                            <tbody>


                                                <tr>
                                                    <td>IMEI</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblIMEI" runat="server" Text=""></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td>MODEL</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblModel" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>SİPARİŞ NUMARASI</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblSiparisNo" runat="server" Text=""></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td>FATURA NUMARASI</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblFaturaNo" runat="server" Text=""></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td>FATURA TARİHİ</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblFaturaTarihi" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>MALİYET(Liste Fiyatı)</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblMaliyet" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>MALİYET(İndirimli Fiyat)</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblMaliyetIndirimli" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>TEMLİK BİLGİSİ</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblTemlikBilgisi" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>AKTİVASYON TARİHİ</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblAktivasyonTarihi" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>PRİM HAKEDİŞİ</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblPrimHakedis" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>TEMLİK FİYAT FARKI</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblTemlikFiyatFarki" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>DİĞER FİYAT FARKI</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblDigerFiyatFarki" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>TERS KAYIT</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblTersKayit" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>POS KODU</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblPosKodu" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>BAYİ ADI</td>
                                                    <td style="font-weight: bold; color: red;">
                                                        <asp:Label ID="lblBayiAdi" runat="server" Text=''></asp:Label>
                                                    </td>
                                                </tr>

                                                


                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--end of col-->
                    </div>

                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
