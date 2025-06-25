using System;
using System.Net;
using System.Net.Mail;
using System.Text;

public class EmailService : IDisposable
{
    private readonly SmtpClient _server;
    private MailMessage _email;

    public EmailService()
    {
        // Configuración optimizada para Mailtrap
        _server = new SmtpClient("sandbox.smtp.mailtrap.io")
        {
            Port = 2525,
            Credentials = new NetworkCredential("c244cd59d10b5e", "60a07ac6126213"),
            EnableSsl = true,
            Timeout = 30000, // 30 segundos
            DeliveryMethod = SmtpDeliveryMethod.Network
        };

        // Fuerza TLS 1.2 (esencial para conexiones modernas)
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls13;
    }

    public void ArmarCorreo(string destinatario, string asunto, string cuerpo)
    {
        
        _email?.Dispose();

        _email = new MailMessage
        {
            From = new MailAddress("noresponder@tucurso.edu.ar"),
            Subject = asunto,
            Body = cuerpo,
            IsBodyHtml = true,
            BodyEncoding = Encoding.UTF8
        };
        _email.To.Add(destinatario.Trim());
    }

    public void EnviarEmail()
    {
        try
        {
            if (_email?.To.Count == 0)
                throw new InvalidOperationException("No hay destinatarios configurados");

            Console.WriteLine($"Intentando enviar a {_email.To[0].Address}...");
            _server.Send(_email);
            Console.WriteLine("✔ Correo enviado con éxito");
        }
        catch (SmtpException ex)
        {
            throw ex;
                
        }
    }

    public void Dispose()
    {
        _email?.Dispose();
        _server?.Dispose();
    }
}

