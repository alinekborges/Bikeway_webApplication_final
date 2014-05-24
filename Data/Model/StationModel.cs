using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Model
{
    public class StationModel
    {
        public string Name { get; set; }
        public string Timestamp { get; set; }
        public double Longitude { get; set; }
        public int Free_bikes { get; set; }
        public double Latitude { get; set; }
        public int Empty_slots { get; set; }
        public string id { get; set; }
    }
}
