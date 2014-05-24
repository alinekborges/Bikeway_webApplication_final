using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Model
{
    public class NetworkModel
    {
        //public string company { get; set; }
        //public Company Company { get; set; }
        public string href { get; set; }
        public Location Location { get; set; }
        public string Name { get; set; }
        public string id { get; set; }
        public List<StationModel> Stations { get; set; }

    }
}
