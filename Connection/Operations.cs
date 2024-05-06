using crm.Helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Connection
{
    public class Operations : Access
    {
        private readonly string _connectionString;

        public Operations(Enums.ConnectionStringNames name)
        {
            _connectionString = ConnectionStringByName(name);
        }

        public void Execute(string query, SqlParameter[] parameters = null)
        {
            try
            {
                using (var conn = new SqlConnection(_connectionString))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                            cmd.Parameters.AddRange(parameters);

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<T> Select<T>(string query, SqlParameter[] parameters = null)
        {
            try
            {
                using (var conn = new SqlConnection(_connectionString))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                            cmd.Parameters.AddRange(parameters);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                            return GenericConverter.CreateList<T>(reader);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<T> SelectPrimitiveType<T>(string query, SqlParameter[] parameters = null)
            where T : struct
        {
            try
            {
                using (var conn = new SqlConnection(_connectionString))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                            cmd.Parameters.AddRange(parameters);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            var ReturnList = GenericConverter.CreatePrimitiveTypeList<T>(reader);

                            return ReturnList;
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<string> SelectString(string query, SqlParameter[] parameters = null)
        {
            try
            {
                using (var conn = new SqlConnection(_connectionString))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                            cmd.Parameters.AddRange(parameters);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            var ReturnList = GenericConverter.CreateStringsList(reader);

                            return ReturnList;
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public T Choose<T>(string query, SqlParameter[] parameters = null)
        {
            try
            {
                using (var conn = new SqlConnection(_connectionString))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                            cmd.Parameters.AddRange(parameters);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                            return GenericConverter.CreateList<T>(reader).FirstOrDefault();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public T ChoosePrimitiveType<T>(string query, SqlParameter[] parameters = null)
          where T : struct
        {
            try
            {
                using (var conn = new SqlConnection(_connectionString))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                            cmd.Parameters.AddRange(parameters);

                        var result = cmd.ExecuteScalar();

                        if (result != null)
                            return (T)TypeDescriptor
                                .GetConverter(typeof(T)).ConvertFromString(result.ToString());
                        else
                            return default;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public string ChooseString(string query, SqlParameter[] parameters = null)
        {
            try
            {
                using (var conn = new SqlConnection(_connectionString))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null && parameters.Length > 0)
                            cmd.Parameters.AddRange(parameters);

                        var result = cmd.ExecuteScalar();

                        if (result != null)
                            return result.ToString();
                        else
                            return String.Empty;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
