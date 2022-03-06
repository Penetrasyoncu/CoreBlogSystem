using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using EntityLayer.Concrete;
using FluentValidation;

namespace BusinnessLayer.ValidationRules
{
    public class CategoryValidator : AbstractValidator<Category>
    {
        public CategoryValidator()
        {
            RuleFor(x => x.CategoryName).NotEmpty().WithMessage("{CategoryName} Kısmı Boş Geçilemez");
            RuleFor(x => x.CategoryDescription).NotEmpty().WithMessage("{CategoryName} Kısmı Boş Geçilemez");
            RuleFor(x => x.CategoryName).MinimumLength(6).WithMessage("{CategoryName} En Az 50 Karakter Olmalıdır");            
            //RuleFor(x => x.CategoryDescription).Must(IsTextValid).WithMessage("Girilen Kategori Açıklaması Geçerli Değil, Lütfen Sadece Metin Giriniz");
            //RuleFor(x => x.CategoryName).Must(IsTextValid).WithMessage("Girilen Kategori Açıklaması Geçerli Değil, Lütfen Sadece Metin Giriniz");
        }

        private bool IsTextValid(string arg)
        {
            try
            {
                Regex validText = new Regex(@"^[a-zA-Z]+\s[0-9]+$");
                return validText.IsMatch(arg);
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}