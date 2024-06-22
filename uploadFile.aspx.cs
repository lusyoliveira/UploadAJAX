using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Threading;

namespace UploadAJAX
{
    public partial class uploadFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AREA_UPLOAD"] != null)
                {
                    Session.Remove("AREA_UPLOAD");
                }
            }
        }

        //Upload do arquivo para uma variável de sessão, para ser utilizada dentro de outras páginas
        protected void btnCarregar_Click(object sender, EventArgs e)
        {
            string script = "";
            if (fuArq.FileBytes.Length > 0)
            {

                if (Session["AREA_UPLOAD"] != null)
                {
                    Session.Remove("AREA_UPLOAD");
                    Session.Remove("FILE_NAME");
                }
                Session.Add("AREA_UPLOAD", fuArq.FileBytes);
                Session.Add("FILE_NAME", fuArq.FileName);
                lblInfo.Text = "Arquivo carregado: " + fuArq.FileName;
                script += "SinalizaUpload();";
                Thread.Sleep(10000);
            }
            else
            {
                if (Session["AREA_UPLOAD"] != null)
                {
                    Session.Remove("AREA_UPLOAD");
                }
                script += "SinalizaUpload();";
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "sinalizar", script, true);
        }
    }
}
