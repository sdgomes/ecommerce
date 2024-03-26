﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Extesions
{
    public static class StringExtention
    {
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
    }
}