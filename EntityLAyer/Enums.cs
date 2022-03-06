using System.ComponentModel.DataAnnotations;

namespace CoreBlogSystem.Helpers
{
    public class Enums
    {
        public enum Status
        {
            [Display(Name = "Aktif")]
            Aktif = 1,
            [Display(Name = "Pasif")]
            Pasif = 2,
            [Display(Name = "Silinmiş")]
            Silinmis = 3,
        }
    }
}