namespace CoreBlogSystem.Models.Plugins
{
    public class AlertModel
    {
        public string title { get; set; }
        public string text { get; set; }
        public string type { get; set; }
        public bool isSuccess { get; set; }
    }
}