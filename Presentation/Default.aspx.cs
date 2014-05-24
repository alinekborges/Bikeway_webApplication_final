using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;
using System.Web.Security;

namespace Presentation
{
    public partial class Default : System.Web.UI.Page
    {
       // private DataTable dt;
        List<double> list = new List<double>();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                CheckBox checkBox = (CheckBox)LoginView1.FindControl("CheckBox1");

                if (checkBox.Checked)
                {
                    e.InputParameters["UserId"] = Membership.GetUser().ProviderUserKey;
                }
            }
        }

       /* private void GetClosestStations(string latitude, string longitude)
        {
            Debug.WriteLine("In getClosestStations");
            list = Business.Location.getNearbyStations(Double.Parse(latitude), Double.Parse(longitude));

            //StationsListView.DataSource = GetDataTableForObjectSource();
            //ObjectDataSource1.data
           // locationButtonClick();
            Response.Clear();
            Response.Write("");
            Response.End();
        }

        * */
        
        protected void StationsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ListView StationsListView;
            if (Request.IsAuthenticated)
            {

                //Label lbl = (Label)LoginView1.FindControl("Label1"); lbl.Text = "something";
                StationsListView = (ListView)LoginView1.FindControl("StationsListView");
                Label Status = (Label)LoginView1.FindControl("StatusLabel");

                if (e.CommandName == "Favorite")
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
                        Business.DataObjectMethods.insertFavourite(id, stationID, DateTime.Now);
                        Status.Text = "Go to your profile to see all your favorite stations";
                    }
                    catch (Exception ex)
                    {
                        Status.Text = "Is this station already a favorite? Something is wrong";
                        
                    }
                    // Find Controls/Retrieve values from the item  here

                    //ImageButton imageButton = (ImageButton)StationsListView.FindControl("ImageButton1");
                   // imageButton.ImageUrl = "/images/appbar.magnify.png";
                } 
                
            }
            //Label1.Text = "got clicked!";
            // save button Clicked
            
        }
        
        /*
        protected void onButton1Click( object sender, EventArgs args) {

            Debug.WriteLine("On button click");

            cityInput.Text="my click";

            //StationsListView.DataBind();
            ObjectDataSource datasource = new ObjectDataSource();


            //Adding the typename property and the SelectMethod that will return data
            datasource.TypeName = "Business.DataObjectMethods";
            datasource.SelectMethod = "selectClosestStations";
            datasource.OldValuesParameterFormatString = "original_{0}";
            datasource.ID = "DataSource";
            //datasource.SelectMethod = "GetData";

            //datasource.SelectParameters.Add(new Parameter("City", TypeCode.String, "brisbane"));
            //Setting the select method parameters
            datasource.SelectParameters.Add(new Parameter("LatLow", TypeCode.Double, this.LatitudeLowLabel.Text));
            datasource.SelectParameters.Add(new Parameter("LatHigh", TypeCode.Double, this.LatitudeHighLabel.Text));
            datasource.SelectParameters.Add(new Parameter("LongLow", TypeCode.Double, this.LongitudeLowLabel.Text));
            datasource.SelectParameters.Add(new Parameter("LongHig", TypeCode.Double, this.LongitudeHighLabel.Text));
            datasource.DataBind();

            datasource.Selecting += ObjectDataSource1_Selecting;

            Controls.Add(datasource);

            //StationsListView.DataSourceID = "DataSource";
            //Viewing the data using gridview
            StationsListView.DataSource = datasource;

            try
            {
                StationsListView.DataBind();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }

        }
        */

       //public DataSet GetDataTableForObjectSource()
       // {
       //     // do whatever you want to do here and
       //     // return the table with the data

       //     DataSet ds = new DataSet();
       //     ds.Tables.Add(dt);
       //     return ds;
       // }

    }
}