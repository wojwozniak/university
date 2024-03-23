using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List04
{
    public class TagBuilderTests
    {
        [Fact]
        public void GenerateHtmlWithIndentation()
        {
            TagBuilder tag = new("test", null)
            {
                IsIndented = true,
                Indentation = 4
            };

            tag.StartTag("parent")
                .AddAttribute("parentproperty1", "true")
                .AddAttribute("parentproperty2", "5")
                .StartTag("child1")
                    .AddAttribute("childproperty1", "c")
                    .AddContent("childbody")
                .EndTag()
                .StartTag("child2")
                    .AddAttribute("childproperty2", "c")
                    .AddContent("childbody")
                .EndTag()
                .EndTag()
                .StartTag("script")
                    .AddContent("$.scriptbody();")
                .EndTag();

            string expectedHtml = "<test>"
                                + "<parent parentproperty1='true' parentproperty2='5'>"
                                + "<child1 childproperty1='c'>childbody</child1>"
                                + "<child2 childproperty2='c'>childbody</child2>"
                                + "</parent>"
                                + "<script>$.scriptbody();</script>"
                                + "</test>";

            Assert.Equal(expectedHtml, tag.ToString());
        }
    }
}
