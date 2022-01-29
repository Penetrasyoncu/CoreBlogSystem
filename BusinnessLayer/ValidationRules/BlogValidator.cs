using EntityLayer.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinnessLayer.ValidationRules
{
    public class BlogValidator : AbstractValidator<Blog>
    {
        public BlogValidator()
        {
            RuleFor(x => x.BlogTitle).NotEmpty().WithMessage("Blog Başlığını Boş Bırakmamalısınız");
            RuleFor(x => x.BlogContent).NotEmpty().WithMessage("Blog İçeriğini Boş Bırakmamalısınız");
            RuleFor(x => x.BlogImage).NotEmpty().WithMessage("Blog Resmini Boş Bırakmamalısınız");
            RuleFor(x => x.BlogTitle).MaximumLength(150).WithMessage("Blog Başlığı 150 Karakterden Fazla Olmamalıdır.");
            RuleFor(x => x.BlogTitle).MinimumLength(5).WithMessage("Blog Başlığı 5 Karakterden Az Olmamalıdır.");            
            RuleFor(x => x.BlogContent).MinimumLength(5).WithMessage("Blog İçeriği 5 Karakterden Az Olmamalıdır.");            
        }
    }
}