using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq.Expressions;

namespace list06task03.Helpers
{
    public static class HtmlHelpers
    {
        public static IHtmlContent Login(this IHtmlHelper htmlHelper, string userNameField, string passwordField)
        {
            var userNameInput = new TagBuilder("input");
            userNameInput.Attributes.Add("type", "text");
            userNameInput.Attributes.Add("name", userNameField);

            var passwordInput = new TagBuilder("input");
            passwordInput.Attributes.Add("type", "text");
            passwordInput.Attributes.Add("name", passwordField);

            var html = new HtmlContentBuilder()
                .AppendHtml(userNameInput)
                .AppendHtml(Environment.NewLine)
                .AppendHtml(passwordInput);

            return html;
        }

        public static IHtmlContent LoginFor<TModel, TProp1, TProp2>(
            this IHtmlHelper<TModel> htmlHelper,
            Expression<Func<TModel, TProp1>> userNameExpression,
            Expression<Func<TModel, TProp2>> passwordExpression)
        {
            var userNameFieldName = htmlHelper.NameFor(userNameExpression);
            var passwordFieldName = htmlHelper.NameFor(passwordExpression);

            var userNameInput = new TagBuilder("input");
            userNameInput.Attributes.Add("type", "text");
            userNameInput.Attributes.Add("name", userNameFieldName);

            var passwordInput = new TagBuilder("input");
            passwordInput.Attributes.Add("type", "text");
            passwordInput.Attributes.Add("name", passwordFieldName);

            var html = new HtmlContentBuilder()
                .AppendHtml(userNameInput)
                .AppendHtml(Environment.NewLine)
                .AppendHtml(passwordInput);

            return html;
        }
    }
}
