namespace CoreBlogSystem.Models.Plugins
{
    public class ToastModel
    {
        public string heading { get; set; }
        public string text { get; set; }
        public string position { get; set; }
        public string loaderBg { get; set; }
        public string icon { get; set; }
        public int hideAfter { get; set; }
        public int stack { get; set; }
        public bool isSuccess { get; set; }
        public object data { get; set; }
    }
}