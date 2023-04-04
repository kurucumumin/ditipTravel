<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="satin-alma-girisi.aspx.cs" Inherits="PortCRMWeb.satin_alma_girisi" %>

<%@ Register Assembly="DevExpress.Web.v18.2" Namespace="DevExpress.Web" TagPrefix="dx" %>

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

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Satın Alma Girişi</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Satın Alma Girişi</li>
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
                        <asp:Button ID="btnKaydet" runat="server" class="btn btn-success" Text="KAYDET" OnClick="btnKaydet_Click" />
            </div>

            <div class="form-row">
                <div class="col-7"></div>
                <div class="col">
                </div>

            </div>

            <div class="form-row">
                <div class="col">
                    <hr />
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Firma Seçimi</span>
                </div>
                <div class="col-7">
                    <dx:ASPxComboBox ID="cmbFirma" CssClass="form-control" runat="server" ValueType="System.String" Width="100%" AutoPostBack="true"></dx:ASPxComboBox>
                </div>
            </div>


            <div class="form-row" style="display: none;">
                <div class="col-3">
                    <span>Firma Seçimi</span>
                </div>
                <div class="col-7">
                    <dx:ASPxComboBox ID="ASPxComboBox1" CssClass="form-control" runat="server" ValueType="System.String" Width="100%" AutoPostBack="true"></dx:ASPxComboBox>
                </div>
            </div>

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
                                    <%--<dx:ASPxButton Height="45px" Width="100%" ID="btnFooterUrunSec" runat="server" Text="Seç" CssClass="form-control primary" OnClick="btnFooterUrunSec_Click" AutoPostBack="true"> 
                                    </dx:ASPxButton>--%>
                                    <asp:Button Height="45px" ID="btnFooterUrunSec" CssClass="form-control primary" runat="server" Text="Seç" OnClick="btnFooterUrunSec_Click" />
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

                            <asp:TemplateField HeaderText="Ürün Açıklaması" FooterStyle-Width="35%" ItemStyle-Width="35%"><%--1--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemUrunAciklama" CssClass="form-control" runat="server" Width="100%" ReadOnly="true" Text='<%# Eval("UrunAciklama")%>'></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtItemHS" Text='<%# Eval("HS") %>' runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterUrunAciklama" CssClass="form-control" runat="server" Width="100%" ReadOnly="true"></dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtFooterHS" runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Miktar" FooterStyle-Width="17%" ItemStyle-Width="17%"><%--2--%>
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

                            <asp:TemplateField HeaderText="Fiyat" FooterStyle-Width="25%" ItemStyle-Width="25%"><%--3--%>
                                <ItemTemplate>
                                    <dx:ASPxTextBox ID="txtItemFiyat" CssClass="form-control" runat="server" Width="100%" Text='<%# Eval("Fiyat")%>'
                                        AutoPostBack="true" OnTextChanged="txtItemFiyat_TextChanged1">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..99999g>.<00..9999>₺" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtItemCL" Text='<%# Eval("CL") %>' runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <dx:ASPxTextBox ID="txtFooterFiyat" CssClass="form-control" runat="server" Width="100%">
                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                        <MaskSettings Mask="<0..99999g>.<00..9999>₺" IncludeLiterals="DecimalSymbol" />
                                    </dx:ASPxTextBox>
                                    <%--<asp:TextBox BorderStyle="None" Width="30" ID="txtFooterCL" runat="server" ReadOnly="true"></asp:TextBox>--%>
                                </FooterTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                <%--</div>--%>

            </asp:Panel>
            <dx:ASPxPopupControl ID="PopupControlItem" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modalItem" HeaderText="Ürün Seçimi" CloseOnEscape="true"
                CloseAction="CloseButton" ShowFooter="false">
                <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="10">
                    <Paddings Padding="20px" PaddingTop="10px" />
                </ContentStyle>
                <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MaxWidth="850px" />
                <ContentCollection>
                    <dx:PopupControlContentControl>

                       <dx:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="grid" Theme="Material" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False">
                            
                           <%-- <SettingsAdaptivity AdaptivityMode="HideDataCells" />--%>

                            <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="800" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                            <SettingsPager PageSize="6" />
                            <Settings ShowHeaderFilterButton="True" />
                            <SettingsSearchPanel Visible="True" />

                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="True" />
                                <dx:GridViewDataTextColumn FieldName="CODE" Caption="Ürün Kodu" Width="50" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NAME" Caption="Ürün Adı" Width="100" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>                                                                
                                <dx:GridViewDataTextColumn FieldName="FIYAT" Caption="Fiyat" PropertiesTextEdit-DisplayFormatString="c" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ONHAND" Caption="Stok" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SATINALMA" Caption="POQ" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SATIS" Caption="SOQ" VisibleIndex="6">
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

            <dx:ASPxPopupControl ID="PopupMessageBoxHata" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
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


            <%--<div class="form-row" style="padding-top: 10px;">
                <div class="col">
                    <asp:Button ID="btnYeniSatir" class="btn btn-primary" runat="server" Text="Yeni Satır Ekle" OnClick="btnYeniSatir_Click" />
                </div>
            </div>--%>

            <div>
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
</asp:Content>
