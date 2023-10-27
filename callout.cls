//3. Make a basic http callout and print the result using system.debug

//https://postman-echo.com/get?foo1=bar1&foo2=bar2

public class HttpCalloutSample {
  public String getCalloutResponseContents(String url) {
    Http h = new Http();    
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
    req.setMethod('GET');
    HttpResponse res = h.send(req);
    System.debug(res.getBody());
  }
}
