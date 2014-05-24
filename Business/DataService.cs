using Business;
using Data.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public static class DataService
    {
        public static string filename = "stations.txt";
        public static string result;
        public static bool error;

        public static bool ready = false;

        public static string path = @"C:\Users\Aline Borges\StationList.txt";

        public static List<StationModel> stationListInBackground;

        public static string networkUrl = "http://api.citybik.es/v2/networks";

        public static List<string> allStations = new List<string>();

        public static int NetworkSize;

        public static void GetStationList(string urlToCall)
        {

                WebClient client = new WebClient();
                client.DownloadStringCompleted += client_DownloadStringCompleted;
                client.DownloadStringAsync(new Uri(urlToCall));
        }

        public static void GetStationList(NetworkModel network)
        {
            
            string urlToCall = "http://api.citybik.es/v2/networks/" + network.id;

            WebClient client = new WebClient();
            client.DownloadStringCompleted += client_DownloadStringCompleted;
            client.DownloadStringAsync(new Uri(urlToCall));

        }

        /*
        public static void InsertToDatabase(AllNetworks allNetworks)
        {

            foreach (NetworkModel network in allNetworks.Networks ) {
                
                DataObjectMethods

            }

        }
        */


        public static void GetNetworkListFromFile()
        {
            string result = System.IO.File.ReadAllText(path);
            try
            {
                List<NetworkModel> networkList = JsonConvert.DeserializeObject<List<NetworkModel>>(result);
                foreach (NetworkModel network in networkList)
                {
                    Debug.WriteLine("<br/><br/><h>Network:</h>" + network.Name);
                    Debug.WriteLine("<br/><h>Number of Stations: </h>" + network.Stations.Count);
                    Debug.WriteLine("<br/><p><h>City: </h>" + network.Location.City + "</p>");
                    Debug.WriteLine("<br/><h><p>Country: </p></h>\n" + network.Location.Country);
                }

                

                Console.WriteLine("Number of networks: " + networkList.Count);
                Debug.WriteLine("Number of networks: " + networkList.Count);

                //addAllToDatabase(networkList);

                
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }

            
        }


        private static void client_DownloadStringCompletedInBackground(object sender, DownloadStringCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                result = e.Result;
                Debug.WriteLine("reading from API...");
                Debug.WriteLine(result);
                //saveText(filename, result);
                stationListInBackground = JsonConvert.DeserializeObject<List<StationModel>>(result);

            }
            else
            {
                Debug.WriteLine("ERROR downloading api");
                error = true;
              
            }
        }

        public static void GetNetworkList()
        {
            WebClient client = new WebClient();
            client.DownloadStringCompleted += client_DownloadStringNetworkCompleted;
            client.DownloadStringAsync(new Uri(networkUrl));
        }


        private static void client_DownloadStringCompleted(object sender, DownloadStringCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                string result = e.Result;
                allStations.Add(result);
                result.Insert(result.Length - 2, ",");
                System.IO.File.AppendAllText(DataService.path, result);
                
                Console.WriteLine("reading from API... " + NetworkSize);
                NetworkSize--;
                //Console.WriteLine(result);
                //saveText(filename, result);
                //List<StationModel> stationList = JsonConvert.DeserializeObject<List<StationModel>>(result);

                NetworkModel network = JsonConvert.DeserializeObject<NetworkModel>(result);

                List<StationModel> stationList = network.Stations;

                if (stationList != null)
                {
                    List<StationModel> stations = new List<StationModel>(stationList);

                    Console.WriteLine("station count = " + stations.Count);
                    

                    //allStations.Add(result);
                                    
                }

                /*
                    if (NetworkSize <= 0)
                    {
                        Console.WriteLine("I think I'm the last one");
                        Console.WriteLine("saving to file " + DataService.allStations.Count);

                        foreach (string text in DataService.allStations)
                        {
                            Console.WriteLine("saving network");
                            System.IO.File.AppendAllText(DataService.path, text);
                        }
                    }
                 */
                
            }
            else
            {
                Debug.WriteLine("ERROR downloading api of stations ");
                Console.WriteLine("ERROR downloading api of stations ");
                
            }
        }

        private static void addAllToDatabase(List<NetworkModel> networks)
        {
            foreach (NetworkModel network in networks)
            {
                System.Threading.Thread.Sleep(200);
                DataObjectMethods.insertNetwork(network.id, null, network.href, network.Location.Latitude, network.Location.Longitude, network.Location.City, network.Location.Country);
                Console.WriteLine("*****************************************\n");
                Console.WriteLine("Inserting network: " + network.Name);
                Console.WriteLine("*****************************************\n");

                foreach (StationModel station in network.Stations)
                {
                    DataObjectMethods.insertStation(station.id, station.Name, station.Latitude, station.Longitude, station.Free_bikes, station.Empty_slots, DateTime.Parse(station.Timestamp), network.id);
                    Console.WriteLine("Station inserted: " + station.Name);
                }
            }
        }

        private static void client_DownloadStringNetworkCompleted(object sender, DownloadStringCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                result = e.Result;
                Console.WriteLine("reading networks......");
                Debug.WriteLine(result);
                //saveText(filename, result);

                    try {
                        //List<NetworkModel> networkList = JsonConvert.DeserializeObject<NetworkModel[]>(result);
                        //NetworkModel[] networkList = JsonConvert.DeserializeObject<NetworkModel[]>(result);
                        AllNetworks networks = JsonConvert.DeserializeObject<AllNetworks>(result);

                        List<NetworkModel> networkList = networks.Networks;

                        if (networkList != null)
                        {

                            foreach (NetworkModel network in networkList)
                            {
                                Console.WriteLine("Network: " + network.Name);
                                GetStationList(network);
                                //System.IO.File.AppendAllText(path, result);

                            }
                            NetworkSize = networkList.Count;
                            Console.WriteLine("network size = " + networkList.Count);


                        }
                    } catch (Exception ex) {
                        Console.WriteLine(ex.Message);
                    }
                }
                else
                {
                    Console.WriteLine("Error downloading network information. Check your internet connection");
                    
                }
            
        }

        /*
        private static void saveText(string filename, string text)
        {
            using (IsolatedStorageFile isf =
                          IsolatedStorageFile.GetUserStoreForApplication())
            {
                using (IsolatedStorageFileStream rawStream =
                                 isf.CreateFile(filename))
                {
                    StreamWriter writer = new StreamWriter(rawStream);
                    writer.Write(text);
                    writer.Close();
                }
            }
        }
         */

        /*
        private static bool loadText(string filename, out string result)
        {
            result = "";
            using (IsolatedStorageFile isf =
                IsolatedStorageFile.GetUserStoreForApplication())
            {
                if (isf.FileExists(filename))
                {
                    try
                    {
                        using (IsolatedStorageFileStream rawStream =
                            isf.OpenFile(filename, System.IO.FileMode.Open))
                        {
                            StreamReader reader = new StreamReader(rawStream);
                            result = reader.ReadToEnd();
                            reader.Close();
                        }
                    }
                    catch
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            return true;
        }
         */
    }
}
