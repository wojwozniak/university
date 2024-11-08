using Microsoft.AspNetCore.Routing.Matching;
using Microsoft.AspNetCore.Routing.Patterns;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace list04task02
{
    class CustomEndpointSelector : EndpointSelector
    {
        public override async Task SelectAsync(HttpContext httpContext, CandidateSet candidates)
        {
            CandidateState selectedCandidate = new CandidateState();

            for (var i = 0; i < candidates.Count; i++)
            {
                if (candidates.IsValidCandidate(i))
                {
                    // zawsze wybieramy pierwszego poprawnego kandydata - można ofc zaiplementować to inaczej
                    selectedCandidate = candidates[i];
                    break;
                }
            }

            httpContext.SetEndpoint(selectedCandidate.Endpoint);
            httpContext.Request.RouteValues = selectedCandidate.Values;
        }
    }
}
