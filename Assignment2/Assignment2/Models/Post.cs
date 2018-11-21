using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Post
    {
        public long Id { get; set; }

        private string _key;

        public string Key
        {
            get
            {
                if (_key == null)
                {
                    _key = Regex.Replace(msg.ToLower(), "[^a-z0-9]", "-");
                }
                return _key;
            }
            set { _key = value; }
        }

        [Display(Name = "Message Title")]
        [Required]
        [StringLength(100, MinimumLength = 5, ErrorMessage = "Must be between 5 and 100 characters")]
        public string msg { get; set; }

        [DataType(DataType.MultilineText)]
        public string msg2 { get; set ; }
    }
}
