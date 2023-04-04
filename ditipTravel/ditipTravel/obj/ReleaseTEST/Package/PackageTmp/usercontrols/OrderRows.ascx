<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderRows.ascx.cs" Inherits="PortB2BWeb.usercontrols.OrderRows" %>

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />
<!-- IonIcons -->
<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css" />
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />

<div class="form-row">
    <div class="col-2">
        <dx:ASPxTextBox ID="txtUrunKodu" CssClass="form-control" NullText="Ürün Kodu" runat="server" Width="100%">
        </dx:ASPxTextBox>
    </div>
    <div class="col-5">
        <dx:ASPxTextBox ID="txtUrunAciklama" CssClass="form-control" NullText="Ürün Açıklaması" runat="server" Width="100%">
        </dx:ASPxTextBox>
    </div>
    <div class="col">
        <dx:ASPxTextBox ID="txtMiktar" CssClass="form-control" NullText="Miktar" Text="1" runat="server" Width="100%">
            <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
            <MaskSettings Mask="<0..99999>" IncludeLiterals="DecimalSymbol" />
        </dx:ASPxTextBox>
    </div>
    <div class="col">
        <dx:ASPxTextBox ID="txtFiyat" CssClass="form-control" NullText="Fiyat" Text="0" runat="server" Width="100%">
            <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
            <MaskSettings Mask="<0..99999g>.<00..99>₺" IncludeLiterals="DecimalSymbol" />
        </dx:ASPxTextBox>
    </div>
    <div class="col">
        <button type="submit" class="btn btn-danger mb-2"><i class="fas fa-trash-alt"></i>Sil</button>
    </div>
</div>
