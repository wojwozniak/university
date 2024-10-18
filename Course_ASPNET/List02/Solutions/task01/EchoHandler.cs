using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace List02Task01
{
    public class EchoHandler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            // Set return type to html
            context.Response.ContentType = "text/html";


            // Append headers
            StringBuilder headersBuilder = new StringBuilder();
            foreach (string header in context.Request.Headers.AllKeys)
            {
                headersBuilder.Append($"{header}: {context.Request.Headers[header]}<br/>");
            }


            // Check if it is GET or POST
            string httpMethod = context.Request.HttpMethod;

            // If it is POST, get entire request body
            string requestBody = "";
            if (context.Request.HttpMethod == "POST" && context.Request.InputStream.Length > 0)
            {
                context.Request.InputStream.Position = 0;
                using (var reader = new System.IO.StreamReader(context.Request.InputStream))
                {
                    requestBody = reader.ReadToEnd();
                }
            }

            // Build start of response
            string fullUrl = context.Request.Url.AbsoluteUri;
            StringBuilder responseBuilder = new StringBuilder();
            responseBuilder.Append("<html><body>");
            responseBuilder.Append($"<h2>Full URL: {fullUrl}</h2>");
            responseBuilder.Append($"<h3>HTTP Method: {httpMethod}</h3>");
            responseBuilder.Append("<h3>Headers:</h3>");
            responseBuilder.Append(headersBuilder.ToString());

            // Add request body
            if (!string.IsNullOrEmpty(requestBody))
            {
                responseBuilder.Append("<h3>Request Body:</h3>");
                responseBuilder.Append($"<pre>{requestBody}</pre>");
            }

            // Finish response
            responseBuilder.Append("</body></html>");

            // and send it
            context.Response.Write(responseBuilder.ToString());
        }

        // Required by IHttpHandler
        public bool IsReusable => false;
    }
}