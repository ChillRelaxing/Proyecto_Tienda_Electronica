namespace Tienda_Electronica.Services.Email
{
    public interface IEmailService
    {
        void SendEmail(string emailTo, string recepientName, string subject, string body);
        void SendEmail(string email, string subject, string body);
    }
}

