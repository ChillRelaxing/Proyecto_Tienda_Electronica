using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Tienda_Electronica.Data
{
    public class SqlDataAccess : ISqlDataAccess
    {
        private readonly IConfiguration _configuration;

        //NUEVO PRUEBAS
        private readonly string _connectionString;
        //

        public SqlDataAccess(IConfiguration configuration)
        {
            _configuration = configuration;

            //NUEVO
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
            //
        }

        public async Task<IEnumerable<T>> GetDataAsync<T, P>(
            string storedProcedure, P parameters, string connection = "DefaultConnection") //default
        {
            using IDbConnection dbConnection =
                new SqlConnection(_configuration.GetConnectionString(connection));

            return await dbConnection.QueryAsync<T>(
                storedProcedure,
                parameters,
                commandType: CommandType.StoredProcedure);
        }

        public async Task SaveDataAsync<T>(
            string storedProcedure,
            T parameters,
            string connection = "DefaultConnection") //default
        {
            using IDbConnection dbConnection =
                new SqlConnection(_configuration.GetConnectionString(connection));

            await dbConnection.ExecuteAsync(
                storedProcedure,
                parameters,
                commandType: CommandType.StoredProcedure);
        }

       
        //NUEVO
        public IDbConnection GetConnection() => new SqlConnection(_connectionString);
        //



    }
}
