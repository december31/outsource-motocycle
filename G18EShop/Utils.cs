using System;
using System.Web.UI;

namespace G18EShop
{
    public class Utils
    {
        public static void DisplayAlert(ClientScriptManager clientScript, Type type, string message, string direction)
        {
            clientScript.RegisterStartupScript(
                type,
                Guid.NewGuid().ToString(),
                string.Format("alert('{0}');window.location.href = '{1}'",
                    message.Replace("'", @"\'").Replace("\n", "\\n").Replace("\r", "\\r"), direction),
                true);
        }
    }
}
