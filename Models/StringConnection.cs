namespace ecommerce.Models
{
    public class StringConnection
    {
        private string _name;
        private string _connectionString;

        public StringConnection()
        {

        }

        public StringConnection(string name, string connectionString)
        {
            _name = name;
            _connectionString = connectionString;
        }

        public string name
        {
            get { return _name; }
            set { _name = value; }
        }

        public string connectionString
        {
            get { return _connectionString; }
            set { _connectionString = value; }
        }
    }
}