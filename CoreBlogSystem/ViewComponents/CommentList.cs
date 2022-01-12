using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CoreBlogSystem.Models;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.ViewComponents
{
    public class CommentList : ViewComponent
    {
        public IViewComponentResult Invoke()
        {

            var commentValues = new List<UserComment>
            {
                new UserComment
                {
                    ID = 1,
                    UserName = "İbrahim"
                },

                new UserComment
                {
                    ID = 2,
                    UserName = "Ali"
                }
            };

            return View(commentValues);
        }
    }
}