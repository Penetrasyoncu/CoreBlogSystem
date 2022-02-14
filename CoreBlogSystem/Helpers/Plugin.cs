using CoreBlogSystem.Models.Plugins;

namespace CoreBlogSystem.Helpers
{
    public class Plugin
    {
        public static ToastModel Toast_Info(string head, string text)
        {
            return new ToastModel
            {
                heading = head,
                text = text,
                position = "top-right",
                loaderBg = "#ff6849",
                icon = "info",
                hideAfter = 2000,
                stack = 3
            };
        }

        public static ToastModel Toast_Warning(string head, string text)
        {
            return new ToastModel
            {
                isSuccess = false,
                heading = head,
                text = text,
                position = "top-right",
                loaderBg = "#ff6849",
                icon = "warning",
                hideAfter = 2000,
                stack = 3

            };
        }

        public static ToastModel Toast_Error(string head, string text)
        {
            return new ToastModel
            {
                isSuccess = false,
                heading = head,
                text = text,
                position = "top-right",
                loaderBg = "#ff6849",
                icon = "error",
                hideAfter = 2000,
                stack = 3

            };
        }

        public static SweetAlert SweetAlert_Success(string title, string text)
        {
            return new SweetAlert
            {
                title = title,
                text = text,
                type = "success"
            };
        }

        public static SweetAlert SweetAlert_Warning(string title, string text)
        {
            return new SweetAlert
            {
                title = title,
                text = text,
                type = "warning"
            };
        }

        public static SweetAlert SweetAlert_Error(string title, string text)
        {
            return new SweetAlert
            {
                title = title,
                text = text,
                type = "error"
            };
        }

        public static SweetAlert SweetAlert_Info(string title, string text)
        {
            return new SweetAlert
            {
                title = title,
                text = text,
                type = "info"
            };
        }
    }
}
