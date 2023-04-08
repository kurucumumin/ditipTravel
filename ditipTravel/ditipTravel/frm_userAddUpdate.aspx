<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frm_userAddUpdate.aspx.cs" Inherits="ditipTravel.frm_userAddUpdate" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 runat="server" id="pageName" class="m-0 text-dark">User Add</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="frm_AllTravel.aspx">Main Page</a></li>
                            <li runat="server" id="pageName2" class="breadcrumb-item active">User Add</li>
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
                <asp:Button ID="btnCancel" runat="server" class="btn btn-outline-dark" Text="CANCEL" OnClick="btnCancel_Click" />
                &nbsp &nbsp
                        <asp:Button ID="btnUpdate" runat="server" class="btn btn-success" Text="UPDATE" OnClick="btnUpdate_Click" />
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Name</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtName" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Surname</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtSurname" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Username</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                        <dx:ASPxTextBox ID="txtUsername" CssClass="form-control" runat="server" Width="70%"></dx:ASPxTextBox>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>Status</span>
                </div>
            <div class="col-7">
                <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
                    <dx:ASPxRadioButtonList ID="radioButtonList" SelectedIndex="0" runat="server" RepeatColumns="2" RepeatLayout="Flow">
                        <CaptionSettings Position="Top" />
                        <Items>
                            <dx:ListEditItem Text="Active" Value="0" />
                            <dx:ListEditItem Text="Passive" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </div>
            </div>
        </div>


        <br />

        <div runat="server" id="passDiv">

            <div class="form-row">
                <div class="col-3">
                    <span>New Password</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type password">
                        <dx:ASPxTextBox ID="txtNewPass" CssClass="form-control" runat="server" Width="70%" Password="true"></dx:ASPxTextBox>
                        <%--<input id="txtYeniSifre" runat="server" class="input100" type="password" name="YeniSifre" placeholder="Yeni Şifre" />--%>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <br />

            <div class="form-row">
                <div class="col-3">
                    <span>New Password Again</span>
                </div>
                <div class="col-7">
                    <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type password">
                        <dx:ASPxTextBox ID="txtNewPassAgain" CssClass="form-control" runat="server" Width="70%" Password="true"></dx:ASPxTextBox>
                        <%--<input id="txtYeniSifreTekrar" runat="server" class="input100" type="password" name="YeniSifreTekrar" placeholder="Yeni Şifre Tekrar" />--%>
                        <span class="focus-input100"></span>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col">
                    <hr />
                    <%--<p> <strong>Not: </strong> Şifre en az 6 karakterden oluşmalıdır. Rakam ve harf içermelidir. Güvenliğiniz için şifrenizi kimse ile paylaşmayınınz! </p>--%>
                    <p><strong>Note: </strong>Password must be at least 6 characters. It must contain numbers and letters. For your safety, do not share your password with anyone! </p>

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
                            <dx:ASPxLabel ID="lblMessageHata" ForeColor="White" runat="server" Text="Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!. Kayıt esnasında problem ile karşılaşıldı!."></dx:ASPxLabel>
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
