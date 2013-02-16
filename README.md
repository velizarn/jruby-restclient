### JRuby REST client

A simple HTTP REST client for JRuby

### How to use

Basic GET example
```ruby
client = HTTP::RestClient.new("http://requestb.in/1eaorv81")
client.get()

puts client.get_header('Content-Type')
puts client.get_response_code()
puts client.to_s
```

```text
> text/html; charset=utf-8
> 200
> ok
```

Get Content-Type and Status code for response
```ruby
client = HTTP::RestClient.new("http://requestb.in/api/v1/bins/1eaorv81")
client.get()

puts client.get_header('Content-Type')
puts client.get_response_code()
puts client.to_s
```

```text
> application/json
> 200
> {"color": [150, 120, 170], "name": "1eaorv81", "private": false, "request_count": 11}
```

Send POST data to httpbin.org/post
```jruby
client = HTTP::RestClient.new("http://httpbin.org/post")
client.setHeader('Content-Type', 'application/x-www-form-urlencoded')
client.post("p1=value21&p2=value2")

puts client.to_s
```

```json
{
  "args": {},
  "headers": {
    "Host": "httpbin.org",
    "Content-Length": "20",
    "Cache-Control": "no-cache",
    "Content-Type": "application/x-www-form-urlencoded",
    "Connection": "close",
    "User-Agent": "Java/1.7.0_10",
    "Accept": "text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2",
    "Pragma": "no-cache"
  },
  "url": "http://httpbin.org/post",
  "data": "",
  "json": null,
  "files": {},
  "form": {
    "p1": "value21",
    "p2": "value2"
  },
  "origin": "10.78.89.35"
}
```

Send POST data to httpbin.org/post and parse JSON response
```jruby
client = HTTP::RestClient.new("http://httpbin.org/post")
client.setHeader('Content-Type', 'application/x-www-form-urlencoded')
client.post("p1=value21&p2=value2")

jsonObj = client.to_json

puts jsonObj.get('headers').get('Host')
```

```text
httpbin.org
```

### Author

velizarn@webdevgears.com

### Dependencies

* [http://commons.apache.org/codec/](http://commons.apache.org/codec/)
* [http://commons.apache.org/logging/](http://commons.apache.org/logging/)
* [http://code.google.com/p/json-simple/](http://code.google.com/p/json-simple/)

### Changes

* 2013-02-16 - bugfix for replacing plus sign in Post parameters
* 2013-02-16 - Post method update
* 2013-02-16 - initial commit

### Resources

* [REST](ttp://en.wikipedia.org/wiki/Representational_state_transfer)
* [HTTP status codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
* [httpbin.org](http://httpbin.org/)
* [icanhazip.com](http://icanhazip.com/)
* [jruby.org/apidocs](http://www.jruby.org/apidocs/)

### License

This bundle is dual-licensed under MIT and GPL licenses:

* [http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)
* [http://www.gnu.org/licenses/gpl.html](http://www.gnu.org/licenses/gpl.html)