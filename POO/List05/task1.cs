using System.IO;
using System.Net;
using System.Net.Mail;

// Fasada - Uproszczony 
class SmtpFacade
{
    public static void Send(string From, string To, string Subject, string Body, Stream? Attachment, string? AttachmentMimeType)
    {
        using MailMessage mailMessage = new();
        mailMessage.From = new MailAddress(From);
        mailMessage.To.Add(To);
        mailMessage.Subject = Subject;
        mailMessage.Body = Body;

        if (Attachment is not null)
        {
            Attachment attachment = new(Attachment, AttachmentMimeType);
            mailMessage.Attachments.Add(attachment);
        }

        using SmtpClient smtpClient = new("server_adress");
        smtpClient.Send(mailMessage);
    }
}