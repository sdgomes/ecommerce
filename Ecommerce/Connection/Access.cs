using Ecommerce.Helpers;
using Ecommerce.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;

namespace Ecommerce.Connection
{
    public class Access
    {
        private static readonly string _connectionStringPath = Path.Combine(Directory.GetCurrentDirectory(), "Connection\\databases.json");

        protected string ConnectionStringByName(Enums.ConnectionStringNames name)
        {
            try
            {
                if (!File.Exists(_connectionStringPath))
                    throw new Exception
                        ("Não foi possível encontrar o arquivo contendo as connection strings! Verificar a existência do arquivo no servidor (pasta padrão: Connection\\databases.json).");

                string json = File.ReadAllText(_connectionStringPath);

                if (String.IsNullOrWhiteSpace(json))
                    throw new Exception("O arquivo contendo as connection strings está vazio ou não pôde ser lido!");

                var conString = JsonSerializer.Deserialize<List<StringConnection>>(json)
                .Where(cs => cs.name == name.ToString())
                .Select(cs => cs.connectionString)
                .FirstOrDefault();

                if (conString is null)
                    throw new Exception("A connection string especificada não foi encontrada no arquivo!");

                return conString;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}