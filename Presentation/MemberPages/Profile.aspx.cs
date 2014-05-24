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

        protected void StationsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            //Label lbl = (Label)LoginView1.FindControl("Label1"); lbl.Text = "something";
            //StationsListView = (ListView)LoginView1.FindControl("StationsListView");
            //Label Status = (Label)LoginView1.FindControl("StatusLabel");

            if (e.CommandName == "Delete")
            {
                //ListViewItem itemClicked = e.Item;
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                string stationID =
                StationsListView.DataKeys[dataItem.DisplayIndex].Value.ToString();


                //Label1.Text = stationID;

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
                // Find Controls/Retrieve values from the item  here

                //ImageButton imageButton = (ImageButton)StationsListView.FindControl("ImageButton1");
                // imageButton.ImageUrl = "/images/appbar.magnify.png";


            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //Save city to database
        }
    }
}