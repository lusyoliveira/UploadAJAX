<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Default.aspx.cs" Inherits="UploadAJAX._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exemplo de Upload com ASP.NET, jqModal e efeitos AJAX</title>
    <link rel="stylesheet" href="css/jqModal.css" />

    <script type="text/javascript" src="javascript/jquery-1.2.6.pack.js"></script>

    <script type="text/javascript" src="javascript/jqModal.js"></script>
    <style type="text/css">
        .invisivel
        {
            visibility:hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel runat="server" ID="Upd1">
            <ContentTemplate>
                <div>
                    <span>Página de Teste de Upload com Efeitos AJAX</span>
                    <input type="button" value="Chamar Janela Modal" onclick="$dvUplModal.jqmShow();return false;" />
                    <input type="button" id="btnSinalizaUpload" onclick="<%=btnSalvar.ClientID%>.click()" style="visibility: hidden;" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="dvUplModal" class="jqmWindow">
        <asp:UpdatePanel runat="server" ID="Upd2"><ContentTemplate>
            <span>Aqui iremos solicitar o arquivo</span>
            <iframe src="uploadFile.aspx" style="border: none 0px; overflow: hidden; height: 50px;
                width: 100%"></iframe>
            <input type="button" value="Fechar Janela" onclick="$dvUplModal.jqmHide(); return false;" />
            <asp:Button runat="server" ID="btnSalvar" Text="Salvar definitivamente" CssClass="invisivel" OnClick="btnSalvar_Click" />
            </ContentTemplate></asp:UpdatePanel>
        </div>

        <script type="text/javascript">
                //Inicializa o Modal
               var $dvUplModal = $('#dvUplModal').jqm({modal:true,toTop:true,trigger:false});               
        </script>

    </form>
</body>
</html>
