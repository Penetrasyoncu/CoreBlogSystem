using System.ComponentModel.DataAnnotations;

namespace CoreBlogSystem.Models
{
    public class RoleAddViewModel
    {
        [Required(ErrorMessage = "Lütfen Rol Adını Giriniz")]
        public string Name { get; set; }
    }
}