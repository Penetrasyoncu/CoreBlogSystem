using CoreBlogSystemWebService;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace CoreBlohSystemWebService
{
    /// <summary>
    /// Summary description for GetBlogService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class GetBlogService : System.Web.Services.WebService
    {

        [WebMethod]
        public Blogs GetBlogs(int BlogID)
        {
            Blogs blogs = new Blogs();
            string connection = ConfigurationManager.ConnectionStrings["CoreDBConnect"].ConnectionString;

            using (SqlConnection DbConnection = new SqlConnection(connection))
            {
                SqlCommand command = new SqlCommand("SP_GETBLOGS", DbConnection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter parameter = new SqlParameter
                {
                    ParameterName = "@BlogID",
                    Value = BlogID
                };

                command.Parameters.Add(parameter);
                DbConnection.Open();

                SqlDataReader dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                    blogs.BlogID = Convert.ToInt32(dataReader["BlogID"]);
                    blogs.BlogTitle = dataReader["BlogTitle"].ToString();
                    blogs.BlogContent = dataReader["BlogContent"].ToString();
                    blogs.BlogImage = dataReader["BlogImage"].ToString();
                    blogs.BlogCreateDate = (DateTime)dataReader["BlogCreateDate"];
                    blogs.BlogStatus = (int)dataReader["BlogStatus"];
                }
            }

            return blogs;
        }
    }
}
