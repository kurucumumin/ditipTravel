<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="temlikli-fiyat-yukleme.aspx.cs" Inherits="PortCRMWeb.temlikli_fiyat_yukleme" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function UserDeleteConfirmation() {
             return confirm("Are you sure you want to delete this row?");
         }
        var fileNumber = 0;
        var fileName = "";
        var startDate = null;
        function UploadControl_OnFileUploadStart(s, e) {
            var filePath = s.GetText();
            var fileNameIndex = filePath.lastIndexOf('\\') + 1;
            var filename = filePath.substr(fileNameIndex);
            var title = filename.substr(0, 3);

            startDate = new Date();
            ClearProgressInfo();
            pcProgress.Show();
        }
        function UploadControl_OnFilesUploadComplete(e) {
            pcProgress.Hide();
            if (e.errorText)
                lblMesaj.SetText(e.errorText);
            else if (e.callbackData != "") {
                lblFileUrl.SetText(e.callbackData);
                lblFileUrl.SetVisible(false);
                lblMesaj.SetText('File loaded successfuly. This process has been assigned as a task.');
            }
        }
        function ShowMessage(message) {
            window.setTimeout(function () { window.alert(message); }, 0);
        }
        // Progress Dialog
        function UploadControl_OnUploadingProgressChanged(args) {
            if (!pcProgress.IsVisible())
                return;
            if (args.currentFileName != fileName) {
                fileName = args.currentFileName;
                fileNumber++;
            }
            SetCurrentFileUploadingProgress(args.currentFileName, args.currentFileUploadedContentLength, args.currentFileContentLength);
            progress1.SetPosition(args.currentFileProgress);
            SetTotalUploadingProgress(fileNumber, args.fileCount, args.uploadedContentLength, args.totalContentLength);
            progress2.SetPosition(args.progress);
            UpdateProgressStatus(args.uploadedContentLength, args.totalContentLength);
        }
        function SetCurrentFileUploadingProgress(fileName, uploadedLength, fileLength) {
            lblFileName.SetText("Current File Progress: " + fileName);
            lblFileName.GetMainElement().title = fileName;
            lblCurrentUploadedFileLength.SetText(GetContentLengthString(uploadedLength) + " / " + GetContentLengthString(fileLength));
        }
        function SetTotalUploadingProgress(number, count, uploadedLength, totalLength) {
            lblUploadedFiles.SetText("Total Progress: " + number + ' of ' + count + " file(s)");
            lblUploadedFileLength.SetText(GetContentLengthString(uploadedLength) + " / " + GetContentLengthString(totalLength));
        }
        function ClearProgressInfo() {
            SetCurrentFileUploadingProgress("", 0, 0);
            progress1.SetPosition(0);
            SetTotalUploadingProgress(0, 0, 0, 0);
            progress2.SetPosition(0);
            lblProgressStatus.SetText('Elapsed time: 00:00:00 &ensp; Estimated time: 00:00:00 &ensp; Speed: ' + GetContentLengthString(0) + '/s');
            fileNumber = 0;
            fileName = "";
        }
        function UpdateProgressStatus(uploadedLength, totalLength) {
            var currentDate = new Date();
            var elapsedDateMilliseconds = currentDate - startDate;
            var speed = uploadedLength / (elapsedDateMilliseconds / 1000);
            var elapsedDate = new Date(elapsedDateMilliseconds);
            var elapsedTime = GetTimeString(elapsedDate);
            var estimatedMilliseconds = Math.floor((totalLength - uploadedLength) / speed) * 1000;
            var estimatedDate = new Date(estimatedMilliseconds);
            var estimatedTime = GetTimeString(estimatedDate);
            var speed = uploadedLength / (elapsedDateMilliseconds / 1000);
            lblProgressStatus.SetText('Elapsed time: ' + elapsedTime + ' &ensp; Estimated time: ' + estimatedTime + ' &ensp; Speed: ' + GetContentLengthString(speed) + '/s');
        }
        function GetContentLengthString(contentLength) {
            var sizeDimensions = ['bytes', 'KB', 'MB', 'GB', 'TB'];
            var index = 0;
            var length = contentLength;
            var postfix = sizeDimensions[index];
            while (length > 1024) {
                length = length / 1024;
                postfix = sizeDimensions[++index];
            }
            var numberRegExpPattern = /[-+]?[0-9]*(?:\.|\,)[0-9]{0,2}|[0-9]{0,2}/;
            var results = numberRegExpPattern.exec(length);
            length = results ? results[0] : Math.floor(length);
            return length.toString() + ' ' + postfix;
        }
        function GetTimeString(date) {
            var timeRegExpPattern = /\d{1,2}:\d{1,2}:\d{1,2}/;
            var results = timeRegExpPattern.exec(date.toUTCString());
            return results ? results[0] : "00:00:00";
        }
        var timeout;
        function scheduleGridUpdate(grid) {
            window.clearTimeout(timeout);
            timeout = window.setTimeout(
                function () { grid.Refresh(); },
                2000
            );
        }
        function grid_Init(s, e) {
            scheduleGridUpdate(s);
        }
        function grid_BeginCallback(s, e) {
            window.clearTimeout(timeout);
        }
        function grid_EndCallback(s, e) {
            scheduleGridUpdate(s);
        }
     </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <!-- Content Wrapper. Contains page content DENEME -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark">Temlikli Fiyat Listesi</h1>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="main.aspx">Anasayfa</a></li>
                                    <li class="breadcrumb-item active">Temlikli Fiyat Listesi</li>
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

                    <div class="form-row" id="dosyaDokumanPDF" runat="server">
                        <div class="col-3">
                            <span>Temlikli Fiyat Dosyası (.PDF)</span>
                        </div>
                        <div class="col-2">
                            <asp:Button ID="btnDokumanEklePDF" runat="server" class="btn btn-success" Text="Fiyat Dosyası Ekle" OnClick="btnDokumanEklePDF_Click" />
                        </div>
                    </div>

                     <br />

                     <div class="form-row" id="dosyaDokumanXLSX" runat="server">
                        <div class="col-3">
                            <span>Temlikli Fiyat Dosyası (.XLSX)</span>
                        </div>
                        <div class="col-2">
                            <asp:Button ID="btnDokumanEkleXLSX" runat="server" class="btn btn-success" Text="Fiyat Dosyası Ekle" OnClick="btnDokumanEkleXLSX_Click" />
                        </div>
                    </div>

                    <br />

                     <div class="form-row" id="dosyaDokuman" runat="server">
                        <div class="col-5">
                            <strong>
                                <dx:ASPxLabel ID="lblDokuman" ForeColor="black" runat="server" Text=""></dx:ASPxLabel>
                            </strong>
                        </div>
                    </div>

                    <dx:ASPxPopupControl ID="PopupMessageBoxDokuman" runat="server" AllowDragging="True" ShowOnPageLoad="false" ClientInstanceName="modal"
                        HeaderText="Döküman Ekleme" ShowFooter="false">
                        <ContentStyle Paddings-Padding="0" Paddings-PaddingTop="12">
                            <Paddings Padding="0px" PaddingTop="12px" />
                        </ContentStyle>
                        <SettingsAdaptivity Mode="Always" VerticalAlign="WindowCenter" MinWidth="300px" />
                        <ContentCollection>
                            <dx:PopupControlContentControl>
                                <div runat="server">
                                    <dx:ASPxUploadControl ID="UploadControlDokuman" runat="server" ClientInstanceName="UploadControl"
                                        Paddings-PaddingTop="30" UploadMode="Auto" Paddings-PaddingBottom="30" Width="300px" Height="50"
                                        NullText="Click here to browse files..." AutoStartUpload="True"
                                        OnFilesUploadComplete="UploadControlDokuman_FilesUploadComplete">
                                        <AdvancedModeSettings EnableMultiSelect="false" EnableDragAndDrop="true" />
                                        <ValidationSettings MaxFileSize="10000000000" AllowedFileExtensions=".pdf,.xlsx" ShowErrors="false"></ValidationSettings>
                                        <ClientSideEvents FilesUploadStart="function(s, e) { UploadControl_OnFileUploadStart(s, e); }"
                                            FilesUploadComplete="function(s, e) { UploadControl_OnFilesUploadComplete(e); }"
                                            UploadingProgressChanged="function(s, e) { UploadControl_OnUploadingProgressChanged(e); }" />
                                        <Paddings PaddingBottom="30px" PaddingTop="30px" />
                                    </dx:ASPxUploadControl>

                                    <dx:ASPxPopupControl ID="ASPxPopupControl4" runat="server" ClientInstanceName="pcProgress" Modal="True" HeaderText="Uploading"
                                        PopupAnimationType="None" CloseAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="460px"
                                        AllowDragging="true" ShowPageScrollbarWhenModal="True" ShowCloseButton="False" ShowFooter="True">
                                        <SettingsAdaptivity Mode="Always" MaxWidth="460px" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" />
                                        <ContentCollection>
                                            <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server" SupportsDisabledAttribute="True">
                                                <div style="overflow: hidden; width: 280px; float: left;">
                                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" ClientInstanceName="lblFileName" Text="" Wrap="False" />
                                                </div>
                                                <div style="float: right">
                                                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" ClientInstanceName="lblCurrentUploadedFileLength"
                                                        Text="" Wrap="False" />
                                                </div>
                                                <div class="Spacer" style="height: 6px;"></div>
                                                <dx:ASPxProgressBar ID="ASPxProgressBar7" runat="server" Height="21px" Width="100%" ClientInstanceName="progress1" />
                                                <div class="Spacer" style="height: 12px;"></div>
                                                <dx:ASPxLabel ID="ASPxLabel13" runat="server" ClientInstanceName="lblUploadedFiles" Text="" Wrap="False" />
                                                <div style="float: right">
                                                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" ClientInstanceName="lblUploadedFileLength"
                                                        Text="" Wrap="False" />
                                                </div>
                                                <div class="Spacer" style="height: 6px;"></div>
                                                <dx:ASPxProgressBar ID="ASPxProgressBar8" runat="server" CssClass="BottomMargin" Height="21px" Width="100%"
                                                    ClientInstanceName="progress2" />
                                                <div class="Spacer" style="height: 12px;"></div>
                                                <dx:ASPxLabel ID="ASPxLabel15" runat="server" ClientInstanceName="lblProgressStatus" Text="" Wrap="True" />
                                            </dx:PopupControlContentControl>
                                        </ContentCollection>
                                        <FooterTemplate>
                                            <div style="overflow: hidden;">
                                                <dx:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" Text="Cancel" ClientInstanceName="btnCancel" Width="100px" Style="float: right">
                                                    <ClientSideEvents Click="function(s, e) { UploadControl.Cancel(); }" />
                                                </dx:ASPxButton>
                                            </div>
                                        </FooterTemplate>
                                        <FooterStyle>
                                            <Paddings Padding="5px" PaddingRight="10px" />
                                        </FooterStyle>
                                    </dx:ASPxPopupControl>

                                    <dx:ASPxCallback ID="ASPxCallback4" runat="server" ClientInstanceName="Callback">
                                        <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
                                    </dx:ASPxCallback>

                                    <dx:ASPxLoadingPanel ID="ASPxLoadingPanel3" runat="server" ClientInstanceName="LoadingPanel" Text="Checking TXT File..."
                                        Modal="True">
                                    </dx:ASPxLoadingPanel>
                                </div>
                                <div>
                                    <asp:Button ID="btnTamamlandı" runat="server" class="btn btn-success" Text="TAMAMLANDI" OnClick="btnTamamlandı_Click" />
                                </div>

                            </dx:PopupControlContentControl>
                        </ContentCollection>
                    </dx:ASPxPopupControl>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
