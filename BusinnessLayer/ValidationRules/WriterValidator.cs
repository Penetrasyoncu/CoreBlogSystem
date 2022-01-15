using EntityLayer.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinnessLayer.ValidationRules
{
    public class WriterValidator: AbstractValidator<Writer>
    {
        //AbstractValidator Abimiz Eklediğimiz Nuget Paketlerini kullanabilmek için.
        //Ve Bu AbstractValidator bir entity bekliyor Writer Sınıfını gönderdik.
        public WriterValidator()
        {
            RuleFor(x => x.WriterName).NotEmpty().WithMessage("Yazar Adı Soyadı Kısmı Boş Geçilemez");
            RuleFor(x => x.WriterMail).NotEmpty().WithMessage("Mail Adresi Boş Geçilemez");
            RuleFor(x => x.WriterPassword).NotEmpty().WithMessage("Şifre Kısmı Boş Geçilemez");
            RuleFor(x => x.WriterName).MinimumLength(5).WithMessage("Lütfen En Az 2 Karakter Girişi Yapınızı");
        }
    }
}