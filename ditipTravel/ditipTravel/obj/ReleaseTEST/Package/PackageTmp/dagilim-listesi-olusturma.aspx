<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dagilim-listesi-olusturma.aspx.cs" Inherits="PortCRMWeb.dagilim_listesi_olusturma" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
                        <h1 class="m-0 text-dark">Dağılım Listesi Oluşturma</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Dağılım Listesi Oluşturma</li>
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

            <div class="form-row">
                <div class="col">
                    <hr />
                </div>
            </div>

            <div style="display: flex; justify-content: flex-end">
                <asp:Button ID="btnKaydet" runat="server" class="btn btn-success" Text="KAYDET" OnClick="btnKaydet_Click" />
                &nbsp &nbsp
                <asp:Button ID="btnVazgeç" runat="server" class="btn btn-outline-dark" Text="VAZGEÇ" OnClick="btnVazgeç_Click" />
            </div>

            <div class="form-row">
                <div class="col-7"></div>
                <div class="col">
                </div>

            </div>

            <br />

            <%-- <div class="form-row">
                <div class="col-3">
                    <span>Dağılım aktif olsun mu ?</span>
                </div>
                <div class="col-7">
                   <dx:ASPxRadioButtonList ID="radioDagilim" SelectedIndex="0" runat="server" RepeatColumns="2" RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="radioDagilim_SelectedIndexChanged">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="Hayır" Value="0" />
                            <dx:ListEditItem Text="Evet" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </div>
            </div>

            <br />--%>

            <%-- <div class="form-row" id="divOmt" runat="server">
                <div class="col-3">
                    <span>OMY & SY</span>
                </div>
                <div class="col-7">
                    <dx:ASPxComboBox ID="cmbOmt" CssClass="form-control" runat="server" ValueType="System.String" Width="100%"></dx:ASPxComboBox>
                </div>
            </div>

            <br />--%>

            <dx:ASPxTextBox ID="txtStokLimit" runat="server" Width="170px" Visible="false"></dx:ASPxTextBox>

            <br />

            <div class="form-row" id="divUrun" runat="server">
                <div class="col-3">
                    <span>Ürün</span>
                </div>
                <div class="col-7">
                    <dx:ASPxComboBox ID="cmbUrun" CssClass="form-control" runat="server" ValueType="System.String" Width="100%"
                        OnSelectedIndexChanged="cmbUrun_SelectedIndexChanged" AutoPostBack="true">
                    </dx:ASPxComboBox>
                </div>
            </div>

            <br />

            <div class="form-row" id="divLimit" runat="server">
                <div class="col-3">
                    <span>Elif</span>
                </div>
                <div class="col-7">
                    <input id="txtElifLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
            <br />

            <div class="form-row" id="div3" runat="server">
                <div class="col-3">
                    <span>Nur</span>
                </div>
                <div class="col-7">
                    <input id="txtNurLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
            <br />

            <div class="form-row" id="div4" runat="server">
                <div class="col-3">
                    <span>Kübra</span>
                </div>
                <div class="col-7">
                    <input id="txtKubraLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
            <br />

            <div class="form-row" id="div5" runat="server">
                <div class="col-3">
                    <span>Neslihan</span>
                </div>
                <div class="col-7">
                    <input id="txtNeslihanLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
            <br />

            <div class="form-row" id="div6" runat="server">
                <div class="col-3">
                    <span>Sena</span>
                </div>
                <div class="col-7">
                    <input id="txtSenaLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
            <br />

            <div class="form-row" id="div7" runat="server">
                <div class="col-3">
                    <span>İbrahim</span>
                </div>
                <div class="col-7">
                    <input id="txtIbrahimLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
            <br />

            <div class="form-row" id="div8" runat="server">
                <div class="col-3">
                    <span>Orhan</span>
                </div>
                <div class="col-7">
                    <input id="txtOrhanLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
            <br />

            <div class="form-row" id="div9" runat="server">
                <div class="col-3">
                    <span>Baran</span>
                </div>
                <div class="col-7">
                    <input id="txtBaranLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
            <br />

            <div class="form-row" id="div10" runat="server">
                <div class="col-3">
                    <span>Koray</span>
                </div>
                <div class="col-7">
                    <input id="txtKorayLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
            <br />

            <div class="form-row" id="div11" runat="server">
                <div class="col-3">
                    <span>Mehmet</span>
                </div>
                <div class="col-7">
                    <input id="txtMehmetLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
             <br />

            <div class="form-row" id="div12" runat="server">
                <div class="col-3">
                    <span>Tolga</span>
                </div>
                <div class="col-7">
                    <input id="txtTolgaLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
             <br />

            <div class="form-row" id="div13" runat="server">
                <div class="col-3">
                    <span>Hakan</span>
                </div>
                <div class="col-7">
                    <input id="txtHakanLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
             <br />

            <div class="form-row" id="div14" runat="server">
                <div class="col-3">
                    <span>Taylan</span>
                </div>
                <div class="col-7">
                    <input id="txtTaylanLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
            </div>
             <br />

            <div class="form-row" id="div15" runat="server">
                <div class="col-3">
                    <span>Ferhat</span>
                </div>
                <div class="col-7">
                    <input id="txtFerhatLimit" runat="server" class="input100" type="number" name="Limit" />
                </div>
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

        <dx:ASPxPopupControl ID="PopupMessageBoxBasarili" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
            HeaderText="Mesaj Ekranı" CloseOnEscape="false"
            CloseAction="CloseButton" ShowFooter="false">
            <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
                <Paddings Padding="0px" PaddingTop="12px" />
            </ContentStyle>
            <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div class="alert alert-success" runat="server" id="div2" role="alert">
                        <strong>
                            <dx:ASPxLabel ID="lblMessageBasarili" ForeColor="White" runat="server" Text="Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!."></dx:ASPxLabel>
                        </strong>
                    </div>

                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

    </div>

    </div>
</asp:Content>

