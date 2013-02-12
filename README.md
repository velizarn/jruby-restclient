### JRuby REST client

A simple HTTP REST client for JRuby

### How to use

```ruby
client = HTTP::RestClient.new("http://requestb.in/1eaorv81")
client.get()

CONSOLE.puts client.get_header('Content-Type')
CONSOLE.puts client.get_response_code()
CONSOLE.puts client.to_s
```

```text
> text/html; charset=utf-8
> 200
> ok
```

```ruby
client = HTTP::RestClient.new("http://requestb.in/api/v1/bins/1eaorv81")
client.get()

CONSOLE.puts client.get_header('Content-Type')
CONSOLE.puts client.get_response_code()
CONSOLE.puts client.to_s
```

```text
> application/json
> 200
> {"color": [150, 120, 170], "name": "1eaorv81", "private": false, "request_count": 11}
```

### Author

velizarn@webdevgears.com

### Dependencies

* [http://commons.apache.org/codec/](http://commons.apache.org/codec/)
* [http://commons.apache.org/logging/](http://commons.apache.org/logging/)
* [http://code.google.com/p/json-simple/](http://code.google.com/p/json-simple/)

### License

This bundle is dual-licensed under MIT and GPL licenses:

* [http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)
* [http://www.gnu.org/licenses/gpl.html](http://www.gnu.org/licenses/gpl.html)