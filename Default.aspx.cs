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
using System.IO;

namespace UploadAJAX
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            string msg = "";
            if (Session["AREA_UPLOAD"] != null)
            {
                try
                {
                    string fPath = this.MapPath("/") + "\\UploadedFiles\\" + Session["FILE_NAME"].ToString();
                    FileStream fs = new FileStream(fPath, FileMode.CreateNew);
                    fs.Write((byte[])Session["AREA_UPLOAD"], 0, (Session["AREA_UPLOAD"] as byte[]).Length);
                    fs.Flush();
                    fs.Close();
                    fs.Dispose();
                    msg = "Upload concluído com sucesso :-)";
                    Session.Remove("AREA_UPLOAD");
                    Session.Remove("FILE_NAME");
                }
                catch(Exception ex)
               {
                    msg = "Erro no upload -> " + ex.Message.Replace("'","");
               }
            }
            string script = String.Format("alert('{0}');", msg);
            script += "$dvUplModal.jqmHide();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alerta",script , true);
        }
    }
}
