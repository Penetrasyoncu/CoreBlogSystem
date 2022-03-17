using System.ComponentModel.DataAnnotations;

namespace CoreBlogSystem.Models
{
    //Burası Kullanıcı Girişini Alacağımız ViewModel. Bu Bilgileri Kontrol Ederek Kullanıcıyı İçeri Alacağız
    public class UserSignUpViewModel
    {
        [Display(Name = "Ad Soyad")]
        [Required(ErrorMessage = "Lütfen Ad Soyad Giriniz")]
        public string NameSurname { get; set; }

        [Display(Name = "Şifre")]
        [Required(ErrorMessage = "Lütfen Şifre Giriniz")]
        public string Password { get; set; }

        [Display(Name = "Şifre Tekrar")]
        [Compare("Password", ErrorMessage = "Şifreler Uyuşmuyor")]
        public string ConfirmPassword { get; set; }

        [Display(Name = "Mail Adresi")]
        [Required(ErrorMessage = "Lütfen Mail Adresi Giriniz")]
        public string Mail { get; set; }

        [Display(Name = "Kullanıcı Adı")]
        [Required(ErrorMessage = "Lütfen Kullanıcı Adınızı Giriniz")]
        public string UserName { get; set; }

        [Display(Name = "KVKK Sözleşmesi")]
        [Required(ErrorMessage = "Lütfen KVKK Kutucuğunu Onaylayınız")]
        public bool ConfirmKVKK { get; set; }
    }
}