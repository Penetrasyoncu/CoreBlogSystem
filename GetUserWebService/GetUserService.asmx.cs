using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace GetUserWebService
{
    /// <summary>
    /// Summary description for GetUserService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class GetUserService : System.Web.Services.WebService
    {
        [WebMethod]
        public Bilgiler BilgileriGetir(int ID)
        {
            Bilgiler bilgilerimiz = new Bilgiler();

            //Buranın bir DB bağlantı cümlesi olduğunu tanımladık ilk olarak.
            string connection = ConfigurationManager.ConnectionStrings["DBConnect"].ConnectionString;

            using (SqlConnection DbConnection = new SqlConnection(connection))
            {
                SqlCommand command = new SqlCommand("SP_BILGILERIGETIR", DbConnection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter parameter = new SqlParameter
                {
                    ParameterName = "@IDParam",
                    Value = ID
                };

                command.Parameters.Add(parameter);
                DbConnection.Open();

                SqlDataReader dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                    bilgilerimiz.ID = Convert.ToInt32(dataReader["ID"]);
                    bilgilerimiz.Adi = dataReader["Adi"].ToString();
                    bilgilerimiz.Soyadi = dataReader["Soyadi"].ToString();
                }
            }

            return bilgilerimiz;
        }
    }
}
