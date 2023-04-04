<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="siparis-girisi-parcali.aspx.cs" Inherits="PortCRMWeb.siparis_girisi_parcali" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
        function UserDeleteConfirmation() {
            return confirm("Are you sure you want to delete this row?");
        }
        function OnKeyPressMiktar(e) {
            var code = (e.keyCode ? e.keyCode : e.which);
            if (code == 13) { //Enter keycode
                //alert("Enter Key Pressed");
                Callback.PerformCallback();
                LoadingPanel.Show();
            }
        }
      </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="HiddenField1" runat="server" Value="false" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Sipariş Girişi Parçalı</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Sipariş Girişi Parçalı</li>
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
                    <asp:Label ID="lblBorc" runat="server" ForeColor="Black" Font-Size="Large" Font-Bold="true" Text="" Visible="false" Style="padding-right: 20px;"></asp:Label>
                    <asp:Label ID="lblFaturasizBoc" runat="server" ForeColor="orange" Font-Size="Large" Font-Bold="true" Text="" Visible="false" Style="padding-right: 20px;"></asp:Label>
                    <asp:Label ID="lblKullanilabilirLimit" runat="server" ForeColor="red" Font-Size="Large" Font-Bold="true" Text="" Visible="false"></asp:Label>
                </div>

                <div class="col-sm-3" style="display: flex; justify-content: flex-end">
                    <asp:Button ID="btnVazgeç" runat="server" class="btn btn-outline-dark" Text="VAZGEÇ" OnClick="btnVazgeç_Click" />
                    &nbsp &nbsp
                    <dx:ASPxButton ID="btnKaydet" runat="server" Text="ONAYA GÖNDER" CssClass="btn btn-success" OnClick="btnKaydet_Click" AutoPostBack="true">
                        <ClientSideEvents Click="function(s, e) {
                        Callback.PerformCallback();
                        LoadingPanel.Show();
                    }" />
                    </dx:ASPxButton>
                    <%--<asp:Button ID="btnKaydet" runat="server" class="btn btn-success" Text="ONAYA GÖNDER" OnClick="btnKaydet_Click" />--%>
                </div>
            </div>

            <div class="form-row">
                <div class="col-7"></div>
                <div class="col"></div>

            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Ödeme Şekli</span>
                </div>
                <div class="col-7">
                    <dx:ASPxRadioButtonList ID="radioButtonList" SelectedIndex="0" runat="server" RepeatColumns="3" RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="radioButtonList_SelectedIndexChanged">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="Vadeli" Value="0" />
                            <dx:ListEditItem Text="Kredi Kartı" Value="1" />
                            <dx:ListEditItem Text="Nakit" Value="2" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Teslim Şekli</span>
                </div>
                <div class="col-7">
                    <dx:ASPxRadioButtonList ID="radioButtonList2" SelectedIndex="0" runat="server" RepeatColumns="2" RepeatLayout="Flow" AutoPostBack="true">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="Yurtiçi Kargo" Value="0" />
                            <dx:ListEditItem Text="Elden Teslimat" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Bayi Seçimi</span>
                </div>
                <div class="col-7">
                    <dx:ASPxComboBox ID="cmbBayi" CssClass="form-control" runat="server" ValueType="System.String" Width="100%"
                        OnSelectedIndexChanged="cmbBayi_SelectedIndexChanged" AutoPostBack="true">
                    </dx:ASPxComboBox>
                    <%--<input type="text" class="form-control" placeholder="Ödeme Şekli">--%>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Teslimat Adresi</span>
                </div>
                <div class="col-7">
                    <dx:ASPxComboBox ID="cmbAdres" CssClass="form-control" runat="server" ValueType="System.String" Width="100%"></dx:ASPxComboBox>
                    <%--<input type="text" class="form-control" placeholder="Ödeme Şekli">--%>
                </div>
            </div>

            <br />

            <%--<div class="form-row">
                <div class="col-3">
                    <span>Kargo Şekli</span>
                </div>
                <div class="col-7">
                    <input type="text" class="form-control" placeholder="Kargo Şekli">
                </div>
            </div>--%>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Sipariş Açıklaması</span>
                    <br />
                    <span style="opacity: 0.3;">Zorunlu Değildir !</span>
                </div>
                <div class="col-7">
                    <dx:ASPxMemo ID="txtAciklama" CssClass="form-control" runat="server" Height="100px" Width="100%">
                    </dx:ASPxMemo>
                </div>
            </div>

            <div class="form-row">
                <div class="col">
                    <hr />
                </div>
            </div>

            <asp:Button ID="Button1" runat="server" Text="Button" Style="display: none;" />

            <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1">


                <div style="width: 100%; overflow: scroll; background-color: white">

                    <asp:GridView ID="grid" runat="server" DataKeyNames="UrunKodu" CssClass="table-condensed" BorderColor="#d4d4d4" BorderStyle="Solid"
                        BorderWidth="1px" ShowFooter="True" AutoGenerateColumns="False" OnDataBinding="grid_DataBinding">
                        <HeaderStyle BackColor="#d3d3d3" ForeColor="Black" BorderColor="#d4d4d4" BorderStyle="None" BorderWidth="1px" />
                        <Columns>

                            <asp:TemplateField HeaderText="#" FooterStyle-Width="10%" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:Button Height="45px" ID="btnItemSatirSil" CssClass="form-control danger" runat="server" Text="Satır Sil" OnClick="btnItemSatirSil_Click" />
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxButton Height="45px" Width="100%" ID="btnFooterUrunSec" runat="server" Text="Ürün Seç" CssClass="form-control primary" OnClick="btnFooterUrunSec_Click" AutoPostBack="true">
                                        
                                    </dx:ASPxButton>
                                    <%--<asp:Button Height="45px" ID="btnFooterUrunSec" CssClass="form-control primary" runat="server" Text="Ürün Seç" OnClick="btnFooterUrunSec_Click" />--%>
                                    <%--<asp:Button Height="45px" ID="Button2" CssClass="form-control primary" runat="server" Text="Ürün Seç" OnClick="btnFooterUrunSec_Click"
                                        OnClientClick="setButtonClicked();" />--%>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Ürün Kodu" FooterStyle-Width="20%" ItemStyle-Width="20%"><%--0--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemUrunKodu" CssClass="form-control" runat="server" Width="100%" ReadOnly="true" Text='<%# Eval("UrunKodu")%>'></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtItemNo" OnTextChanged="txtItemNo_TextChanged" Text='<%# Eval("No")%>' runat="server"></asp:TextBox>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterUrunKodu" CssClass="form-control" runat="server" Width="100%" ReadOnly="true"></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ReadOnly="true" ID="txtFooterNo" OnTextChanged="txtFooterNo_TextChanged" runat="server"></asp:TextBox>--%>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Ürün Açıklaması" FooterStyle-Width="40%" ItemStyle-Width="40%"><%--1--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemUrunAciklama" CssClass="form-control" runat="server" Width="100%" ReadOnly="true" Text='<%# Eval("UrunAciklama")%>'></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtItemHS" Text='<%# Eval("HS") %>' runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterUrunAciklama" CssClass="form-control" runat="server" Width="100%" ReadOnly="true"></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtFooterHS" runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Miktar" FooterStyle-Width="10%" ItemStyle-Width="10%"><%--2--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemMiktar" CssClass="form-control" runat="server" Width="100%" Text='<%# Eval("Miktar")%>'
                                        OnTextChanged="txtItemMiktar_TextChanged" AutoPostBack="true" MaskSettings-AllowMouseWheel="false">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..999999>" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>

                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtItemLI" Text='<%# Eval("LI") %>' runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterMiktar" CssClass="form-control" runat="server" Width="100%" MaskSettings-AllowMouseWheel="false">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..999999>" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtFooterLI" runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Fiyat" FooterStyle-Width="20%" ItemStyle-Width="20%"><%--3--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemFiyat" CssClass="form-control" runat="server" Width="100%" Text='<%# Eval("Fiyat")%>'
                                        AutoPostBack="true" OnTextChanged="txtItemFiyat_TextChanged">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..99999g>.<00..99>₺" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtItemCL" Text='<%# Eval("CL") %>' runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterFiyat" CssClass="form-control" runat="server" Width="100%" ReadOnly="true">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..99999g>.<00..99>₺" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtFooterCL" runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Vade Grubu" FooterStyle-Width="40%" ItemStyle-Width="40%" Visible="false"><%--4--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemVadeGrubu" CssClass="form-control" runat="server" Width="100%" ReadOnly="true" Text='<%# Eval("vadeGrubu")%>'></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtItemHS" Text='<%# Eval("HS") %>' runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterVadeGrubu" CssClass="form-control" runat="server" Width="100%" ReadOnly="true"></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtFooterHS" runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </FooterTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Ticari Grubu" FooterStyle-Width="40%" ItemStyle-Width="40%" Visible="false"><%--4--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemTIG" CssClass="form-control" runat="server" Width="100%" ReadOnly="true" Text='<%# Eval("TIG")%>'></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtItemHS" Text='<%# Eval("HS") %>' runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterTIG" CssClass="form-control" runat="server" Width="100%" ReadOnly="true"></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtFooterHS" runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </FooterTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>

            </asp:Panel>

            <dx:ASPxPopupControl ID="PopupControlItem" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modalItem" HeaderText="Ürün Seçimi" CloseOnEscape="true"
                CloseAction="CloseButton" ShowFooter="false">
                <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="10">
                    <Paddings Padding="20px" PaddingTop="10px" />
                </ContentStyle>
                <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MaxWidth="950px" />
                <ContentCollection>
                    <dx:PopupControlContentControl>

                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False">

                            <SettingsAdaptivity AdaptivityMode="HideDataCells" />
                            <SettingsPager PageSize="6" />
                            <Settings ShowHeaderFilterButton="True" />
                            <SettingsSearchPanel Visible="True" />

                            <%--<Settings ShowFilterBar="Visible" />--%>
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="True" />
                                <dx:GridViewDataTextColumn FieldName="CODE" Caption="Ürün Kodu" Width="50" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NAME" Caption="Ürün Adı" Width="100" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FIYAT" Caption="Fiyat" PropertiesTextEdit-DisplayFormatString="c" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="STOK" Caption="Stok" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="VADE" Caption="Vade" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="TIG" Caption="TIG" VisibleIndex="6">
                                 </dx:GridViewDataTextColumn>
                                <%-- <dx:GridViewDataTextColumn FieldName="SATINALMA" Caption="POQ" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SATIS" Caption="SOQ" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>--%>
                            </Columns>
                            <Styles>
                                <Cell Wrap="False" />
                            </Styles>
                            <SettingsBehavior AllowFocusedRow="true" />
                        </dx:ASPxGridView>
                        <br />
                        <div>
                            <dx:ASPxButton ID="btnEkle" runat="server" Text="Ürün Ekle" OnClick="btnEkle_Click"></dx:ASPxButton>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <dx:ASPxPopupControl ID="PopupMessageBoxHata" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
                HeaderText="<span class='fa fa-exclamation-circle' aria-hidden='true' style='color:red;'></span> Mesaj Ekranı" CloseOnEscape="false"
                CloseAction="CloseButton" ShowFooter="false" EncodeHtml="false">
                <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
                    <Paddings Padding="0px" PaddingTop="12px" />
                </ContentStyle>
                <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <div class="alert alert-warning" runat="server" id="div3" role="alert" style="margin: 0 10px 10px 10px;">
                            <dx:ASPxLabel ID="lblMessageHata" Font-Bold="true" runat="server" Text=""></dx:ASPxLabel>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <%-- <dx:ASPxPopupControl ID="PopupMessageBoxHata" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
                HeaderText="Mesaj Ekranı" CloseOnEscape="false"
                CloseAction="CloseButton" ShowFooter="false">
                <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
                    <Paddings Padding="0px" PaddingTop="12px" />
                </ContentStyle>
                <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <div class="alert alert-default-warning" runat="server" id="div1" role="alert">
                            <strong>
                                <dx:ASPxLabel ID="lblMessageHata" runat="server" Text="Aşağıdaki ürünler daha önce eklenmiş! "></dx:ASPxLabel>
                            </strong>
                        </div>

                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>--%>

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


            <%--<div class="form-row" style="padding-top: 10px;">
                <div class="col">
                    <asp:Button ID="btnYeniSatir" class="btn btn-primary" runat="server" Text="Yeni Satır Ekle" OnClick="btnYeniSatir_Click" />
                </div>
            </div>--%>

            <div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-2">
                        <span>Toplam</span>
                    </div>
                    <div class="col-2" style="text-align: right; font-weight: bold">
                        <asp:Label ID="lblToplam" runat="server" Text="0,00₺"></asp:Label>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-4">
                        <hr />
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-2">
                        <span>Genel İskonto</span>
                    </div>
                    <div class="col-2" style="text-align: right; font-weight: bold">
                        <asp:Label ID="lblIskonto" runat="server" Text="0,00₺"></asp:Label>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-4">
                        <hr />
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-2">
                        <span>Ara Toplam</span>
                    </div>
                    <div class="col-2" style="text-align: right; font-weight: bold">
                        <asp:Label ID="lblAraToplam" runat="server" Text="0,00₺"></asp:Label>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-4">
                        <hr />
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-2">
                        <span>Toplam KDV</span>
                    </div>
                    <div class="col-2" style="text-align: right; font-weight: bold">
                        <asp:Label ID="lblKdvToplam" runat="server" Text="0,00₺"></asp:Label>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-4">
                        <hr />
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-2">
                        <span>Genel Toplam</span>
                    </div>
                    <div class="col-2" style="text-align: right; font-weight: bold">
                        <asp:Label ID="lblGenelToplam" runat="server" Text="0,00₺"></asp:Label>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-8">
                    </div>
                    <div class="col-4">
                        <hr />
                    </div>
                </div>

            </div>

        </div>

    </div>

    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ContainerElementID="Content2" ClientInstanceName="LoadingPanel" Text="İşleminiz yapılıyor. <br/>Lütfen bekleyin!..."
        Modal="True">
    </dx:ASPxLoadingPanel>


</asp:Content>

