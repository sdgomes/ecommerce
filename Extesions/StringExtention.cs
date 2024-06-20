using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Extesions
{
    public static class StringExtention
    {
        public static string ToBase64Encode(this string text)
        {
            return Base64UrlEncoder.Encode(text);
        }

        public static string ToBase64Decode(this string text)
        {
            return Base64UrlEncoder.Decode(text);
        }

        public static string Capitalize(this string text)
        {
            if (String.IsNullOrEmpty(text))
                return text;

            string phrase = text.ToLower();

            string[] words = phrase.Split(' ');
            string join = "";

            foreach (var word in words)
            {
                if (word.Trim() != "")
                    join += char.ToUpper(word[0]) + word.Substring(1) + " ";
            }

            return join.Trim();
        }

        public static string Avatar(this string texto)
        {
            if (texto == null)
                return "";

            if (texto.Length == 0)
                return "";

            string[] words = texto.Split(' ');
            string[] upper = new string[words.Length];
            if (words.Length > 1)
            {
                foreach (var (word, i) in words.Select((word, i) => (word, i)))
                {
                    if (word.Trim() != "")
                        upper[i] = char.ToUpper(word[0]).ToString();
                }
                string[] dois = new string[2];
                dois[0] = upper.First();
                dois[1] = upper.Last();
                return string.Join(" ", dois);
            }
            else
            {
                string[] dois = new string[2];
                dois[0] = char.ToUpper(texto[0]).ToString();
                dois[1] = char.ToUpper(texto[1]).ToString();
                return string.Join(" ", dois);
            }
        }

        static Dictionary<string, string> relative_time = new Dictionary<string, string>()
    {
        { "future" , "in {0}" },
        { "past" , "in {0}" },
        { "s" , "a few seconds ago" },
        { "m" , "a minute ago" },
        { "mm" , "{0} minutes ago" },
        { "h" , "an hour ago" },
        { "hh" , "{0} hours ago" },
        { "d" , "a day ago" },
        { "dd" , "{0} days ago" },
        { "M" , "a month ago" },
        { "MM" , "{0} months ago" },
        { "Y" , "a year ago" },
        { "YY" , "{0} years ago" },
        { "-s" , "in seconds" },
        { "-m" , "in a minute" },
        { "-mm" , "in {0} minutes" },
        { "-h" , "in an hour" },
        { "-hh" , "in {0} hours" },
        { "-d" , "in a day" },
        { "-dd" , "in {0} days" },
        { "-M" , "in a month" },
        { "-MM" , "in {0} months" },
        { "-Y" , "in a year" },
        { "-YY" , "in {0} years" },
    };

        /// <summary>
        /// replicate moment.js fromNow()
        /// </summary>
        /// <returns></returns>
        public static string from_now(this DateTime time_gmt)
        {
            // http://momentjs.com/docs/#/displaying/fromnow  : moment.js fromNow() doc

            var diff = DateTime.UtcNow - time_gmt;
            if (diff.TotalSeconds < 0)
            {
                return time_gmt.to_now();
            }
            else if (diff.TotalSeconds <= 45)
            {
                return relative_time["s"];
            }
            else if (diff.TotalSeconds <= 90)
            {
                return relative_time["m"];
            }
            else if (diff.TotalMinutes <= 45)
            {
                return string.Format(relative_time["mm"], Convert.ToInt32(diff.TotalMinutes));
            }
            else if (diff.TotalMinutes <= 90)
            {
                return relative_time["h"];
            }
            else if (diff.TotalHours <= 22)
            {
                return string.Format(relative_time["hh"], Convert.ToInt32(diff.TotalHours));
            }
            else if (diff.TotalHours <= 36)
            {
                return relative_time["d"];
            }
            else if (diff.TotalDays <= 25)
            {
                return string.Format(relative_time["dd"], Convert.ToInt32(diff.TotalDays));
            }
            else if (diff.TotalDays <= 45)
            {
                return relative_time["M"];
            }
            else if (diff.TotalDays <= 345)
            {
                return string.Format(relative_time["MM"], Convert.ToInt32(diff.TotalDays / (365.0 / 12.0)));
            }
            else if (diff.TotalDays <= 545)
            {
                return relative_time["Y"];
            }
            else if (diff.TotalDays > 545)
            {
                return string.Format(relative_time["YY"], Convert.ToInt32(diff.TotalDays / 365.0));
            }
            return "invalid";
        }

        /// <summary>
        /// replicate moment.js toNow()
        /// </summary>
        /// <param name="time_gmt"></param>
        /// <returns></returns>
        public static string to_now(this DateTime time_gmt)
        {
            // http://momentjs.com/docs/#/displaying/tonow  : moment.js toNow() doc

            var diff = time_gmt - DateTime.UtcNow;
            if (diff.TotalSeconds < 0)
            {
                return time_gmt.from_now();
            }
            else if (diff.TotalSeconds <= 45)
            {
                return relative_time["-s"];
            }
            else if (diff.TotalSeconds <= 90)
            {
                return relative_time["-m"];
            }
            else if (diff.TotalMinutes <= 45)
            {
                return string.Format(relative_time["-mm"], Convert.ToInt32(diff.TotalMinutes));
            }
            else if (diff.TotalMinutes <= 90)
            {
                return relative_time["-h"];
            }
            else if (diff.TotalHours <= 22)
            {
                return string.Format(relative_time["-hh"], Convert.ToInt32(diff.TotalHours));
            }
            else if (diff.TotalHours <= 36)
            {
                return relative_time["-d"];
            }
            else if (diff.TotalDays <= 25)
            {
                return string.Format(relative_time["-dd"], Convert.ToInt32(diff.TotalDays));
            }
            else if (diff.TotalDays <= 45)
            {
                return relative_time["-M"];
            }
            else if (diff.TotalDays <= 345)
            {
                return string.Format(relative_time["-MM"], Convert.ToInt32(diff.TotalDays / (365.0 / 12.0)));
            }
            else if (diff.TotalDays <= 545)
            {
                return relative_time["-Y"];
            }
            else if (diff.TotalDays > 545)
            {
                return string.Format(relative_time["-YY"], Convert.ToInt32(diff.TotalDays / 365.0));
            }
            return "invalid";
        }
    }
}
