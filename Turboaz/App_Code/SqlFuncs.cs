using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;

namespace Turboaz.App_Code
{
    public static class SqlFuncs
    {
        public static DataTable GetDataTableFromProcedure(string commandText)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-ME658FN\\SQLEXPRESS; Database= TurboazDb; Trusted_Connection=true");
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = connection;
            command.CommandText = commandText;
            try
            {
                connection.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                sqlDataAdapter.Fill(dataset);
                return dataset.Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        public static DataTable GetDataTableFromProcedure(string commandText, SqlParameter[] parametrs)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-ME658FN\\SQLEXPRESS; Database= TurboazDb; Trusted_Connection=true");
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = connection;
            command.CommandText = commandText;
            foreach (var item in parametrs)
            {
                command.Parameters.AddWithValue(item.ParameterName, item.Value);
            }
            try
            {
                connection.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                sqlDataAdapter.Fill(dataset);
                return dataset.Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        public static bool ExecuteProcedure(string commandText, SqlParameter[] parametrs)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-ME658FN\\SQLEXPRESS; Database= TurboazDb; Trusted_Connection=true");
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = connection;
            command.CommandText = commandText;
            foreach (var item in parametrs)
            {
                command.Parameters.AddWithValue(item.ParameterName, item.Value);
            }
            try
            {
                connection.Open();
                return command.ExecuteNonQuery()>0;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        public static DataTable GetAllCars() => GetDataTableFromProcedure("SelectAllCars");

        public static DataTable GetModels(int id)
        {
            SqlParameter[] sqlParametr = new SqlParameter[]
            {
                new SqlParameter("@MarkId",id)
            };

            return GetDataTableFromProcedure("GetModels", sqlParametr);
        }
        public static DataTable GetMarks() => GetDataTableFromProcedure("GetMarks");

        public static bool SaveNewCar(int CarMarkId, int CarModelId, int Price, string ImagePath, DateTime CreatedDate, int CreatedUserId, int Status)
        {
            try
            {
                SqlParameter[] sqlParametr = new SqlParameter[]
                {
                new SqlParameter("@CarMarkId",CarMarkId),
                new SqlParameter("@CarModelId",CarModelId),
                new SqlParameter("@Price",Price),
                new SqlParameter("@ImagePath",ImagePath),
                new SqlParameter("@CreatedDate",CreatedDate),
                new SqlParameter("@CreatedUserId",CreatedUserId),
                new SqlParameter("@Status",Status),
                };
                return ExecuteProcedure("InsertCar", sqlParametr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}