using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Presentation.MemberPages
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = Membership.GetUser().ProviderUserKey.ToString();
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["UserId"] = Membership.GetUser().ProviderUserKey;
        }

        protected void ObjectDataSource2_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["UserId"] = Membership.GetUser().ProviderUserKey;
        }

        protected void StationsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            if (e.CommandName == "Delete")
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                string stationID =
                StationsListView.DataKeys[dataItem.DisplayIndex].Value.ToString();

                string memberUser = Membership.GetUser().ProviderUserKey.ToString();
                Guid id = new Guid(memberUser);

                try
                {
                    Business.DataObjectMethods.deleteFavourite(id, stationID);
                    Status.Text = "Station deleted from favorites";
                }
                catch (Exception ex)
                {
                    Status.Text = "Something went wrong :(";

                }

            }
        }

        protected void ObjectDataSource2_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["Original_UserId"] = Membership.GetUser().ProviderUserKey;
            
        }
    }
}