using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Special
    {   
        public int id { get; internal set; }
        public string Name { get; internal set; }
        public int amount { get; internal set; }
        public string date { get; internal set; }
        public string status { get; internal set; }
        public string label { get; internal set; }
    }
    public class SpecialsDataContext
    {
        public IEnumerable<Special> GetSpecials()
        {
            return new[]
            {
                new Special
                {
                    id = 763649,
                    Name = "Amber",
                    amount = 62,
                    date = "Oct 21, 2016",
                    status = "PENDING",
                    label = "label label-warning"
                },
                new Special
                {
                    id = 763648,
                    Name = "Steve",
                    amount = 122,
                    date = "Oct 21, 2016",
                    status = "COMPLETED",
                    label = "label label-success"
                },
                new Special
                {
                    id = 763651,
                    Name = "Roger",
                    amount = 186,
                    date = "Oct 17, 2016",
                    status = "SUCCESS",
                    label = "label label-success"
                },
                new Special
                {
                    id = 763650,
                    Name = "Michael",
                    amount = 34,
                    date = "Oct 18, 2016",
                    status = "FAILED",
                    label = "label label-danger"
                },
                new Special
                {
                    id = 763652,
                    Name = "Smith",
                    amount = 362,
                    date = "Oct 16, 2016",
                    status = "SUCCESS",
                     label = "label label-success"
                },
            };
        }
    }
}
