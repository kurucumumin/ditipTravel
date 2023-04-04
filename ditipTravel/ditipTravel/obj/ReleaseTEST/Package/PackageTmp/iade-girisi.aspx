<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="iade-girisi.aspx.cs" Inherits="PortCRMWeb.iade_girisi" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style type="text/css">
        @media (max-width:599px) {

            .table-condensed * {
/*                font-family: 'Angsana New' !important;*/
                font-size: 10px !important;
            }
            .content {
                padding:5px !important;
            }
            .altToplam * {
                font-size: 11px !important;
            }
            .form-row * {
                font-size: 12px !important;
            }
             .grid * {
/*                font-family: 'Angsana New' !important;*/
                font-size: 11px !important;
            }
        }
    </style>

    <script type="text/javascript">

        function setButtonClicked() {
            document.getElementById('<%= HiddenField1.ClientID %>').value = 'true';
            Callback.PerformCallback();
            LoadingPanel.Show();
        }

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
                        <h1 class="m-0 text-dark">İade Girişi</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">İade Girişi</li>
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
                <asp:Button ID="btnVazgeç" runat="server" class="btn btn-outline-dark" Text="VAZGEÇ" OnClick="btnVazgeç_Click" />
                &nbsp &nbsp
                        <asp:Button ID="btnKaydet" runat="server" class="btn btn-success" Text="ONAYA GÖNDER" OnClick="btnKaydet_Click" />
            </div>

            <div class="form-row">
                <div class="col-7"></div>
                <div class="col"></div>

            </div>

            <br />

             <div class="form-row">
                <div class="col-3">
                    <span>Faturasız İade mi?</span>
                </div>
                <div class="col-7">
                    <dx:ASPxRadioButtonList ID="radioFatura" SelectedIndex="0" runat="server" RepeatColumns="3" RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="radioFatura_SelectedIndexChanged">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="Hayır" Value="0" />
                            <dx:ListEditItem Text="Evet" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Bayi Seçimi</span>
                     <br />
                    <span style="opacity: 0.3;">Zorunlu !</span>
                </div>
                <div class="col-7">
                    <dx:ASPxComboBox ID="cmbBayi" CssClass="form-control" runat="server" ValueType="System.String" Width="100%"
                        OnSelectedIndexChanged="cmbBayi_SelectedIndexChanged" AutoPostBack="true">
                    </dx:ASPxComboBox>
                </div>
            </div>

            <br />

             <div class="form-row" id="divFatura" runat="server">
                <div class="col-3">
                    <span>Fatura Numarası</span>
                     <br />
                    <span style="opacity: 0.3;">Zorunlu! (Örnek: PRT2020000001196)</span>
                </div>
                <div class="col-2">
                     <dx:ASPxMemo ID="txtFaturaNo" CssClass="form-control" runat="server" Width="100%">
                    </dx:ASPxMemo>
                </div>
            </div>

             <br />

             <div class="form-row">
                <div class="col-3">
                    <span>Sipariş Numarası</span>
                     <br />
                    <span style="opacity: 0.3;">Zorunlu! (Örnek: PSON1542)</span>
                </div>
                  <div class="col-2">
                     <dx:ASPxMemo ID="txtSiparisNo" CssClass="form-control" runat="server" Width="100%">
                    </dx:ASPxMemo>
                </div>
                  <div class="col-2" style="margin: auto; margin-left: 0;">
                    <dx:ASPxButton ID="btnKontrol" runat="server" Text="Kontrol" OnClick="btnKontrol_Click"></dx:ASPxButton>
                </div>
            </div>

             <br />

            <div class="form-row">
                <div class="col-3">
                    <span>İade Açıklaması</span>
                    <br />
                    <span style="opacity: 0.3;">Zorunlu! (Örnek: IMEI uyuşmazlığı.)</span>
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


               <%-- <div style="width: 100%; overflow: scroll; background-color: white">--%>

                    <asp:GridView ID="grid" Width="100%" runat="server" DataKeyNames="UrunKodu" CssClass="table-condensed" BorderColor="#d4d4d4" BorderStyle="Solid"
                        BorderWidth="1px" ShowFooter="True" AutoGenerateColumns="False" OnDataBinding="grid_DataBinding">
                        <HeaderStyle BackColor="#d3d3d3" ForeColor="Black" BorderColor="#d4d4d4" BorderStyle="None" BorderWidth="1px" />
                        <Columns>

                            <asp:TemplateField HeaderText="#" FooterStyle-Width="3%" ItemStyle-Width="3%">
                                <ItemTemplate>
                                    <asp:Button Height="45px" ID="btnItemSatirSil" CssClass="form-control danger" runat="server" Text="Sil" OnClick="btnItemSatirSil_Click" />
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Button Height="45px" ID="btnFooterUrunSec" CssClass="form-control primary" runat="server" Text="Seç" OnClick="btnFooterUrunSec_Click"
                                        OnClientClick="setButtonClicked();" />
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Ürün Kodu" FooterStyle-Width="17%" ItemStyle-Width="17%"><%--0--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemUrunKodu" CssClass="form-control" runat="server" Width="100%" ReadOnly="true" Text='<%# Eval("UrunKodu")%>'></dx:ASPxTextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterUrunKodu" CssClass="form-control" runat="server" Width="100%" ReadOnly="true"></dx:ASPxTextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Ürün Açıklaması" FooterStyle-Width="28%" ItemStyle-Width="28%"><%--1--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemUrunAciklama" CssClass="form-control" runat="server" Width="100%" ReadOnly="true" Text='<%# Eval("UrunAciklama")%>'></dx:ASPxTextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterUrunAciklama" CssClass="form-control" runat="server" Width="100%" ReadOnly="true"></dx:ASPxTextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                              <asp:TemplateField HeaderText="IMEI" FooterStyle-Width="15%" ItemStyle-Width="15%"><%--2--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemIMEI" CssClass="form-control" runat="server" Width="100%" ReadOnly="true" Text='<%# Eval("IMEI")%>'></dx:ASPxTextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterIMEI" CssClass="form-control" runat="server" Width="100%" ReadOnly="true"></dx:ASPxTextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Miktar" FooterStyle-Width="17%" ItemStyle-Width="17%"><%--2--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemMiktar" CssClass="form-control" runat="server" Width="100%" Text='<%# Eval("Miktar")%>'
                                        AutoPostBack="true" MaskSettings-AllowMouseWheel="false" OnTextChanged="txtItemMiktar_TextChanged">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..999999>" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterMiktar" CssClass="form-control" runat="server" Width="100%" MaskSettings-AllowMouseWheel="false">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..999999>" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Fiyat" FooterStyle-Width="20%" ItemStyle-Width="20%"><%--4--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemFiyat" CssClass="form-control" runat="server" Width="100%" ReadOnly="true" Text='<%# Eval("Tutar")%>'>
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..99999g>.<00..99>₺" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterFiyat" CssClass="form-control" runat="server" Width="100%" ReadOnly="true">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..99999g>.<00..99>₺" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
               <%-- </div>--%>

            </asp:Panel>
            <dx:ASPxPopupControl ID="PopupControlItem" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modalItem" HeaderText="Ürün Seçimi" CloseOnEscape="true"
                CloseAction="CloseButton">
                <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="10">
                    <Paddings Padding="20px" PaddingTop="10px" />
                </ContentStyle>
                <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MaxWidth="1000px" />
                <ContentCollection>
                    <dx:PopupControlContentControl>

                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="grid" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False">
                            
                           <%-- <SettingsAdaptivity AdaptivityMode="HideDataCells" />--%>

                            <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                            <SettingsPager PageSize="6" />
                            <Settings ShowHeaderFilterButton="True" />
                            <SettingsSearchPanel Visible="True" />

                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="True" Width="2%" />
                                <dx:GridViewDataTextColumn FieldName="Kod" Caption="Ürün Kodu" Width="8%" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Aciklama" Caption="Ürün Adı" Width="10%" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="IMEI" Caption="IMEI" Width="20%" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Tutar" Caption="Tutar" PropertiesTextEdit-DisplayFormatString="c" VisibleIndex="3" Width="10%" >
                                </dx:GridViewDataTextColumn>
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

             <dx:ASPxPopupControl ID="PopupControlImei" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modalItem" HeaderText="Ürün Seçimi" CloseOnEscape="true"
                CloseAction="CloseButton" ShowFooter="false">
                <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="10">
                    <Paddings Padding="20px" PaddingTop="10px" />
                </ContentStyle>
                <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MaxWidth="850px"  />

                <ContentCollection>
                    <dx:PopupControlContentControl>

                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False">

                            <SettingsAdaptivity AdaptivityMode="HideDataCells" />
                            <SettingsPager PageSize="6" />
                            <Settings ShowHeaderFilterButton="True" />
                            <SettingsSearchPanel Visible="True" />

                            <%--<Settings ShowFilterBar="Visible" />--%>
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="True" Width="10%" />
                                 <dx:GridViewDataTextColumn FieldName="IMEI" Caption="IMEI" Width="100%" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <Styles>
                                <Cell Wrap="False" />
                            </Styles>
                            <SettingsBehavior AllowFocusedRow="true" />
                        </dx:ASPxGridView>
                        <br />
                        <div>
                            <dx:ASPxTextBox ID="txtSayac" runat="server" Width="170px" Visible="false"></dx:ASPxTextBox>
                            <dx:ASPxButton ID="btnImeiEkle" runat="server" Text="IMEI Ekle" OnClick="btnImeiEkle_Click"></dx:ASPxButton>
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

