<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="popup-yonetim.aspx.cs" Inherits="PortCRMWeb.popup_yonetim" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function onFileUploadComplete(s, e) {
            if (e.callbackData) {
                var fileData = e.callbackData.split('|');
                var fileName = fileData[0],
                    fileUrl = fileData[1],
                    fileSize = fileData[2];
                //DXUploadedFilesContainer.AddFile(fileName, fileUrl, fileSize);
                img1.SetImageUrl('https://crm.portonline.com.tr/' + fileUrl);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <!-- Content Header (Page header)    deneme -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Popup Yönetimi</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                            <li class="breadcrumb-item active">Popup Yönetimi</li>
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

            <dx:ASPxCheckBox ID="chkAktif" runat="server" Text="Popup Aktif" OnCheckedChanged="chkAktif_CheckedChanged" AutoPostBack="true"></dx:ASPxCheckBox>
            <br />
            <dx:ASPxLabel ID="lblLink" runat="server" Text="Hedef Link (Yeni Pencere)"></dx:ASPxLabel>
            <dx:ASPxTextBox ID="txtLink" runat="server" Width="90%" ToolTip="Hedef Linki Yapıştırın"></dx:ASPxTextBox>
            <br />
            <dx:ASPxImage ID="imgMevcut" ClientInstanceName="img1" runat="server" ShowLoadingImage="true" Width="500" Height="227"></dx:ASPxImage>

            <br /> <br />
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Popup Fotoğraf Yükle"></dx:ASPxLabel>
            <div class="uploadContainer">
                <dx:ASPxUploadControl ID="UploadControl" runat="server" ClientInstanceName="UploadControl" Width="500px"
                    NullText="Select multiple files..." UploadMode="Advanced" ShowUploadButton="True" ShowProgressPanel="True"
                    OnFileUploadComplete="UploadControl_FileUploadComplete">
                    <AdvancedModeSettings EnableMultiSelect="True" EnableFileList="True" EnableDragAndDrop="True" />
                    <ValidationSettings MaxFileSize="4194304" AllowedFileExtensions=".jpg,.jpeg,.gif,.png">
                    </ValidationSettings>
                    <ClientSideEvents
                        FileUploadComplete="onFileUploadComplete" />
                </dx:ASPxUploadControl>
                <br />
                <br />
                <p class="note">
                    <dx:ASPxLabel ID="AllowedFileExtensionsLabel" runat="server" Text="Allowed file extensions: .jpg, .jpeg, .gif, .png." Font-Size="8pt">
                    </dx:ASPxLabel>
                    <br />
                    <dx:ASPxLabel ID="MaxFileSizeLabel" runat="server" Text="Maximum file size: 4 MB." Font-Size="8pt">
                    </dx:ASPxLabel>
                </p>
            </div>
            <%--<div class="filesContainer">
                <dx:ASPxUploadControl ID="FileContainer" runat="server" Width="100%" Height="180"
                    NameColumnWidth="240" SizeColumnWidth="70" HeaderText="Uploaded files" />
            </div>
            <div class="contentFooter">
                <p class="Note">
                    <b>Note</b>: All files uploaded to this demo will be automatically deleted in 5 minutes.
                </p>
            </div>--%>
        </div>
    </div>
</asp:Content>
