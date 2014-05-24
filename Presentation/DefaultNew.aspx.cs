using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation
{
    public partial class DefaultNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

            //e.InputParameters["cityName"] = cityInput.Text;
            e.InputParameters["LatLow"] = -90.0;
            e.InputParameters["LatHigh"] = 90.0;
            e.InputParameters["LongLow"] = 0;
            e.InputParameters["LongHigh"] = 180;

            Debug.Write("OnSelecting");
        }
    }
}