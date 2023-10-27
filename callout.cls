//3. Make a basic http callout and print the result using system.debug

//https://postman-echo.com/get?foo1=bar1&foo2=bar2

public class HttpCalloutSample {

  // Pass in the endpoint to be used using the string url
  public String getCalloutResponseContents(String url) {

    // Instantiate a new Http object
    Http h = new Http();

     // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
    req.setMethod('GET');

    // Send the request, and return a response
    HttpResponse res = h.send(req);
    System.debug(res.getBody());
  }
}