using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Data.Model;
using Newtonsoft.Json;

namespace Business
{
    public class Location
    {

        
        public static List<double> getNearbyStations(double latitude, double longitude)
        {
            List<double> list = new List<double>();
            double percentage = 0.0001;
            double percentage_long = percentage/2;

            double d_latitude = Math.Abs(latitude * percentage);
            double d_longitude = Math.Abs(longitude * percentage_long);
            double latitude_low = latitude - d_latitude;
            double latitude_high = latitude + d_latitude;
            double longitude_low = longitude - d_longitude;
            double longitude_high = longitude + d_longitude;

            list.Add(latitude_low);
            list.Add(latitude_high);
            list.Add(longitude_low);
            list.Add(longitude_high);
            
            return list;
            
        }
        /*
        public static List<StationModel> OrderNearbyStations(GeoCoordinate coordinate, List<StationBase> stationList)
        {
            List<StationModel> tempList = new List<StationModel>();
            foreach (StationBase station in stationList)
            {
                StationModel stationModel = StationModel.getStationModel(station);
                double distance = coordinate.GetDistanceTo(stationModel.GeoCoordinate);
                stationModel.distance = distance;
                tempList.Add(stationModel);
            }
            var nearbyList = tempList.OrderBy(x => x.distance).ToList();
            return nearbyList;
        }
         * */

        private static string getStationsJson(DataTable dataTable)
        {
            List<StationModel> list = new List<StationModel>();
            foreach (DataRow row in dataTable.Rows)
            {
                StationModel station = new StationModel();
                station.id = row["StationId"].ToString();
                station.Name = row["Name"].ToString();
                station.Latitude = Double.Parse(row["Latitude"].ToString());
                station.Longitude = Double.Parse(row["Longitude"].ToString());
                station.Free_bikes = Convert.ToInt32(row["FreeBikes"].ToString());
                station.Empty_slots = Convert.ToInt32(row["Slots"].ToString());
                list.Add(station); 
            }
            string json = JsonConvert.SerializeObject(list);

            return json;
        }
    }
}
