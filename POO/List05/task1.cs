using System;
using System.IO;
using System.Net;
using System.Net.Mail;

class SmtpFacade
{
    public static void Send(string from, string to, string subject, string body, Stream attachment, string attachmentMimeType)
    {
        try
        {
            using SmtpClient client = new("your_smtp_server_address");
            client.Port = 587; // Adjust the port number if necessary
            client.Credentials = new NetworkCredential("your_smtp_username", "your_smtp_password");
            client.EnableSsl = true;

            using MailMessage mailMessage = new();

            mailMessage.From = new MailAddress(from);
            mailMessage.To.Add(to);
            mailMessage.Subject = subject;
            mailMessage.Body = body;

            if (attachment != null)
            {
                Attachment mailAttachment = new(attachment, attachmentMimeType);
                mailMessage.Attachments.Add(mailAttachment);
            }

            client.Send(mailMessage);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error occurred while sending email: " + ex.Message);
        }
    }
}