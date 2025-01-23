using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Extesions
{
    public static class StringExtention
    {
        public static string ToBase64Encode(this string text)
        {
            return Base64UrlEncoder.Encode(text);
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
    }
}
