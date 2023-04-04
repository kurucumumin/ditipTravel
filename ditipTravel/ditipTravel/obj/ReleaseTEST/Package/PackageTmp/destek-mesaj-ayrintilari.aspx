<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="destek-mesaj-ayrintilari.aspx.cs" Inherits="PortCRMWeb.destek_mesaj_ayrintilari" %>

<%@ Register Assembly="DevExpress.Web.v18.2" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .container {
            max-width: 1170px;
            margin: auto;
        }

        img {
            max-width: 100%;
        }

        .inbox_people {
            background: #f8f8f8 none repeat scroll 0 0;
            float: left;
            overflow: hidden;
            width: 40%;
            border-right: 1px solid #c4c4c4;
        }

        .inbox_msg {
            border: 1px solid #c4c4c4;
            clear: both;
            overflow: hidden;
        }

        .top_spac {
            margin: 20px 0 0;
        }


        .recent_heading {
            float: left;
            width: 40%;
        }

        .srch_bar {
            display: inline-block;
            text-align: right;
            width: 60%;
        }

        .headind_srch {
            padding: 10px 29px 10px 20px;
            overflow: hidden;
            border-bottom: 1px solid #c4c4c4;
        }

        .recent_heading h4 {
            color: #05728f;
            font-size: 21px;
            margin: auto;
        }

        .srch_bar input {
            border: 1px solid #cdcdcd;
            border-width: 0 0 1px 0;
            width: 80%;
            padding: 2px 0 4px 6px;
            background: none;
        }

        .srch_bar .input-group-addon button {
            background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
            border: medium none;
            padding: 0;
            color: #707070;
            font-size: 18px;
        }

        .srch_bar .input-group-addon {
            margin: 0 0 0 -27px;
        }

        .chat_ib h5 {
            font-size: 15px;
            color: #464646;
            margin: 0 0 8px 0;
        }

            .chat_ib h5 span {
                font-size: 13px;
                float: right;
            }

        .chat_ib p {
            font-size: 14px;
            color: #989898;
            margin: auto
        }

        .chat_img {
            float: left;
            width: 11%;
        }

        .chat_ib {
            float: left;
            padding: 0 0 0 15px;
            width: 88%;
        }

        .chat_people {
            overflow: hidden;
            clear: both;
        }

        .chat_list {
            border-bottom: 1px solid #c4c4c4;
            margin: 0;
            padding: 18px 16px 10px;
        }

        .inbox_chat {
            /*height: 550px;
            overflow-y: scroll;*/
        }

        .active_chat {
            background: #ebebeb;
        }

        .incoming_msg_img {
            display: inline-block;
            width: 6%;
        }

        .received_msg {
            display: inline-block;
            padding: 0 0 0 10px;
            vertical-align: top;
            width: 92%;
        }

        .received_withd_msg p {
            background: #ebebeb none repeat scroll 0 0;
            border-radius: 3px;
            color: #646464;
            font-size: 14px;
            margin: 0;
            padding: 5px 10px 5px 12px;
            width: 100%;
        }

        .time_date {
            color: #747474;
            display: block;
            font-size: 12px;
            margin: 8px 0 0;
        }

        .received_withd_msg {
            width: 57%;
        }

        .mesgs {
            float: left;
            padding: 30px 15px 0 25px;
            width: 100%;
        }

        .sent_msg p {
            background: #05728f none repeat scroll 0 0;
            border-radius: 3px;
            font-size: 14px;
            margin: 0;
            color: #fff;
            padding: 5px 10px 5px 12px;
            width: 100%;
        }

        .outgoing_msg {
            overflow: hidden;
            margin: 26px 0 26px;
        }

        .sent_msg {
            float: right;
            width: 46%;
        }

        .input_msg_write input {
            background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
            border: medium none;
            color: #4c4c4c;
            font-size: 15px;
            min-height: 48px;
            width: 100%;
        }

        .type_msg {
            border-top: 1px solid #c4c4c4;
            position: relative;
        }

        .msg_send_btn {
            background: #05728f none repeat scroll 0 0;
            border: medium none;
            border-radius: 50%;
            color: #fff;
            cursor: pointer;
            font-size: 17px;
            height: 33px;
            position: absolute;
            right: 0;
            top: 11px;
            width: 33px;
        }

        .messaging {
            padding: 0 0 50px 0;
        }

        .msg_history {
            /*height: 516px;
            overflow-y: auto;*/
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Content Wrapper. Contains page content DENEME -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Destek Mesajları</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item"><a href="destek-mesajlari.aspx?ID=1">Tüm Destek Kayıtları</a></li>
                            <li class="breadcrumb-item active">Destek Mesajları</li>
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



            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnGonder2">
                <div style="display: none">
                    <asp:Button ID="btnGonder2" runat="server" class="btn btn-danger" Text="TALEBİ KAPAT" OnClick="btnGonder2_Click" />
                </div>

                <div class="messaging">



                    <div class="inbox_msg">

                        <div style="display: flex; justify-content: flex-end; margin:10px 10px 0 0">
                            <asp:Button ID="btnKapat" runat="server" class="btn btn-danger bg-gradient-orange" Text="TALEBİ KAPAT" OnClick="btnKapat_Click" />
                        </div>

                        <div class="mesgs">
                            <div class="type_msg">
                                <div class="input_msg_write" style="border:0.5px solid #d8d7d7; padding:5px 0 5px 10px;">
                                    <input type="text" id="txtMesaj" runat="server" class="write_msg" placeholder="Mesajınızı Buraya Yazın" />
                                    <button style="margin:2px 8px 0 0" class="msg_send_btn" type="button" runat="server" id="btnGonder" onserverclick="btnGonder_ServerClick">
                                        <i class="fas fa-share" aria-hidden="true"></i>

                                    </button>
                                </div>
                                <hr style="margin-top:0; border:medium thin #4c4c4c;" />
                            </div>
                            <br />
                            <div class="msg_history">

                                <asp:Repeater ID="rptTalepler" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <div class="<%#Eval("CssStyleDosyası")%>">
                                                <div class="<%#Eval("CssStyleDosyası2")%>">
                                                    <p>
                                                        &nbsp <%#Eval("Mesaj")%>
                                                    </p>
                                                    <span class="time_date">&nbsp <%#Eval("MesajTarih")%></span>
                                                </div>
                                            </div>
                                        </tr>

                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>

                        </div>
                    </div>

                </div>


            </asp:Panel>

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

</asp:Content>

