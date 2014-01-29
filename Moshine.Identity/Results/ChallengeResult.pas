namespace Moshine.Identity.Results;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Net,
  System.Net.Http,
  System.Threading,
  System.Threading.Tasks,
  System.Web.Http;

type
  ChallengeResult = public class(IHttpActionResult)
  public
    constructor(loginProvider: System.String; controller: ApiController);

    property LoginProvider: System.String;
    property Request: HttpRequestMessage;

    method ExecuteAsync(cancellationToken: CancellationToken): Task<HttpResponseMessage>;
  end;


implementation


constructor ChallengeResult(loginProvider: String; controller: ApiController);
begin
  self.LoginProvider := loginProvider;
  Request := controller.Request;
end;

method ChallengeResult.ExecuteAsync(cancellationToken: CancellationToken): Task<HttpResponseMessage>;
begin
  Request.GetOwinContext().Authentication.Challenge(LoginProvider);

  var response: HttpResponseMessage := new HttpResponseMessage(HttpStatusCode.Unauthorized);
  response.RequestMessage := Request;
  exit Task.FromResult<HttpResponseMessage>(response)
end;

end.
