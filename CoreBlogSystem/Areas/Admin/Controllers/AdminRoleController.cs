using CoreBlogSystem.Areas.Admin.Models;
using CoreBlogSystem.Models;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CoreBlogSystem.Areas.Admin.Controllers
{
    [Area("Admin")]
    //Aşağıdaki Roles Kısmında Yazan Admin Roles Tablosundaki Role Adı. Burası Ali,Ayşe,Ahmet,Mehmet De Olabilirdi
    [Authorize(Roles = "Admin")]
    public class AdminRoleController : Controller
    {
        private readonly RoleManager<AppRole> _roleManager;
        private readonly UserManager<AppUser> _userManager;

        public AdminRoleController(RoleManager<AppRole> roleManager, UserManager<AppUser> userManager)
        {
            _roleManager = roleManager;
            _userManager = userManager;
        }

        //Rolleri Listeleme Sayfamız - Burada RoleManager Kullanarak Tüm Rolleri Listeledik.
        public IActionResult Index()
        {
            var roles = _roleManager.Roles.ToList();
            return View(roles);
        }

        //Burada ise yine RolManager kullanılarak Yeni Bir Rol Eklemesi Nasıl Yapılır Uyguladık
        [HttpGet]
        public IActionResult AddRole()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddRole(RoleAddViewModel roleViewModel)
        {
            if (ModelState.IsValid)
            {
                AppRole role = new AppRole
                {
                    Name = roleViewModel.Name
                };

                var result = await _roleManager.CreateAsync(role);
                if (result.Succeeded)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    foreach (var item in result.Errors)
                    {
                        ModelState.AddModelError("", item.Description);
                    }
                }
            }
            return View(roleViewModel);
        }

        //Burası İse Rolün Kendi Bilgileriini Güncellemek İçin Yazdığımız Action
        [HttpGet]
        public IActionResult UpdateRole(int id)
        {
            var values = _roleManager.Roles.FirstOrDefault(x => x.Id == id);
            RoleUpdateViewModel model = new RoleUpdateViewModel
            {
                RoleId = values.Id,
                RoleName = values.Name
            };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateRole(RoleUpdateViewModel model)
        {
            var values = _roleManager.Roles.Where(x => x.Id == model.RoleId).FirstOrDefault();
            values.Name = model.RoleName;
            var result = await _roleManager.UpdateAsync(values);
            if (result.Succeeded)
            {
                return RedirectToAction("Index");
            }
            return View(model);
        }

        //Rolün Kendisini Silmek İçin Kullandığımız Metod
        public async Task<IActionResult> DeleteRole(int id)
        {
            var values = _roleManager.Roles.Where(x => x.Id == id).FirstOrDefault();
            var result = await _roleManager.DeleteAsync(values);
            if (result.Succeeded)
            {
                return RedirectToAction("Index");
            }
            return View();
        }

        //Kullanıcı Rol Listelemesini Yapmak İçin Kullandık
        public IActionResult UserRoleList()
        {
            var roleList = _userManager.Users.ToList();
            return View(roleList);
        }

        //Burası ise en önemli yerlerden. Kullanıcıya Rol Ataması Yapacağımız Kısım GET/POST K
        [HttpGet]
        public async Task<IActionResult> AssignRole(int id)
        {
            var user = _userManager.Users.FirstOrDefault(x => x.Id == id);
            var roles = _roleManager.Roles.ToList();

            TempData["Userid"] = user.Id;

            var userRoles = await _userManager.GetRolesAsync(user);

            List<RoleAssignViewModel> model = new List<RoleAssignViewModel>();
            foreach (var item in roles)
            {
                RoleAssignViewModel smallModel = new RoleAssignViewModel();
                smallModel.RoleID = item.Id;
                smallModel.RoleName = item.Name;
                smallModel.Exist = userRoles.Contains(item.Name);
                model.Add(smallModel);
            }

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> AssignRole(List<RoleAssignViewModel> roleAssignViewModels)
        {
            var GetUserID = (int)TempData["Userid"];
            var user = _userManager.Users.FirstOrDefault(x => x.Id == GetUserID);

            foreach (var item in roleAssignViewModels)
            {
                if (item.Exist)
                {
                    await _userManager.AddToRoleAsync(user, item.RoleName);
                }
                else
                {
                    await _userManager.RemoveFromRoleAsync(user, item.RoleName);
                }
            }
            return RedirectToAction("UserRoleList");
        }
    }
}