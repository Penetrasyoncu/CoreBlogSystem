using EntityLayer.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace BusinnessLayer.ValidationRules
{
    public class WriterValidator : AbstractValidator<Writer>
    {
        //AbstractValidator Abimiz Eklediğimiz Nuget Paketlerini kullanabilmek için.
        //Ve Bu AbstractValidator bir entity bekliyor Writer Sınıfını gönderdik.
        public WriterValidator()
        {
            RuleFor(x => x.WriterName).NotEmpty().WithMessage("{WriterName} Soyadı Kısmı Boş Geçilemez");
            RuleFor(x => x.WriterMail).NotEmpty().WithMessage("Mail Adresi Boş Geçilemez");
            RuleFor(x => x.WriterMail).EmailAddress().WithMessage("Geçerli Bir Mail Adresi Giriniz");
            RuleFor(x => x.WriterPassword).NotEmpty().WithMessage("Şifre Kısmı Boş Geçilemez");
            RuleFor(x => x.WriterName).MinimumLength(5).WithMessage("Lütfen En Az 2 Karakter Girişi Yapınızı");
            RuleFor(x => x.WriterPassword).MaximumLength(12).WithMessage("Maximum Karakter Sayısı 12 Olmalı");
            RuleFor(x => x.WriterPassword).MinimumLength(6).WithMessage("Minimum Karakter Sayısı 6 Olmalı");
            RuleFor(x => x.WriterPassword).Must(IsPasswordValid).WithMessage("En az bir harf ve bir sayı içermelidir."); ;
        }

        //Parolanın Büyüklük Küçüklük Ve Harf Kontrolünü Regex İle Kontrol Ediyoruz     
        private bool IsPasswordValid(string arg)
        {
            try
            {
                Regex regex = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$");
                return regex.IsMatch(arg);
            }
            catch
            {
                return false;
            }
        }
    }
}