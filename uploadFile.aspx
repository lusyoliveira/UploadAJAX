<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadFile.aspx.cs" Inherits="UploadAJAX.uploadFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div id="dvUpload" style="width: 100%">
            <asp:FileUpload runat="server" ID="fuArq" CssClass="tbx-normal" Width="300px" />
            <asp:Button runat="server" ID="btnCarregar" Text="Carregar Arquivo" CssClass="botoes"
                OnClick="btnCarregar_Click" OnClientClick="Upload();" /><br />
            <asp:Label runat="server" ID="lblInfo" CssClass="fonte-peq"></asp:Label>
        </div>
        <div id="dvCarregar" style="display: none;">
            <img src="imagens/ajax-loader.gif" alt="Aguarde, carregando arquivo" />
        </div>

        <script type="text/javascript">
        function Upload()
        {
            $get("dvUpload").style.display = 'none';
            $get("dvCarregar").style.display = 'block';
        }
        
        function SinalizaUpload()
        {
            if(parent.document.getElementById("btnSinalizaUpload") != null)
            {
                parent.document.getElementById("btnSinalizaUpload").click();
            }
        }
        </script>
    </div>
    </form>
</body>
</html>
